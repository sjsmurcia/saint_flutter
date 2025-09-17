# dbo.SAITEMPLANI

Tabla: dbo.SAITEMPLANI
Origen: dbo.SAITEMPLANI.sql

## Campos

- Id (int): Identificador interno/autonumÃ©rico del registro.
- CodSucu (varchar(5)): CÃ³digo de sucursal.
- NumeroD (varchar(20)): NÃºmero de documento principal.
- NroLinea (int): NÃºmero correlativo asociado.
- NroRegi (int): NÃºmero de registro/Ã­tem.
- FechaE (datetime): Fecha de emisiÃ³n/entrada.
- FechaV (datetime): Fecha de vencimiento.
- TipoCxc (varchar(2)): Campo TipoCxc (varchar(2)).
- NumeroC (varchar(20)): NÃºmero de documento o referencia
- Document (varchar(40)): Referencia al documento asociado.
- Monto (decimal(28, 4)): Monto/valor monetario asociado.
- Saldo (decimal(28, 4)): Saldo asociado (moneda base), segÃºn contexto.
- CancelI (decimal(28, 4)): Montos cancelados/aplicados por forma o estado.
- CancelA (decimal(28, 4)): Montos cancelados/aplicados por forma o estado.
- CancelE (decimal(28, 4)): Montos cancelados/aplicados por forma o estado.
- CancelC (decimal(28, 4)): Montos cancelados/aplicados por forma o estado.
- CancelT (decimal(28, 4)): Montos cancelados/aplicados por forma o estado.
- CancelG (decimal(28, 4)): Montos cancelados/aplicados por forma o estado.
- Comision (decimal(28, 4)): Campo Comision (decimal(28, 4)).
- DetalChq (varchar(40)): Campo DetalChq (varchar(40)).
- PrxVisita (datetime): Campo PrxVisita (datetime).
- CreatedAt (datetime): Fecha y hora de creaciÃ³n del registro.
- UpdatedAt (datetime): Fecha y hora de Ãºltima actualizaciÃ³n del registro.
- Id (ASC): Identificador interno/autonumÃ©rico del registro.

