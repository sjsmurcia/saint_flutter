# dbo.VW_ADM_SERVICIOS

Vista: dbo.VW_ADM_SERVICIOS
Origen: dbo.VW_ADM_SERVICIOS.sql

## Columnas

- CodInst: Columna proveniente de `I.CodInst`.
- DEsCorrel: Columna proveniente de `I.DEsCorrel`.
- DigitosC: Columna proveniente de `I.DigitosC`.
- Descto: Columna proveniente de `I.Descto`.
- DEsComi: Columna proveniente de `I.DEsComi`.
- CodServ: Columna proveniente de `S.CodServ`.
- Descrip: Columna proveniente de `S.Descrip`.
- Descrip2: Columna proveniente de `S.Descrip2`.
- Descrip3: Columna proveniente de `S.Descrip3`.
- DescripAll: Columna calculada a partir de la expresión `S.Descrip + COALESCE (' ' + S.Descrip2, '') + COALESCE (' ' + S.Descrip3, '')`.
- ESFREEP: Columna calculada a partir de la expresión `(CASE SUBSTRING(S.DESCRIP, 1, 1) WHEN '?' THEN 1 ELSE 0 END)`.
- Precio1: Columna proveniente de `S.Precio1`.
- PrecioI1: Columna proveniente de `S.PrecioI1`.
- Precio2: Columna proveniente de `S.Precio2`.
- PrecioI2: Columna proveniente de `S.PrecioI2`.
- Precio3: Columna proveniente de `S.Precio3`.
- PrecioI3: Columna proveniente de `S.PrecioI3`.
- EsReten: Columna proveniente de `S.EsReten`.
- Unidad: Columna proveniente de `S.Unidad`.
- PriceEx: Columna proveniente de `S.PriceEx`.
- Activo: Columna proveniente de `S.Activo`.
- EsImport: Columna proveniente de `S.EsImport`.
- EsExento: Columna proveniente de `S.EsExento`.
- EsVenta: Columna proveniente de `S.EsVenta`.
- EsCompra: Columna proveniente de `S.EsCompra`.
- Clase: Columna proveniente de `S.Clase`.
- Costo: Columna proveniente de `S.Costo`.
- EsPorCost: Columna proveniente de `S.EsPorCost`.
- UsaServ: Columna proveniente de `S.UsaServ`.
- Comision: Columna proveniente de `S.Comision`.
- EsPorComi: Columna proveniente de `S.EsPorComi`.
