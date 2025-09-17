# dbo.SATAXCXP

Tabla: dbo.SATAXCXP
Origen: dbo.SATAXCXP.sql

## Campos

- NroUnico (int): NÃºmero Ãºnico/autoincremental de la transacciÃ³n o documento.
- CodSucu (varchar(5)): CÃ³digo de sucursal.
- CodProv (varchar(15)): CÃ³digo de proveedor.
- NroPpal (int): NÃºmero correlativo asociado.
- CodTaxs (varchar(10)): CÃ³digo de impuesto.
- Monto (decimal(28, 4)): Monto/valor monetario asociado.
- MtoTax (decimal(28, 4)): Monto/valor monetario asociado.
- TGravable (decimal(28, 4)): Base imponible (0% o general segÃºn sufijo).
- EsReten (smallint): Indicador de aplica retenciÃ³n (0/1).
- CreatedAt (datetime): Fecha y hora de creaciÃ³n del registro.
- UpdatedAt (datetime): Fecha y hora de Ãºltima actualizaciÃ³n del registro.
- NroUnico (ASC): NÃºmero Ãºnico/autoincremental de la transacciÃ³n o documento.

