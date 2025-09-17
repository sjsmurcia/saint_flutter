# dbo.SAPAGCXC

Tabla: dbo.SAPAGCXC
Origen: dbo.SAPAGCXC.sql

## Campos

- NroUnico (int): NÃºmero Ãºnico/autoincremental de la transacciÃ³n o documento.
- CodSucu (varchar(5)): CÃ³digo de sucursal.
- CodClie (varchar(15)): CÃ³digo de cliente.
- NroPpal (int): NÃºmero correlativo asociado.
- NroRegi (int): NÃºmero de registro/Ã­tem.
- TipoCxc (varchar(2)): Campo TipoCxc (varchar(2)).
- MontoDocA (decimal(28, 4)): Monto/valor monetario asociado.
- Monto (decimal(28, 4)): Monto/valor monetario asociado.
- Comision (decimal(28, 4)): Campo Comision (decimal(28, 4)).
- NumeroD (varchar(20)): NÃºmero de documento principal.
- Descrip (varchar(40)): DescripciÃ³n del registro.
- FechaE (datetime): Fecha de emisiÃ³n/entrada.
- FechaO (datetime): Fecha asociada al registro.
- EsReten (smallint): Indicador de aplica retenciÃ³n (0/1).
- BaseReten (decimal(28, 4)): Campo BaseReten (decimal(28, 4)).
- CodOper (varchar(10)): CÃ³digo de operaciÃ³n.
- CodRete (varchar(10)): CÃ³digo de r e t e.
- BaseImpo (decimal(28, 4)): Campo BaseImpo (decimal(28, 4)).
- TExento (decimal(28, 4)): Base exenta de impuestos.
- MtoTax (decimal(28, 4)): Monto/valor monetario asociado.
- RetenIVA (decimal(28, 4)): Monto retenido de IVA/impuesto.
- CreatedAt (datetime): Fecha y hora de creaciÃ³n del registro.
- UpdatedAt (datetime): Fecha y hora de Ãºltima actualizaciÃ³n del registro.
- NroUnico (ASC): NÃºmero Ãºnico/autoincremental de la transacciÃ³n o documento.

