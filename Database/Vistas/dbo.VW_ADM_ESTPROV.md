# dbo.VW_ADM_ESTPROV

Vista: dbo.VW_ADM_ESTPROV
Origen: dbo.VW_ADM_ESTPROV.sql

## Columnas

- CODPROV: Columna proveniente de `R.CODPROV`.
- DESCRIP: Columna proveniente de `P.DESCRIP`.
- PERIODO: Columna proveniente de `R.PERIODO`.
- NROCOMPS: Columna calculada a partir de la expresión `FLOOR(SUM(R.NROCOMPS))`.
- MTOCOMPRA: Columna calculada a partir de la expresión `SUM(R.MTOCOMPRA)`.
- NRODEVOL: Columna calculada a partir de la expresión `FLOOR(SUM(R.NRODEVOL))`.
- MTODEVOL: Columna calculada a partir de la expresión `SUM(R.MTODEVOL)`.
- CREDITO: Columna calculada a partir de la expresión `SUM(R.CREDITO)`.
- CONTADO: Columna calculada a partir de la expresión `SUM(R.CONTADO)`.
- MTORETENIMP: Columna calculada a partir de la expresión `SUM(R.MTORETENIMP)`.
- NROPAGOS: Columna calculada a partir de la expresión `FLOOR(SUM(R.NROPAGOS))`.
- MTOPAGOS: Columna calculada a partir de la expresión `SUM(R.MTOPAGOS)`.
- NRONDEBITO: Columna calculada a partir de la expresión `FLOOR(SUM(R.NRONDEBITO))`.
- MTONDEBITO: Columna calculada a partir de la expresión `SUM(R.MTONDEBITO)`.
- NRONCREDITO: Columna calculada a partir de la expresión `FLOOR(SUM(R.NRONCREDITO))`.
- MTONCREDITO: Columna calculada a partir de la expresión `SUM(R.MTONCREDITO)`.
