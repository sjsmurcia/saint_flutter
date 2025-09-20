# dbo.SAVEND

Tabla: dbo.SAVEND
Origen: dbo.SAVEND.sql

## Campos

- Id (int): Identificador interno/autonumÃ©rico del registro.
- CodVend (varchar(10)): CÃ³digo de vendedor.
- Descrip (varchar(60)): DescripciÃ³n del registro.
- TipoID3 (smallint): Tipo de identificaciÃ³n fiscal (RUC/CI/NIT, etc.).
- TipoID (smallint): Tipo de identificaciÃ³n o clasificaciÃ³n del tercero.
- ID3 (varchar(25)): IdentificaciÃ³n fiscal (RUC/CI/NIT) del tercero.
- DescOrder (varchar(10)): Orden corto para clasificaciÃ³n/ordenamiento.
- Clase (varchar(10)): Clase o categorÃ­a del registro.
- Direc1 (varchar(60)): DirecciÃ³n lÃ­nea 1.
- Direc2 (varchar(60)): DirecciÃ³n lÃ­nea 2.
- Telef (varchar(30)): TelÃ©fono de contacto.
- Movil (varchar(15)): NÃºmero de telÃ©fono mÃ³vil.
- Email (varchar(60)): Correo electrÃ³nico de contacto.
- FechaUV (datetime): Fecha de Ãºltima venta.
- FechaUC (datetime): Fecha de Ãºltima compra.
- EsComiPV (smallint): Indicador: afecta comisiÃ³n (0/1).
- EsComiTV (smallint): Indicador: afecta comisiÃ³n (0/1).
- EsComiTC (smallint): Indicador: afecta comisiÃ³n (0/1).
- EsComiTU (smallint): Indicador: afecta comisiÃ³n (0/1).
- EsComiDT (smallint): Indicador: afecta comisiÃ³n (0/1).
- EsComiUT (smallint): Indicador: afecta comisiÃ³n (0/1).
- EsComiTM (smallint): Indicador: afecta comisiÃ³n (0/1).
- Activo (smallint): Indicador de activo (0/1).
- CreatedAt (datetime): Fecha y hora de creaciÃ³n del registro.
- UpdatedAt (datetime): Fecha y hora de Ãºltima actualizaciÃ³n del registro.
- Id (ASC): Identificador interno/autonumÃ©rico del registro.

