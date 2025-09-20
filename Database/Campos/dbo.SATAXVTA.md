# dbo.SATAXVTA

Tabla: dbo.SATAXVTA
Origen: dbo.SATAXVTA.sql

## Campos

- Id (int): Identificador interno/autonumÃ©rico del registro.
- CodSucu (varchar(5)): CÃ³digo de sucursal.
- TipoFac (varchar(1)): Campo TipoFac (varchar(1)).
- NumeroD (varchar(20)): NÃºmero de documento principal.
- CodTaxs (varchar(10)): CÃ³digo de impuesto.
- Monto (decimal(28, 4)): Monto/valor monetario asociado.
- MtoTax (decimal(28, 4)): Monto/valor monetario asociado.
- TGravable (decimal(28, 4)): Base imponible (0% o general segÃºn sufijo).
- EsReten (smallint): Indicador de aplica retenciÃ³n (0/1).
- CreatedAt (datetime): Fecha y hora de creaciÃ³n del registro.
- UpdatedAt (datetime): Fecha y hora de Ãºltima actualizaciÃ³n del registro.
- Id (ASC): Identificador interno/autonumÃ©rico del registro.

