# dbo.VW_ADM_SERVICIOSTAX

Vista: dbo.VW_ADM_SERVICIOSTAX
Origen: dbo.VW_ADM_SERVICIOSTAX.sql

## Columnas

- CodInst: Columna proveniente de `I.CodInst`.
- Descto: Columna proveniente de `I.Descto`.
- DEsComi: Columna proveniente de `I.DEsComi`.
- DEsCorrel: Columna proveniente de `I.DEsCorrel`.
- DigitosC: Columna proveniente de `I.DigitosC`.
- codserv: Columna proveniente de `S.codserv`.
- Descrip: Columna proveniente de `S.Descrip`.
- Descrip2: Columna proveniente de `S.Descrip2`.
- Descrip3: Columna proveniente de `S.Descrip3`.
- DescripAll: Columna calculada a partir de la expresión `S.Descrip + COALESCE (' ' + S.Descrip2, '') + COALESCE (' ' + S.Descrip3, '')`.
- ESFREEP: Columna calculada a partir de la expresión `(CASE SUBSTRING(S.DESCRIP, 1, 1) WHEN '?' THEN 1 ELSE 0 END)`.
- Precio1: Columna proveniente de `S.Precio1`.
- preciotx1: Columna calculada a partir de la expresión `(S.precio1 + isnull(tx.mtofijo, 0) + S.precio1 * isnull(tx.mtotax, 0))`.
- PrecioI1: Columna proveniente de `S.PrecioI1`.
- Precio2: Columna proveniente de `S.Precio2`.
- preciotx2: Columna calculada a partir de la expresión `(S.precio2 + isnull(tx.mtofijo, 0) + S.precio2 * isnull(tx.mtotax, 0))`.
- PrecioI2: Columna proveniente de `S.PrecioI2`.
- Precio3: Columna proveniente de `S.Precio3`.
- preciotx3: Columna calculada a partir de la expresión `(S.precio3 + isnull(tx.mtofijo, 0) + S.precio3 * isnull(tx.mtotax, 0))`.
- PrecioI3: Columna proveniente de `S.PrecioI3`.
- EsReten: Columna proveniente de `S.EsReten`.
- Unidad: Columna proveniente de `S.Unidad`.
- PriceEx: Columna proveniente de `S.PriceEx`.
- Activo: Columna proveniente de `S.Activo`.
- EsImport: Columna proveniente de `S.EsImport`.
- EsExento: Columna proveniente de `S.EsExento`.
- EsVenta: Columna proveniente de `s.EsVenta`.
- EsCompra: Columna proveniente de `s.EsCompra`.
- Clase: Columna proveniente de `S.Clase`.
- Costo: Columna proveniente de `S.Costo`.
- EsPorCost: Columna proveniente de `S.EsPorCost`.
- usaServ: Columna proveniente de `S.usaServ`.
- comision: Columna proveniente de `S.comision`.
- esporcomi: Columna proveniente de `S.esporcomi`.
