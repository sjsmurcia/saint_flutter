# dbo.VW_ADM_ESTVEND

Vista: dbo.VW_ADM_ESTVEND
Origen: dbo.VW_ADM_ESTVEND.sql

## Columnas

- CODVEND: Columna proveniente de `R.CODVEND`.
- PERIODO: Columna proveniente de `R.PERIODO`.
- MTOVENTAS: Columna calculada a partir de la expresión `SUM(R.MTOVENTAS)`.
- COSTO: Columna calculada a partir de la expresión `SUM(R.COSTO)`.
- UTILIDAD: Columna calculada a partir de la expresión `SUM(R.UTILIDAD)`.
- MTOINGRESO: Columna calculada a partir de la expresión `SUM(R.MTOINGRESO)`.
- MTOCOMIVTA: Columna calculada a partir de la expresión `SUM(R.MTOCOMIVTA)`.
- MTOCOMICOB: Columna calculada a partir de la expresión `SUM(R.MTOCOMICOB)`.
