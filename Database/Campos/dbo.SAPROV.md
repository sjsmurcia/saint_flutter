# dbo.SAPROV

Tabla: dbo.SAPROV
Origen: dbo.SAPROV.sql

## Campos

- Id (int): Identificador interno/autonumÃ©rico del registro.
- CodProv (varchar(15)): CÃ³digo de proveedor.
- Descrip (varchar(60)): DescripciÃ³n del registro.
- TipoPrv (smallint): Campo TipoPrv (smallint).
- TipoID3 (smallint): Tipo de identificaciÃ³n fiscal (RUC/CI/NIT, etc.).
- TipoID (smallint): Tipo de identificaciÃ³n o clasificaciÃ³n del tercero.
- ID3 (varchar(25)): IdentificaciÃ³n fiscal (RUC/CI/NIT) del tercero.
- DescOrder (varchar(10)): Orden corto para clasificaciÃ³n/ordenamiento.
- Clase (varchar(10)): Clase o categorÃ­a del registro.
- Activo (smallint): Indicador de activo (0/1).
- Represent (varchar(40)): Nombre del representante/contacto comercial.
- Direc1 (varchar(60)): DirecciÃ³n lÃ­nea 1.
- Direc2 (varchar(60)): DirecciÃ³n lÃ­nea 2.
- Pais (int): CÃ³digo de paÃ­s (catÃ¡logo).
- Estado (int): CÃ³digo de estado/provincia (catÃ¡logo).
- Ciudad (int): CÃ³digo de ciudad (catÃ¡logo).
- Municipio (int): CÃ³digo de municipio (catÃ¡logo).
- ZipCode (varchar(20)): CÃ³digo postal.
- Telef (varchar(30)): TelÃ©fono de contacto.
- Movil (varchar(15)): NÃºmero de telÃ©fono mÃ³vil.
- Fax (varchar(30)): NÃºmero de fax.
- Email (varchar(60)): Correo electrÃ³nico de contacto.
- FechaE (datetime): Fecha de emisiÃ³n/entrada.
- EsReten (smallint): Indicador de aplica retenciÃ³n (0/1).
- RetenISLR (int): Campo RetenISLR (int).
- DiasCred (int): DÃ­as de crÃ©dito asignados.
- Observa (varchar(40)): Observaciones/notas del documento.
- EsMoneda (smallint): Indicador/flag de configuraciÃ³n (0/1).
- Saldo (decimal(28, 4)): Saldo asociado (moneda base), segÃºn contexto.
- MontoMax (decimal(28, 4)): Monto/valor monetario asociado.
- PagosA (decimal(28, 4)): Pagos acumulados aplicados.
- PromPago (decimal(28, 4)): Promedio de pago/dÃ­as de pago.
- RetenIVA (decimal(28, 4)): Monto retenido de IVA/impuesto.
- FechaUC (datetime): Fecha de Ãºltima compra.
- MontoUC (decimal(28, 4)): Monto/valor monetario asociado.
- NumeroUC (varchar(20)): NÃºmero de documento o referencia
- FechaUP (datetime): Fecha asociada al registro.
- MontoUP (decimal(28, 4)): Monto/valor monetario asociado.
- NumeroUP (varchar(20)): NÃºmero de documento o referencia
- CreatedAt (datetime): Fecha y hora de creaciÃ³n del registro.
- UpdatedAt (datetime): Fecha y hora de Ãºltima actualizaciÃ³n del registro.
- Id (ASC): Identificador interno/autonumÃ©rico del registro.

