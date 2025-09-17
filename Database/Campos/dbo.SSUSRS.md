# dbo.SSUSRS

Tabla: dbo.SSUSRS
Origen: dbo.SSUSRS.sql

## Campos

- Id (int): Identificador interno/autonumÃ©rico del registro.
- CodUsua (varchar(10)): CÃ³digo de usuario.
- Descrip (varchar(50)): DescripciÃ³n del registro.
- Email (varchar(50)): Correo electrÃ³nico de contacto.
- Movil (varchar(15)): NÃºmero de telÃ©fono mÃ³vil.
- Level (int): Nivel/rol de acceso asignado.
- Activo (smallint): Indicador de activo (0/1).
- Password (varchar(100)): ContraseÃ±a (hash) del usuario.
- IdUserNot (int): Identificador de usuario para notificaciones.
- Profile (varchar(50)): Perfil o rol descriptivo del usuario.
- CodVend (varchar(15)): CÃ³digo de vendedor.
- SData1 (varchar(250)): Dato adicional del sistema (extensiÃ³n).
- SData2 (varchar(250)): Dato adicional del sistema (extensiÃ³n).
- SData3 (varchar(250)): Dato adicional del sistema (extensiÃ³n).
- CreatedAt (datetime): Fecha y hora de creaciÃ³n del registro.
- UpdatedAt (datetime): Fecha y hora de Ãºltima actualizaciÃ³n del registro.
- Id (ASC): Identificador interno/autonumÃ©rico del registro.

