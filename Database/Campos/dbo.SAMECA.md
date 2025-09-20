# dbo.SAMECA

Tabla: dbo.SAMECA
Origen: dbo.SAMECA.sql

## Campos

- Id (int): Identificador interno/autonumÃ©rico del registro.
- CodMeca (varchar(10)): CÃ³digo de m e c a.
- Descrip (varchar(60)): DescripciÃ³n del registro.
- TipoID3 (smallint): Tipo de identificaciÃ³n fiscal (RUC/CI/NIT, etc.).
- TipoID (smallint): Tipo de identificaciÃ³n o clasificaciÃ³n del tercero.
- ID3 (varchar(25)): IdentificaciÃ³n fiscal (RUC/CI/NIT) del tercero.
- DescOrder (varchar(10)): Orden corto para clasificaciÃ³n/ordenamiento.
- Clase (varchar(10)): Clase o categorÃ­a del registro.
- Activo (smallint): Indicador de activo (0/1).
- Direc1 (varchar(60)): DirecciÃ³n lÃ­nea 1.
- Direc2 (varchar(60)): DirecciÃ³n lÃ­nea 2.
- Telef (varchar(30)): TelÃ©fono de contacto.
- Movil (varchar(15)): NÃºmero de telÃ©fono mÃ³vil.
- Email (varchar(60)): Correo electrÃ³nico de contacto.
- DEsComi (smallint): Indicador: afecta comisiÃ³n (0/1).
- Monto (decimal(28, 4)): Monto/valor monetario asociado.
- PorctUtil (decimal(28, 4)): Campo PorctUtil (decimal(28, 4)).
- CreatedAt (datetime): Fecha y hora de creaciÃ³n del registro.
- UpdatedAt (datetime): Fecha y hora de Ãºltima actualizaciÃ³n del registro.
- Id (ASC): Identificador interno/autonumÃ©rico del registro.

