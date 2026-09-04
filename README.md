# TweenStudio

Editor de vídeo y tweening nativo para Windows, escrito en Qt 6 / C++20. La interfaz sigue
el flujo de Alight Motion adaptado a ratón y teclado, sobre una composición visual inspirada
en OpenCut.

`README.txt` contiene el manual de usuario completo (funciones, flujo de trabajo y atajos).
Este documento cubre solo cómo compilar y trabajar sobre el código.

## Requisitos

| Componente | Versión usada |
|---|---|
| Qt | 6.8.3 `win64_mingw` (módulos Widgets, Multimedia, Svg) |
| Compilador | MinGW 13.1.0 (`tools_mingw1310`) |
| CMake | 3.21 o superior |
| FFmpeg | `ffmpeg.exe` y `ffprobe.exe` junto al ejecutable o en el `PATH` |

Instalación de la toolchain sin privilegios de administrador:

```sh
pip install --user aqtinstall
python -m aqt install-qt   windows desktop 6.8.3 win64_mingw -m qtmultimedia --outputdir C:/Qt
python -m aqt install-tool windows desktop tools_mingw1310                   --outputdir C:/Qt
```

`qtsvg` forma parte del paquete base y **no** debe pasarse en `-m`; hacerlo aborta la descarga.

## Compilar

```sh
tools\build.bat            # configura y compila en build\
tools\build.bat build-dev  # o en el directorio que indiques
```

El script usa `C:\Qt\Tools\mingw1310_64` y `C:\Qt\6.8.3\mingw_64` por defecto; puedes
apuntar a otra instalación con las variables de entorno `QT_MINGW_ROOT` y `QT_DIR`.

## Ejecutar

Un binario recién compilado **no arranca solo**: le faltan los plugins de plataforma y de
estilo de Qt, y se queda como una ventana que nunca llega a pintarse. Hay dos opciones:

```sh
tools\run.bat build\TweenStudio.exe          # añade las DLL de Qt y ffmpeg al PATH
```

o, para producir una carpeta portable autocontenida:

```sh
windeployqt --release --no-translations build\TweenStudio.exe
copy ffmpeg.exe ffprobe.exe build\
```

## Tests

Todo el arnés de pruebas vive dentro del propio ejecutable y devuelve `0` al pasar:

```sh
tools\run.bat build\TweenStudio.exe --self-test
tools\run.bat build\TweenStudio.exe --video-self-test test-assets\video-import-test.mp4
tools\run.bat build\TweenStudio.exe --preview-benchmark test-results\bench.json
tools\run.bat build\TweenStudio.exe --selection-shot docs\selection.png
```

`--self-test` devuelve `14` si no encuentra `ffmpeg.exe`: vive en la raíz del repositorio, no
junto al binario compilado. `tools\run.bat` ya se encarga de ponerlo en el `PATH`.

`tools/ab.sh` compara dos directorios de build ejecutando el benchmark varias veces y
reportando la mediana. Hace falta: las mediciones sueltas tienen una varianza de en torno al
30 % y sin medianas se leen regresiones que son solo ruido.

```sh
RUNS=5 BUILDS="build-base build-dev" bash tools/ab.sh
```

## Rendimiento

El benchmark reporta tres rutas de render que se comportan de forma muy distinta y conviene
no confundir:

| Métrica | Qué mide |
|---|---|
| `previewFps` | Reproducción, con el presupuesto de resolución reducido |
| `pausedEditFps` | Preview en reposo, calidad completa |
| `interactiveEditFps` | Repintado mientras se arrastra o se mueve un slider |

`interactiveEditFps` es la que percibe el usuario como fluidez al editar.

## Estructura

```
src/main.cpp              todo el programa (~950 líneas, estilo compacto)
assets/                   icono e iconos vectoriales OpenCut/Hugeicons
resources.qrc             empaquetado de assets/ en el binario
test-assets/              proyectos y medios de prueba
test-results/             resultados de benchmark
tools/                    scripts de build, ejecución y benchmark A/B
docs/screenshots/         capturas históricas de la interfaz
references/               copias de consulta de terceros (no versionadas)
```

`src/main.cpp` está escrito en un estilo muy denso, con líneas de varios miles de caracteres.
Para navegarlo conviene usar búsquedas por patrón con contexto (`grep -o -E`) en lugar de
leer el archivo entero.

## Licencias de terceros

`OPEN_SOURCE_REFERENCES.md` detalla las referencias de diseño empleadas: OpenCut (MIT),
sus iconos de `@hugeicons/core-free-icons` (MIT) y Concat (MPL-2.0), junto con los commits
auditados. El motor y las herramientas de TweenStudio son propios.
