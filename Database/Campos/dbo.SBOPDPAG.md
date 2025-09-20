# dbo.SBOPDPAG

Tabla: dbo.SBOPDPAG
Origen: dbo.SBOPDPAG.sql

## Campos

- Id (int): Identificador interno/autonumÃ©rico del registro.
- CodProv (varchar(15)): CÃ³digo de proveedor.
- NroOPago (varchar(15)): NÃºmero correlativo asociado.
- NroLinea (int): NÃºmero correlativo asociado.
- Estado (int): CÃ³digo de estado/provincia (catÃ¡logo).
- NroUCxP (int): NÃºmero correlativo asociado.
- TipoCxP (varchar(5)): Campo TipoCxP (varchar(5)).
- FechaE (datetime): Fecha de emisiÃ³n/entrada.
- FechaV (datetime): Fecha de vencimiento.
- Document (varchar(50)): Referencia al documento asociado.
- NumeroD (varchar(15)): NÃºmero de documento principal.
- Saldo (decimal(28, 4)): Saldo asociado (moneda base), segÃºn contexto.
- Monto (decimal(28, 4)): Monto/valor monetario asociado.
- MtoReten (decimal(28, 4)): Monto/valor monetario asociado.
- CreatedAt (datetime): Fecha y hora de creaciÃ³n del registro.
- UpdatedAt (datetime): Fecha y hora de Ãºltima actualizaciÃ³n del registro.
- Id (ASC): Identificador interno/autonumÃ©rico del registro.

