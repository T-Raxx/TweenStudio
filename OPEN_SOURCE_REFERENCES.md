# Referencias de diseño open source

## OpenCut

- Repositorio: https://github.com/OpenCut-app/OpenCut
- Fuente entregada por Sam: `C:\Users\aulit\Downloads\OpenCut-main\OpenCut-main`
- Referencia Classic: `references/OpenCutClassic/`
- Licencia del proyecto de referencia: MIT
- Archivos auditados: `apps/desktop/src/shell.rs`, `apps/desktop/src/theme.rs`
  y los paneles del editor Classic.

TweenStudio 2.4.5 reimplementa en Qt/C++ la composición visual completa de OpenCut:
cabecera mínima, navegador vertical de recursos, visor central, inspector vertical
por modos, paneles redimensionables y timeline inferior con selector de escena.
Los colores se sustituyeron por una paleta verde inspirada en Alight Motion. Las
herramientas y el motor de TweenStudio siguen siendo propios.

Los iconos de navegación y herramientas se generan desde
`@hugeicons/core-free-icons` 3.3.0, el mismo sistema de iconos usado por OpenCut.
La copia de referencia y el generador reproducible están en
`references/OpenCutIcons/`; el paquete declara licencia MIT.

## WolfCut (referencia visual)

El reproductor y la timeline negros siguen las capturas de WolfCut entregadas por
Sam: cuatro pistas vacías, regla SMPTE, cabezal rojo, toolbar compacta y controles
de transporte. No se incorporó código de WolfCut.

## Concat (referencia histórica de interacción)

- Repositorio: https://github.com/jub0t/Concat
- Commit auditado: `8938ec34fbc28bd9790dee3a676dabc529105aa0`
- Licencia: MPL-2.0
- Copia de consulta: `references/Concat/`

Concat solo permanece como referencia histórica para gestos de timeline,
autosave y previsualización inmediata; ya no define la interfaz de TweenStudio.

## Patrones adaptados en 2.4.5

- De Concat: preview de menor resolución durante reproducción, reloj de audio y cálculo de waveform una sola vez fuera del render.
- De OpenCut: separar la escritura del valor estático de la creación explícita de keyframes.
- Implementación propia en Qt/C++; no se copió código del motor Rust/React.

## Optimizaciones 2.4.5

- Resolución de preview determinada por el tamaño real en pantalla, caché de miniaturas y sombras, culling temporal de beats y keyframes, waveform limitada a los píxeles visibles y repintado parcial del cabezal.
- Los easings de movimiento y Bend se escriben inmediatamente sobre el tramo del keyframe seleccionado, sin crear keyframes nuevos.

## Optimizaciones 2.4.5

- Presupuesto de resolución por cantidad de capas activas, malla Bend reducida y suavizado desactivado únicamente durante playback.
- Proxy de vídeo de hasta 960 px para el reproductor, conservando los fotogramas originales para exportación.
- Culling de capas transparentes o fuera del lienzo y cuantización de blur animado para reutilizar caché.
