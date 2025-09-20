# Verificación de documentación de la base de datos

Este registro resume la verificación solicitada sobre la documentación en formato Markdown de las tablas y vistas del esquema `Database`.

## Tablas (`Database/Tablas`)
- Se compararon los 143 scripts SQL de tablas con los archivos de documentación en `Database/Campos`.
- Todos los scripts cuentan con su archivo `.md` correspondiente, por lo que no fue necesario generar contenido adicional.
- La lista consolidada puede consultarse en `Database/Campos/README.md`.

## Vistas (`Database/Vistas`)
- Se detectó que los 31 scripts SQL de vistas no tenían documentación en Markdown.
- Se generó un archivo `.md` por cada vista con el detalle de columnas, almacenados junto al script fuente.
- Se añadió `Database/Vistas/README.md` como índice de referencia rápida.
- El contenido se creó automáticamente analizando cada sentencia `SELECT` para identificar columnas directas y campos calculados.

## Cómo mantener esta documentación
1. Si se agregan nuevas tablas, ejecutar la misma verificación asegurando que `Database/Campos` contenga el par `.md`.
2. Para nuevas vistas, replicar el proceso automático o editar manualmente las descripciones dentro de `Database/Vistas/`.
3. Registrar cualquier ajuste futuro en este documento para preservar el historial de cambios.
