# dbo.SAITEMOPI

Tabla: dbo.SAITEMOPI
Origen: dbo.SAITEMOPI.sql

## Campos

- Id (int): Identificador interno/autonumÃ©rico del registro.
- CodSucu (varchar(5)): CÃ³digo de sucursal.
- TipoOpI (varchar(1)): Campo TipoOpI (varchar(1)).
- NumeroD (varchar(20)): NÃºmero de documento principal.
- NroLinea (int): NÃºmero correlativo asociado.
- NroLineaC (int): NÃºmero correlativo asociado.
- CodItem (varchar(15)): CÃ³digo de i t e m.
- CodUbic (varchar(10)): CÃ³digo de ubicaciÃ³n.
- CodUbic2 (varchar(10)): CÃ³digo de u b i c2.
- Descrip1 (varchar(40)): Campo Descrip1 (varchar(40)).
- Descrip2 (varchar(40)): DescripciÃ³n adicional (2).
- Descrip3 (varchar(40)): DescripciÃ³n adicional (3).
- Descrip4 (varchar(40)): Campo Descrip4 (varchar(40)).
- Descrip5 (varchar(40)): Campo Descrip5 (varchar(40)).
- Descrip6 (varchar(40)): Campo Descrip6 (varchar(40)).
- Descrip7 (varchar(40)): Campo Descrip7 (varchar(40)).
- Descrip8 (varchar(40)): Campo Descrip8 (varchar(40)).
- Descrip9 (varchar(40)): Campo Descrip9 (varchar(40)).
- Descrip10 (varchar(40)): Campo Descrip10 (varchar(40)).
- Refere (varchar(15)): Referencia/cÃ³digo alterno.
- Signo (smallint): Campo Signo (smallint).
- Tara (decimal(28, 4)): Tara o peso del empaque.
- Factor (decimal(28, 4)): Factor de conversiÃ³n (p. ej., tasa de cambio).
- CantidadD (decimal(28, 4)): Campo CantidadD (decimal(28, 4)).
- CantidadT (decimal(28, 4)): Campo CantidadT (decimal(28, 4)).
- Cantidad (decimal(28, 4)): Campo Cantidad (decimal(28, 4)).
- CantidadO (decimal(28, 4)): Campo CantidadO (decimal(28, 4)).
- ExistAntU (decimal(28, 4)): Campo ExistAntU (decimal(28, 4)).
- ExistAnt (decimal(28, 4)): Campo ExistAnt (decimal(28, 4)).
- ExistAntU2 (decimal(28, 4)): Campo ExistAntU2 (decimal(28, 4)).
- ExistAnt2 (decimal(28, 4)): Campo ExistAnt2 (decimal(28, 4)).
- CantidadC (decimal(28, 4)): Campo CantidadC (decimal(28, 4)).
- CantidadU (decimal(28, 4)): Campo CantidadU (decimal(28, 4)).
- CantidadA (decimal(28, 4)): Campo CantidadA (decimal(28, 4)).
- CantidadUA (decimal(28, 4)): Campo CantidadUA (decimal(28, 4)).
- Costo (decimal(28, 4)): Costo del producto (actual/promedio/anterior segÃºn sufijo).
- Descto (decimal(28, 4)): Descuento general aplicado.
- CodMeca (varchar(10)): CÃ³digo de m e c a.
- TotalItem (decimal(28, 4)): Campo TotalItem (decimal(28, 4)).
- NroUnicoL (int): NÃºmero correlativo asociado.
- NroLote (varchar(20)): NÃºmero correlativo asociado.
- Precio (decimal(28, 4)): Precio de venta (segÃºn lista/escala indicada).
- PrecioU (decimal(28, 4)): Precio de venta (segÃºn lista/escala indicada).
- FechaE (datetime): Fecha de emisiÃ³n/entrada.
- FechaL (datetime): Fecha asociada al registro.
- FechaV (datetime): Fecha de vencimiento.
- EsServ (smallint): Indicador/flag de configuraciÃ³n (0/1).
- EsUnid (smallint): Indicador/flag de configuraciÃ³n (0/1).
- EsFreeP (smallint): Indicador/flag de configuraciÃ³n (0/1).
- EsPesa (smallint): Indicador: producto pesable (0/1).
- EsExento (smallint): Indicador: exento de impuestos (0/1).
- UsaServ (smallint): Campo UsaServ (smallint).
- DEsLote (smallint): Indicador: maneja lotes (0/1).
- DEsSeri (smallint): Indicador: maneja seriales (0/1).
- CreatedAt (datetime): Fecha y hora de creaciÃ³n del registro.
- UpdatedAt (datetime): Fecha y hora de Ãºltima actualizaciÃ³n del registro.
- Id (ASC): Identificador interno/autonumÃ©rico del registro.

