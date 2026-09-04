#!/usr/bin/env bash
# Alternating A/B benchmark: 3 runs per build, reports the median of each metric.
set -u
cd "C:/Users/trabajo/Downloads/TweenStudio"
export PATH="/c/Qt/Tools/mingw1310_64/bin:/c/Qt/6.8.3/mingw_64/bin:/c/Users/trabajo/Downloads/TweenStudio:$PATH"

RUNS=${RUNS:-3}
BUILDS=${BUILDS:-"build-base build-dev"}

for build in $BUILDS; do
  for i in $(seq 1 "$RUNS"); do
    "./$build/TweenStudio.exe" --preview-benchmark "test-results/ab-$build-$i.json" >/dev/null 2>&1
  done
done

python - "$RUNS" $BUILDS <<'PY'
import json, sys, statistics
runs = int(sys.argv[1]); builds = sys.argv[2:]
keys = [('previewFps', 'playback 960x540'), ('pausedEditFps', 'edicion 1280x720'), ('timelineFps', 'timeline')]
data = {}
for b in builds:
    data[b] = {}
    for k, _ in keys:
        vals = []
        for i in range(1, runs + 1):
            try:
                vals.append(json.load(open(f'test-results/ab-{b}-{i}.json'))[k])
            except Exception:
                pass
        data[b][k] = statistics.median(vals) if vals else float('nan')

head = f"{'metric':26}" + ''.join(f'{b:>14}' for b in builds)
if len(builds) == 2:
    head += f"{'x':>9}"
print(head)
for k, label in keys:
    row = f'{label:26}' + ''.join(f'{data[b][k]:14.2f}' for b in builds)
    if len(builds) == 2:
        a, c = data[builds[0]][k], data[builds[1]][k]
        row += f'{c / a:8.2f}x'
    print(row)
PY
