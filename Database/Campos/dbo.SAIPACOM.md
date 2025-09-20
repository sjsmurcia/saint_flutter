# dbo.SAIPACOM

Tabla: dbo.SAIPACOM
Origen: dbo.SAIPACOM.sql

## Campos

- NroUnico (int): NÃºmero Ãºnico/autoincremental de la transacciÃ³n o documento.
- CodSucu (varchar(5)): CÃ³digo de sucursal.
- TipoCom (varchar(1)): Campo TipoCom (varchar(1)).
- NumeroD (varchar(20)): NÃºmero de documento principal.
- CodProv (varchar(15)): CÃ³digo de proveedor.
- CodTarj (varchar(10)): CÃ³digo de tarjeta.
- CodOper (varchar(10)): CÃ³digo de operaciÃ³n.
- Descrip (varchar(40)): DescripciÃ³n del registro.
- TipoPag (int): Campo TipoPag (int).
- TipoTra (int): Campo TipoTra (int).
- FechaE (datetime): Fecha de emisiÃ³n/entrada.
- Monto (decimal(28, 4)): Monto/valor monetario asociado.
- Factor (decimal(28, 4)): Factor de conversiÃ³n (p. ej., tasa de cambio).
- Refere (varchar(40)): Referencia/cÃ³digo alterno.
- MontoMEx (decimal(28, 4)): Monto/valor monetario asociado.
- Impuesto (decimal(28, 4)): Campo Impuesto (decimal(28, 4)).
- RetencT (decimal(28, 4)): Campo RetencT (decimal(28, 4)).
- Terminal (varchar(10)): Campo Terminal (varchar(10)).
- CreatedAt (datetime): Fecha y hora de creaciÃ³n del registro.
- UpdatedAt (datetime): Fecha y hora de Ãºltima actualizaciÃ³n del registro.
- NroUnico (ASC): NÃºmero Ãºnico/autoincremental de la transacciÃ³n o documento.

