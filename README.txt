TWEENSTUDIO 2.4.5
=================

Editor nativo de tweening para Windows con una interfaz sencilla inspirada en
el flujo móvil de Alight Motion, adaptada a ratón y teclado.

Interfaz OpenCut completa con colores Alight Motion:
- Cabecera mínima con proyecto, autosave, ajustes y exportación.
- Navegador de medios con barra vertical de herramientas a la izquierda.
- Reproductor central WolfCut oscuro con timecode, transporte, zoom y pantalla completa.
- Inspector lateral por iconos: Vídeo, Efectos, Ajustar e IA.
- Timeline WolfCut negra con cuatro pistas visibles, cabezal rojo, reloj SMPTE,
  rejilla temporal, toolbar de edición y capas multipista ordenadas por profundidad.
- Iconos vectoriales reales del sistema OpenCut/Hugeicons en navegación, propiedades,
  reproductor, acciones y timeline; el icono principal es el de TweenStudio.
- Paneles redimensionables arrastrando los separadores de 4 px.
- Zoom de previsualización 25/50/100/200/400 %, Ctrl+rueda y calidad seleccionable.
- Preview adaptativo según el tamaño real del elemento en pantalla; durante reproducción reduce trabajo adicional sin tocar la exportación.
- Calidad dinámica según capas simultáneas: conserva más detalle en la capa seleccionada y abarata las capas secundarias durante playback.
- Bend usa una malla ligera durante reproducción y recupera alta precisión al pausar o exportar.
- Los vídeos usan proxies JPEG de hasta 960 px en el reproductor; la exportación sigue leyendo los fotogramas completos.
- Benchmark de estrés 2.4.5: mediana de 68,14 FPS con seis capas 1080p animadas y 809 actualizaciones/s del cabezal.
- Sliders de efectos con actualización visual inmediata y sin crear keyframes automáticos.
- Los diamantes del inspector son la única acción que crea keyframes nuevos.
- Keyframes de movimiento, Bend y efectos arrastrables directamente en la timeline.
- El easing de movimiento o Bend cambia al instante cuando el cabezal está sobre el keyframe; no requiere volver a pulsar añadir.
- Clic derecho sobre keyframes de capa abre aceleración, desaceleración, lineal y la galería completa.
- Copiar y pegar keyframes con Ctrl+C/Ctrl+V conserva valores y easing, y coloca
  la copia exactamente en la posición actual del cabezal.
- Controles compactos anterior/añadir/siguiente con iconos, como en CapCut.
- Flechas izquierda/derecha avanzan el cabezal exactamente un frame al enfocar la timeline.
- Pista de audio independiente con forma de onda generada automáticamente al importar.
- El análisis de ondas corre en segundo plano; Auto beats sigue siendo una acción separada.
- Importación de MP4, MOV, MKV, WEBM, AVI y M4V como capas visuales completas.
- Los vídeos generan una caché local de fotogramas para previsualización, efectos,
  división y exportación precisa; su audio se sincroniza si no hay otra pista.
- Scrollbar y rueda vertical para acceder a todas las pistas, incluido el audio.
- Caja de selección sobre el elemento visual con ocho tiradores y control de rotación.
- Ctrl+rueda aplica zoom únicamente al panel bajo el puntero: timeline o reproductor.
- Zoom horizontal de timeline con Ctrl+rueda o los botones +/-; Shift+rueda desplaza.
- Ajuste magnético conmutable, Deshacer/Rehacer (Ctrl+Z/Ctrl+Y) y autosave a 1,5 s.

Flujo rapido:
1. Pulsa "Importar" y elige "Imagen / PNG" o "Vídeo" para crear una capa independiente.
2. Pulsa "Audio" para importar una canción o "Extraer" para usar el audio de un vídeo.
3. Pulsa "Auto beats" para colocar los marcadores automáticamente.
4. Selecciona una capa y abre "Transformar" para mover, hacer Stretch o inclinarla.
5. Abre "Efectos" y arrastra Bend, Shake u otra tarjeta exclusivamente sobre la
   pista morada de efectos; soltarla dentro del clip de vídeo no está permitido.
6. Arrastra el centro del efecto para moverlo o sus extremos blancos para recortarlo.
7. Sitúa el cabezal y usa los diamantes del inspector para crear los keyframes.
8. Haz clic derecho en un diamante de la timeline para elegir su easing.
9. En "Ajustar > Salida" elige o escribe el color del fondo y pulsa "EXPORTAR".

