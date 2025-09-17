# dbo.VW_ADM_PRODUCTOS

Vista: dbo.VW_ADM_PRODUCTOS
Origen: dbo.VW_ADM_PRODUCTOS.sql

## Columnas

- CodInst: Columna proveniente de `I.CodInst`.
- DEsComi: Columna proveniente de `I.DEsComi`.
- DEsCorrel: Columna proveniente de `I.DEsCorrel`.
- DigitosC: Columna proveniente de `I.DigitosC`.
- Descto: Columna proveniente de `I.Descto`.
- CodProd: Columna proveniente de `P.CodProd`.
- Descrip: Columna proveniente de `P.Descrip`.
- Descrip2: Columna proveniente de `P.Descrip2`.
- Descrip3: Columna proveniente de `P.Descrip3`.
- DescripAll: Columna calculada a partir de la expresión `P.Descrip + COALESCE (' ' + P.Descrip2, '') + COALESCE (' ' + P.Descrip3, '')`.
- ESFREEP: Columna calculada a partir de la expresión `(CASE SUBSTRING(P.DESCRIP, 1, 1) WHEN '?' THEN 1 ELSE 0 END)`.
- CostAct: Columna proveniente de `P.CostAct`.
- CostPro: Columna proveniente de `P.CostPro`.
- CostAnt: Columna proveniente de `P.CostAnt`.
- Precio1: Columna proveniente de `P.Precio1`.
- PrecioI1: Columna proveniente de `P.PrecioI1`.
- Precio2: Columna proveniente de `P.Precio2`.
- PrecioI2: Columna proveniente de `P.PrecioI2`.
- Precio3: Columna proveniente de `P.Precio3`.
- PrecioI3: Columna proveniente de `P.PrecioI3`.
- PrecioU: Columna proveniente de `P.PrecioU`.
- PrecioIU1: Columna proveniente de `P.PrecioIU1`.
- PrecioU2: Columna proveniente de `P.PrecioU2`.
- PrecioIU2: Columna proveniente de `P.PrecioIU2`.
- PrecioU3: Columna proveniente de `P.PrecioU3`.
- PrecioIU3: Columna proveniente de `P.PrecioIU3`.
- EsReten: Columna proveniente de `P.EsReten`.
- FechaUV: Columna proveniente de `P.FechaUV`.
- FechaUC: Columna proveniente de `P.FechaUC`.
- DiasTole: Columna proveniente de `P.DiasTole`.
- Refere: Columna proveniente de `P.Refere`.
- Marca: Columna proveniente de `P.Marca`.
- Unidad: Columna proveniente de `P.Unidad`.
- Activo: Columna proveniente de `P.Activo`.
- UndEmpaq: Columna proveniente de `P.UndEmpaq`.
- CantEmpaq: Columna proveniente de `P.CantEmpaq`.
- Peso: Columna proveniente de `P.Peso`.
- Factor: Columna proveniente de `P.Factor`.
- PriceEx: Columna proveniente de `P.PriceEx`.
- Volumen: Columna proveniente de `P.Volumen`.
- UndVol: Columna proveniente de `P.UndVol`.
- Existen: Columna proveniente de `P.Existen`.
- ExUnidad: Columna proveniente de `P.ExUnidad`.
- CantCom: Columna calculada a partir de la expresión `ISNULL(E.cantcom, 0)`.
- CantPed: Columna calculada a partir de la expresión `ISNULL(E.cantped, 0)`.
- UnidCom: Columna calculada a partir de la expresión `ISNULL(E.unidcom, 0)`.
- UnidPed: Columna calculada a partir de la expresión `ISNULL(E.unidped, 0)`.
- Minimo: Columna proveniente de `P.Minimo`.
- Maximo: Columna proveniente de `P.Maximo`.
- DEsVence: Columna proveniente de `P.DEsVence`.
- EsPesa: Columna proveniente de `P.EsPesa`.
- Tara: Columna proveniente de `P.Tara`.
- EsImport: Columna proveniente de `P.EsImport`.
- EsExento: Columna proveniente de `P.EsExento`.
- EsOferta: Columna proveniente de `P.EsOferta`.
- EsEnser: Columna proveniente de `P.EsEnser`.
- EsEmpaque: Columna proveniente de `P.EsEmpaque`.
- ExDecimal: Columna proveniente de `P.ExDecimal`.
- DEsComp: Columna proveniente de `P.DEsComp`.
- DEsSeri: Columna proveniente de `P.DEsSeri`.
- DEsLote: Columna proveniente de `P.DEsLote`.
