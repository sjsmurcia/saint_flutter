# dbo.VW_ADM_ESTTARJ

Vista: dbo.VW_ADM_ESTTARJ
Origen: dbo.VW_ADM_ESTTARJ.sql

## Columnas

- CODTARJ: Columna proveniente de `R.CODTARJ`.
- PERIODO: Columna proveniente de `R.PERIODO`.
- MTOVENTAS: Columna calculada a partir de la expresión `SUM(R.MTOVENTAS)`.
- IMPUESTO: Columna calculada a partir de la expresión `SUM(R.IMPUESTO)`.
- MTORETENIMP: Columna calculada a partir de la expresión `SUM(R.RETENCT)`.
- MTOINGRESO: Columna calculada a partir de la expresión `SUM(R.MTOINGRESO)`.