Herramientas:
- Creación de capas de texto, formas vectoriales rasterizadas y colores sólidos.
- Duplicar, renombrar, bloquear, dividir y recortar temporalmente capas.
- Modos de mezcla Normal, Multiplicar, Trama, Añadir, Superponer, Oscurecer y Aclarar.
- Chroma key configurable con tolerancia y suavidad.
- Brillo, contraste, saturación, desenfoque, recorte, sombra y glow.
- Fundido de entrada/salida y rango temporal individual por capa.
- Capas de imagen con posición, Stretch X/Y, rotación, inclinación y opacidad.
- Centro giratorio personalizado: pulsa "Añadir centro" y arrastra el círculo verde
  sobre el reproductor o escribe sus coordenadas Centro X/Y.
- El círculo del centro solo aparece al seleccionar su capa y jamás sale exportado.
- Tamaño en porcentajes, bloqueo de proporción, voltear y restablecer.
- Presets animados: Squash + Stretch, Zoom Pop, Rebote, Giro 360, Aparecer y Shake.
- Bend real sobre arco circular con origen Izquierda/Derecha/Arriba/Abajo.
- Ángulo Bend de -180° a 180°, inicio parcial y curvas del mismo lado o en S.
- Todos los parámetros de Bend se guardan y pueden animarse con keyframes.
- Movimiento y Bend usan pistas de keyframes independientes.
- Cada pista tiene su propio easing y puede reproducirse simultáneamente.
- Biblioteca de 24 efectos reales: Bend, Squash, Shake, Pulse, Spin, Fade, Blur,
  Wobble, Wave, Jitter, Zoom, Slide, Flicker, Swing, Bounce, Drift, Pop, Stretch,
  Tilt, Pendulum, Tremor, Float, Flash y Focus.
- La biblioteca de efectos funciona mediante arrastrar y soltar sobre una capa concreta.
- Los clips de efecto viven encima del clip de su capa, como en la timeline de CapCut.
- Los extremos blancos recortan o estiran el efecto y reescalan sus keyframes.
- Los diamantes blancos muestran los keyframes internos de cada efecto.
- Cada clip mantiene un mínimo de dos keyframes para definir antes y después.
- Los efectos nuevos ya no incluyen animaciones prefabricadas: comienzan neutros
  con dos keyframes y se configuran manualmente desde el inspector.
- Un diamante seleccionado se resalta en turquesa y Delete/Backspace lo elimina;
  los dos keyframes mínimos quedan protegidos.
- El easing pertenece al tramo que sale del keyframe izquierdo. Al seleccionar el
  keyframe derecho del último tramo, la interfaz edita correctamente dicho tramo.
- Al arrastrar el cabezal pausado, se ajusta al centro de cualquier keyframe situado
  a 13 píxeles o menos. Durante reproducción este snap se desactiva.
- Clic derecho en un keyframe: acelerar, desacelerar, ambas, lineal, copiar o borrar.
- Galería visual con 15 curvas predefinidas ordenadas por forma.
- Inspector contextual con Intensidad, Velocidad, Detalle y Mezcla animables.
- Las capas superiores de la timeline se renderizan delante de las inferiores.
- Arrastrar verticalmente un clip de capa cambia inmediatamente su profundidad.
- La rueda desplaza verticalmente la timeline cuando hay muchas capas.
- El render usa una caché LRU limitada a 256 MB y omite filas invisibles de la timeline.
- Dividir afecta solo al efecto seleccionado o solo a la capa seleccionada, sin duplicar
  el contenido ajeno; también está disponible desde el menú contextual.
- Dividir conserva imagen, transformaciones, Bend y efectos en ambos fragmentos; Deshacer
  restaura atómicamente las capas y la selección.
- Los clips desplazados hacia la izquierda quedan recortados al área temporal y nunca
  pintan miniaturas encima de los nombres o controles de pista.
- Delete y Backspace eliminan la selección activa sin comerse texto de los editores.
- Squash, Zoom, Shake y otros presets ya no bloquean la animación Bend.
- Paneles fijos de capas, lienzo, timeline e inspector para evitar ventanas perdidas.
- Visibilidad individual por capa desde su casilla.
- Keyframes, easing y timeline con snapping a beats.
- Waveform de audio y reproducción sincronizada.
- Detector automático de beats mediante flujo espectral FFT.
- Extracción y exportación de audio con FFmpeg.
- Guardado y apertura de proyectos .tween.json.
- Exportación H.264/AAC con fondo configurable por selector visual o valor #RRGGBB.

Atajos:
Espacio: reproducir/pausar
K: añadir o actualizar keyframe
Delete/Backspace: borrar efecto o capa seleccionada
Ctrl+B: dividir solo la selección en el cabezal
Ctrl+C / Ctrl+V: copiar y pegar el keyframe seleccionado
Ctrl+Z / Ctrl+Y: deshacer y rehacer
Ctrl+S: guardar proyecto

Runtime: Qt 6 y FFmpeg incluidos en la distribución portable.
