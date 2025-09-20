# dbo.VW_ADM_ESTMECA

Vista: dbo.VW_ADM_ESTMECA
Origen: dbo.VW_ADM_ESTMECA.sql

## Columnas

- CODMECA: Columna proveniente de `R.CODMECA`.
- PERIODO: Columna proveniente de `R.PERIODO`.
- MES: Columna calculada a partir de la expresión `FORMAT(CONVERT(DATE, R.PERIODO + '-01'), 'MMM-yyyy', 'es-US')`.
- CNTVENTAS: Columna calculada a partir de la expresión `SUM(R.CNTVENTAS)`.
- MTOVENTAS: Columna calculada a partir de la expresión `SUM(R.MTOVENTAS)`.
- COSTO: Columna calculada a partir de la expresión `SUM(R.COSTO)`.
- UTILIDAD: Columna calculada a partir de la expresión `SUM(R.UTILIDAD)`.
- COMISION: Columna calculada a partir de la expresión `SUM(R.COMISION)`.
