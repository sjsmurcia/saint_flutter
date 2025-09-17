# dbo.VW_ADM_ESTVENTDAILY

Vista: dbo.VW_ADM_ESTVENTDAILY
Origen: dbo.VW_ADM_ESTVENTDAILY.sql

## Columnas

- CODSUCU: Columna proveniente de `R.CODSUCU`.
- PERIODO: Columna proveniente de `R.PERIODO`.
- NROFACTS: Columna calculada a partir de la expresión `FLOOR(SUM(R.NROFACTS))`.
- MTOFACTS: Columna calculada a partir de la expresión `SUM(R.MTOFACTS)`.
- NRODEVOL: Columna calculada a partir de la expresión `FLOOR(SUM(R.NRODEVOL))`.
- MTODEVOL: Columna calculada a partir de la expresión `SUM(R.MTODEVOL)`.
- CREDITO: Columna calculada a partir de la expresión `SUM(R.CREDITO)`.
- CONTADO: Columna calculada a partir de la expresión `SUM(R.CONTADO)`.
- MTOTOTAL: Columna calculada a partir de la expresión `SUM(R.MTOTOTAL)`.
- COSTO: Columna calculada a partir de la expresión `SUM(R.COSTO)`.
- UTILIDAD: Columna calculada a partir de la expresión `SUM(R.UTILIDAD)`.
- MTORETENIMP: Columna calculada a partir de la expresión `SUM(R.MTORETENIMP)`.
