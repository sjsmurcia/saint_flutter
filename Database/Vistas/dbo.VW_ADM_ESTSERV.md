# dbo.VW_ADM_ESTSERV

Vista: dbo.VW_ADM_ESTSERV
Origen: dbo.VW_ADM_ESTSERV.sql

## Columnas

- CODSERV: Columna proveniente de `R.CODSERV`.
- PERIODO: Columna proveniente de `R.PERIODO`.
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
