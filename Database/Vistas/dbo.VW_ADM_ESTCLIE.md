# dbo.VW_ADM_ESTCLIE

Vista: dbo.VW_ADM_ESTCLIE
Origen: dbo.VW_ADM_ESTCLIE.sql

## Columnas

- CODCLIE: Columna proveniente de `R.CODCLIE`.
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
- NROPAGOS: Columna calculada a partir de la expresión `FLOOR(SUM(R.NROPAGOS))`.
- MTOPAGOS: Columna calculada a partir de la expresión `SUM(R.MTOPAGOS)`.
- NRONDEBITO: Columna calculada a partir de la expresión `FLOOR(SUM(R.NRONDEBITO))`.
- MTONDEBITO: Columna calculada a partir de la expresión `SUM(R.MTONDEBITO)`.
- NRONCREDITO: Columna calculada a partir de la expresión `FLOOR(SUM(R.NRONCREDITO))`.
- MTONCREDITO: Columna calculada a partir de la expresión `SUM(R.MTONCREDITO)`.
