# dbo.VW_ADM_ESTPROD

Vista: dbo.VW_ADM_ESTPROD
Origen: dbo.VW_ADM_ESTPROD.sql

## Columnas

- CODPROD: Columna proveniente de `R.CODPROD`.
- PERIODO: Columna proveniente de `R.PERIODO`.
- UNIDAD: Columna calculada a partir de la expresión `IIF(R.ESUNID = 0, P.UNIDAD, P.UNDEMPAQ)`.
- EXINICIAL: Columna calculada a partir de la expresión `SUM(R.EXINICIAL)`.
- CNTVENTAS: Columna calculada a partir de la expresión `SUM(R.CNTVENTAS)`.
- MTOVENTAS: Columna calculada a partir de la expresión `SUM(R.MTOVENTAS)`.
- COSTO: Columna calculada a partir de la expresión `SUM(R.COSTOVTAS)`.
- UTILIDAD: Columna calculada a partir de la expresión `SUM(R.UTILIDAD)`.
- CNTCOMPRA: Columna calculada a partir de la expresión `SUM(R.CNTCOMPRAS)`.
- MTOCOMPRA: Columna calculada a partir de la expresión `SUM(R.MTOCOMPRAS)`.
- CNTCARGOS: Columna calculada a partir de la expresión `SUM(R.CNTCARGOS)`.
- MTOCARGOS: Columna calculada a partir de la expresión `SUM(R.MTOCARGOS)`.
- CNTDESCARG: Columna calculada a partir de la expresión `SUM(R.CNTDESCARG)`.
- MTODESCARG: Columna calculada a partir de la expresión `SUM(R.MTODESCARG)`.
- EXFINAL: Columna calculada a partir de la expresión `SUM(R.EXFINAL)`.
