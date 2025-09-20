# dbo.SAPROD

Tabla: dbo.SAPROD
Origen: dbo.SAPROD.sql

## Campos

- Id (int): Identificador interno/autonumÃ©rico del registro.
- CodProd (varchar(15)): CÃ³digo de producto.
- Descrip (varchar(40)): DescripciÃ³n del registro.
- CodInst (int): CÃ³digo de i n s t.
- Activo (smallint): Indicador de activo (0/1).
- Descrip2 (varchar(40)): DescripciÃ³n adicional (2).
- Descrip3 (varchar(40)): DescripciÃ³n adicional (3).
- Refere (varchar(15)): Referencia/cÃ³digo alterno.
- Marca (varchar(20)): Marca asociada.
- Unidad (varchar(3)): Unidad de medida principal.
- UndEmpaq (varchar(3)): Unidad de empaque.
- CantEmpaq (decimal(28, 4)): Cantidad por empaque.
- Precio1 (decimal(28, 4)): Precio de venta (segÃºn lista/escala indicada).
- PrecioI1 (decimal(28, 4)): Precio de venta (segÃºn lista/escala indicada).
- PrecioIU1 (decimal(28, 4)): Precio de venta (segÃºn lista/escala indicada).
- Precio2 (decimal(28, 4)): Precio de venta (segÃºn lista/escala indicada).
- PrecioU2 (decimal(28, 4)): Precio de venta (segÃºn lista/escala indicada).
- PrecioI2 (decimal(28, 4)): Precio de venta (segÃºn lista/escala indicada).
- PrecioIU2 (decimal(28, 4)): Precio de venta (segÃºn lista/escala indicada).
- Precio3 (decimal(28, 4)): Precio de venta (segÃºn lista/escala indicada).
- PrecioU3 (decimal(28, 4)): Precio de venta (segÃºn lista/escala indicada).
- PrecioI3 (decimal(28, 4)): Precio de venta (segÃºn lista/escala indicada).
- PrecioIU3 (decimal(28, 4)): Precio de venta (segÃºn lista/escala indicada).
- PrecioU (decimal(28, 4)): Precio de venta (segÃºn lista/escala indicada).
- CostAct (decimal(28, 4)): Campo CostAct (decimal(28, 4)).
- CostPro (decimal(28, 4)): Campo CostPro (decimal(28, 4)).
- CostAnt (decimal(28, 4)): Campo CostAnt (decimal(28, 4)).
- Existen (decimal(28, 4)): Existencias actuales.
- ExUnidad (decimal(28, 4)): Existencias expresadas en unidad alternativa.
- Compro (decimal(28, 4)): Cantidad comprometida.
- Pedido (decimal(28, 4)): Cantidad pedida.
- Minimo (decimal(28, 4)): Stock mÃ­nimo permitido.
- Maximo (decimal(28, 4)): Stock mÃ¡ximo permitido.
- Tara (decimal(28, 4)): Tara o peso del empaque.
- Factor (decimal(28, 4)): Factor de conversiÃ³n (p. ej., tasa de cambio).
- DEsComp (smallint): Indicador: compuesto/agrupado (0/1).
- DEsComi (smallint): Indicador: afecta comisiÃ³n (0/1).
- DEsSeri (smallint): Indicador: maneja seriales (0/1).
- EsReten (smallint): Indicador de aplica retenciÃ³n (0/1).
- DEsLote (smallint): Indicador: maneja lotes (0/1).
- DEsVence (smallint): Indicador: maneja vencimiento (0/1).
- EsImport (smallint): Indicador: producto importado (0/1).
- EsExento (smallint): Indicador: exento de impuestos (0/1).
- EsEnser (smallint): Indicador/flag de configuraciÃ³n (0/1).
- EsOferta (smallint): Indicador/flag de configuraciÃ³n (0/1).
- EsPesa (smallint): Indicador: producto pesable (0/1).
- EsEmpaque (smallint): Indicador: usa empaque (0/1).
- ExDecimal (smallint): Campo ExDecimal (smallint).
- DiasEntr (int): Campo DiasEntr (int).
- FechaUV (datetime): Fecha de Ãºltima venta.
- FechaUC (datetime): Fecha de Ãºltima compra.
- DiasTole (int): DÃ­as de tolerancia de pago.
- Peso (decimal(28, 4)): Campo Peso (decimal(28, 4)).
- Volumen (decimal(28, 4)): Campo Volumen (decimal(28, 4)).
- UndVol (varchar(3)): Campo UndVol (varchar(3)).
- PriceEx (smallint): Campo PriceEx (smallint).
- CreatedAt (datetime): Fecha y hora de creaciÃ³n del registro.
- UpdatedAt (datetime): Fecha y hora de Ãºltima actualizaciÃ³n del registro.
- Id (ASC): Identificador interno/autonumÃ©rico del registro.

