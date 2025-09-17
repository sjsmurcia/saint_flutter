# dbo.SAITEMFAC

Tabla: dbo.SAITEMFAC
Origen: dbo.SAITEMFAC.sql

## Campos

- Id (int): Identificador interno/autonumÃ©rico del registro.
- CodSucu (varchar(5)): CÃ³digo de sucursal.
- TipoFac (varchar(1)): Campo TipoFac (varchar(1)).
- NumeroD (varchar(20)): NÃºmero de documento principal.
- OTipo (varchar(1)): Campo OTipo (varchar(1)).
- ONumero (varchar(20)): Campo ONumero (varchar(20)).
- ONroLinea (int): Campo ONroLinea (int).
- ONroLineaC (int): Campo ONroLineaC (int).
- NumeroE (varchar(20)): NÃºmero de documento o referencia
- NroLinea (int): NÃºmero correlativo asociado.
- NroLineaC (int): NÃºmero correlativo asociado.
- CodItem (varchar(15)): CÃ³digo de i t e m.
- CodUbic (varchar(10)): CÃ³digo de ubicaciÃ³n.
- CodUsua (varchar(10)): CÃ³digo de usuario.
- CodAuth (varchar(10)): CÃ³digo de a u t h.
- CodMeca (varchar(10)): CÃ³digo de m e c a.
- CodVend (varchar(10)): CÃ³digo de vendedor.
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
- CantMayor (decimal(28, 4)): Campo CantMayor (decimal(28, 4)).
- Cantidad (decimal(28, 4)): Campo Cantidad (decimal(28, 4)).
- CantidadD (decimal(28, 4)): Campo CantidadD (decimal(28, 4)).
- CantidadT (decimal(28, 4)): Campo CantidadT (decimal(28, 4)).
- CantidadO (decimal(28, 4)): Campo CantidadO (decimal(28, 4)).
- CantidadA (decimal(28, 4)): Campo CantidadA (decimal(28, 4)).
- CantidadU (decimal(28, 4)): Campo CantidadU (decimal(28, 4)).
- CantidadUA (decimal(28, 4)): Campo CantidadUA (decimal(28, 4)).
- ExistAntU (decimal(28, 4)): Campo ExistAntU (decimal(28, 4)).
- ExistAnt (decimal(28, 4)): Campo ExistAnt (decimal(28, 4)).
- Tara (decimal(28, 4)): Tara o peso del empaque.
- Factor (decimal(28, 4)): Factor de conversiÃ³n (p. ej., tasa de cambio).
- TotalItem (decimal(28, 4)): Campo TotalItem (decimal(28, 4)).
- Costo (decimal(28, 4)): Costo del producto (actual/promedio/anterior segÃºn sufijo).
- TipoPVP (smallint): Tipo de precio de venta aplicable (PVP).
- Precio (decimal(28, 4)): Precio de venta (segÃºn lista/escala indicada).
- PrecioI (decimal(28, 4)): Precio de venta (segÃºn lista/escala indicada).
- MtoTax (decimal(28, 4)): Monto/valor monetario asociado.
- MtoTaxO (decimal(28, 4)): Monto/valor monetario asociado.
- PriceO (decimal(28, 4)): Campo PriceO (decimal(28, 4)).
- Descto (decimal(28, 4)): Descuento general aplicado.
- NroUnicoL (int): NÃºmero correlativo asociado.
- NroLote (varchar(20)): NÃºmero correlativo asociado.
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
- DEsComp (smallint): Indicador: compuesto/agrupado (0/1).
- TipoData (smallint): Campo TipoData (smallint).
- TipoOfe (smallint): Campo TipoOfe (smallint).
- CreatedAt (datetime): Fecha y hora de creaciÃ³n del registro.
- UpdatedAt (datetime): Fecha y hora de Ãºltima actualizaciÃ³n del registro.
- Id (ASC): Identificador interno/autonumÃ©rico del registro.

