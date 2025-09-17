# dbo.SACLIE

Tabla: dbo.SACLIE
Origen: dbo.SACLIE.sql

## Campos

- Id (int): Identificador interno/autonumÃ©rico del registro.
- CodClie (varchar(15)): CÃ³digo de cliente.
- Descrip (varchar(60)): DescripciÃ³n del registro.
- ID3 (varchar(25)): IdentificaciÃ³n fiscal (RUC/CI/NIT) del tercero.
- TipoID3 (smallint): Tipo de identificaciÃ³n fiscal (RUC/CI/NIT, etc.).
- TipoID (smallint): Tipo de identificaciÃ³n o clasificaciÃ³n del tercero.
- Activo (smallint): Indicador de activo (0/1).
- DescOrder (varchar(10)): Orden corto para clasificaciÃ³n/ordenamiento.
- Clase (varchar(10)): Clase o categorÃ­a del registro.
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
- Email (varchar(60)): Correo electrÃ³nico de contacto.
- Fax (varchar(30)): NÃºmero de fax.
- FechaE (datetime): Fecha de emisiÃ³n/entrada.
- CodZona (varchar(10)): CÃ³digo de zona.
- CodVend (varchar(10)): CÃ³digo de vendedor.
- CodConv (varchar(10)): CÃ³digo de convenio.
- CodAlte (varchar(15)): CÃ³digo de alterno.
- TipoCli (smallint): Tipo/categorÃ­a de cliente.
- TipoReg (smallint): Tipo/clase de registro.
- TipoPVP (smallint): Tipo de precio de venta aplicable (PVP).
- Observa (varchar(40)): Observaciones/notas del documento.
- EsMoneda (smallint): Indicador/flag de configuraciÃ³n (0/1).
- EsCredito (smallint): Indicador de manejo de crÃ©dito (0/1).
- LimiteCred (decimal(28, 4)): LÃ­mite de crÃ©dito asignado.
- DiasCred (int): DÃ­as de crÃ©dito asignados.
- EsToleran (smallint): Indicador/flag de configuraciÃ³n (0/1).
- DiasTole (int): DÃ­as de tolerancia de pago.
- IntMora (smallint): Indicador/tasa para interÃ©s de mora.
- Descto (decimal(28, 4)): Descuento general aplicado.
- Saldo (decimal(28, 4)): Saldo asociado (moneda base), segÃºn contexto.
- PagosA (decimal(28, 4)): Pagos acumulados aplicados.
- FechaUV (datetime): Fecha de Ãºltima venta.
- MontoUV (decimal(28, 4)): Monto/valor monetario asociado.
- NumeroUV (varchar(20)): NÃºmero de documento o referencia
- FechaUP (datetime): Fecha asociada al registro.
- MontoUP (decimal(28, 4)): Monto/valor monetario asociado.
- NumeroUP (varchar(20)): NÃºmero de documento o referencia
- MontoMax (decimal(28, 4)): Monto/valor monetario asociado.
- MtoMaxCred (decimal(28, 4)): Monto/valor monetario asociado.
- PromPago (decimal(28, 4)): Promedio de pago/dÃ­as de pago.
- RetenIVA (decimal(28, 4)): Monto retenido de IVA/impuesto.
- SaldoPtos (decimal(28, 4)): Saldo asociado (moneda base), segÃºn contexto.
- EsReten (smallint): Indicador de aplica retenciÃ³n (0/1).
- DescripExt (varchar(250)): Campo DescripExt (varchar(250)).
- CreatedAt (datetime): Fecha y hora de creaciÃ³n del registro.
- UpdatedAt (datetime): Fecha y hora de Ãºltima actualizaciÃ³n del registro.
- Id (ASC): Identificador interno/autonumÃ©rico del registro.

