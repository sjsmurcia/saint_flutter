# dbo.VW_ADM_ESTCOMPDAILY

Vista: dbo.VW_ADM_ESTCOMPDAILY
Origen: dbo.VW_ADM_ESTCOMPDAILY.sql

## Columnas

- CODSUCU: Columna proveniente de `R.CODSUCU`.
- PERIODO: Columna proveniente de `R.PERIODO`.
- NROCOMPS: Columna calculada a partir de la expresión `FLOOR(SUM(R.NROCOMPS))`.
- MTOCOMPRA: Columna calculada a partir de la expresión `SUM(R.MTOCOMPRA)`.
- NRODEVOL: Columna calculada a partir de la expresión `FLOOR(SUM(R.NRODEVOL))`.
- MTODEVOL: Columna calculada a partir de la expresión `SUM(R.MTODEVOL)`.
- CREDITO: Columna calculada a partir de la expresión `SUM(R.CREDITO)`.
- CONTADO: Columna calculada a partir de la expresión `SUM(R.CONTADO)`.
- MTOTOTAL: Columna calculada a partir de la expresión `SUM(R.MTOTOTAL)`.
- MTORETIVA: Columna calculada a partir de la expresión `SUM(R.MTORETIVA)`.
- MTORETIMP: Columna calculada a partir de la expresión `SUM(R.MTORETIMP)`.
