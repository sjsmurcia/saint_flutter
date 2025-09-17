# dbo.SASERV

Tabla: dbo.SASERV
Origen: dbo.SASERV.sql

## Campos

- Id (int): Identificador interno/autonumÃ©rico del registro.
- CodServ (varchar(10)): CÃ³digo de s e r v.
- CodInst (int): CÃ³digo de i n s t.
- Descrip (varchar(40)): DescripciÃ³n del registro.
- Descrip2 (varchar(40)): DescripciÃ³n adicional (2).
- Descrip3 (varchar(40)): DescripciÃ³n adicional (3).
- Clase (varchar(10)): Clase o categorÃ­a del registro.
- Activo (smallint): Indicador de activo (0/1).
- Unidad (varchar(6)): Unidad de medida principal.
- Precio1 (decimal(28, 4)): Precio de venta (segÃºn lista/escala indicada).
- PrecioI1 (decimal(28, 4)): Precio de venta (segÃºn lista/escala indicada).
- Precio2 (decimal(28, 4)): Precio de venta (segÃºn lista/escala indicada).
- PrecioI2 (decimal(28, 4)): Precio de venta (segÃºn lista/escala indicada).
- Precio3 (decimal(28, 4)): Precio de venta (segÃºn lista/escala indicada).
- PrecioI3 (decimal(28, 4)): Precio de venta (segÃºn lista/escala indicada).
- Costo (decimal(28, 4)): Costo del producto (actual/promedio/anterior segÃºn sufijo).
- EsExento (smallint): Indicador: exento de impuestos (0/1).
- EsReten (smallint): Indicador de aplica retenciÃ³n (0/1).
- EsPorCost (smallint): Indicador/flag de configuraciÃ³n (0/1).
- UsaServ (smallint): Campo UsaServ (smallint).
- Comision (decimal(28, 4)): Campo Comision (decimal(28, 4)).
- EsPorComi (smallint): Indicador: afecta comisiÃ³n (0/1).
- FechaUV (datetime): Fecha de Ãºltima venta.
- FechaUC (datetime): Fecha de Ãºltima compra.
- EsImport (smallint): Indicador: producto importado (0/1).
- EsVenta (smallint): Indicador/flag de configuraciÃ³n (0/1).
- EsCompra (smallint): Indicador: compuesto/agrupado (0/1).
- PriceEx (smallint): Campo PriceEx (smallint).
- CreatedAt (datetime): Fecha y hora de creaciÃ³n del registro.
- UpdatedAt (datetime): Fecha y hora de Ãºltima actualizaciÃ³n del registro.
- Id (ASC): Identificador interno/autonumÃ©rico del registro.

