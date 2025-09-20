# dbo.SBBANC

Tabla: dbo.SBBANC
Origen: dbo.SBBANC.sql

## Campos

- Id (int): Identificador interno/autonumÃ©rico del registro.
- CodBanc (varchar(30)): CÃ³digo de banco.
- Descripcion (varchar(60)): DescripciÃ³n del registro.
- NoCuenta (varchar(20)): NÃºmero de cuenta bancaria.
- Sucursal (varchar(50)): Nombre de la sucursal bancaria.
- TDC (int): CÃ³digo de tipo (TDC) segÃºn configuraciÃ³n.
- CtaContab (varchar(25)): Cuenta contable asociada.
- SaldoAct (decimal(28, 4)): Saldo asociado (moneda base), segÃºn contexto.
- SaldoC1 (decimal(28, 4)): Saldo asociado (moneda base), segÃºn contexto.
- FechaC1 (datetime): Campo FechaC1 (datetime).
- SaldoC2 (decimal(28, 4)): Saldo asociado (moneda base), segÃºn contexto.
- FechaC2 (datetime): Campo FechaC2 (datetime).
- PrxConc (int): Consecutivo/prÃ³ximo nÃºmero de conciliaciÃ³n.
- InvChe (int): Inventario/contador de cheques.
- IDB (int): ParÃ¡metro/identificador de banco (uso interno).
- Moneda (varchar(3)): CÃ³digo o clave de moneda.
- PDB (decimal(28, 4)): ParÃ¡metro/identificador de banco (uso interno).
- CtaDebito (varchar(30)): Cuenta contable de dÃ©bito.
- PrxNDDB (int): PrÃ³ximo nÃºmero de nota de dÃ©bito bancaria.
- CtaConc (int): Cuenta/clave de conciliaciÃ³n.
- RTransf (int): Regla/indicador de transferencia.
- NomSuc (varchar(40)): Nombre de la sucursal.
- Pais (int): CÃ³digo de paÃ­s (catÃ¡logo).
- Estado (int): CÃ³digo de estado/provincia (catÃ¡logo).
- Ciudad (int): CÃ³digo de ciudad (catÃ¡logo).
- Municipio (int): CÃ³digo de municipio (catÃ¡logo).
- ZipCode (varchar(20)): CÃ³digo postal.
- Direccion1 (varchar(40)): DirecciÃ³n lÃ­nea 1.
- Direccion2 (varchar(40)): DirecciÃ³n lÃ­nea 2.
- Gerente (varchar(30)): Campo Gerente (varchar(30)).
- Telefonos (varchar(25)): Listado de telÃ©fonos de contacto.
- Fax (varchar(25)): NÃºmero de fax.
- Email (varchar(25)): Correo electrÃ³nico de contacto.
- Memo (text): Campo de observaciones o notas (texto libre).
- MesesH (int): Campo MesesH (int).
- VNoCh (int): Campo VNoCh (int).
- VNoDp (int): Campo VNoDp (int).
- VNoNc (int): Campo VNoNc (int).
- VNoNd (int): Campo VNoNd (int).
- PrxCheque (decimal(28, 4)): PrÃ³ximo nÃºmero de cheque.
- NComp0 (int): Campo NComp0 (int).
- NComp1 (int): Campo NComp1 (int).
- NComp2 (int): Campo NComp2 (int).
- NComp3 (int): Campo NComp3 (int).
- NComp4 (int): Campo NComp4 (int).
- NComp5 (int): Campo NComp5 (int).
- CreatedAt (datetime): Fecha y hora de creaciÃ³n del registro.
- UpdatedAt (datetime): Fecha y hora de Ãºltima actualizaciÃ³n del registro.
- Id (ASC): Identificador interno/autonumÃ©rico del registro.

