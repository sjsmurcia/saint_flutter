# dbo.SAIPACXP

Tabla: dbo.SAIPACXP
Origen: dbo.SAIPACXP.sql

## Campos

- NroUnico (int): NÃºmero Ãºnico/autoincremental de la transacciÃ³n o documento.
- CodSucu (varchar(5)): CÃ³digo de sucursal.
- NroPpal (int): NÃºmero correlativo asociado.
- CodTarj (varchar(10)): CÃ³digo de tarjeta.
- CodOper (varchar(10)): CÃ³digo de operaciÃ³n.
- Descrip (varchar(40)): DescripciÃ³n del registro.
- NumeroD (varchar(20)): NÃºmero de documento principal.
- TipoPag (int): Campo TipoPag (int).
- TipoTra (int): Campo TipoTra (int).
- FechaE (datetime): Fecha de emisiÃ³n/entrada.
- Monto (decimal(28, 4)): Monto/valor monetario asociado.
- Impuesto (decimal(28, 4)): Campo Impuesto (decimal(28, 4)).
- RetencT (decimal(28, 4)): Campo RetencT (decimal(28, 4)).
- Factor (decimal(28, 4)): Factor de conversiÃ³n (p. ej., tasa de cambio).
- Refere (varchar(40)): Referencia/cÃ³digo alterno.
- MontoMEx (decimal(28, 4)): Monto/valor monetario asociado.
- CreatedAt (datetime): Fecha y hora de creaciÃ³n del registro.
- UpdatedAt (datetime): Fecha y hora de Ãºltima actualizaciÃ³n del registro.
- NroUnico (ASC): NÃºmero Ãºnico/autoincremental de la transacciÃ³n o documento.

