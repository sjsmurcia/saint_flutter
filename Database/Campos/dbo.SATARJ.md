# dbo.SATARJ

Tabla: dbo.SATARJ
Origen: dbo.SATARJ.sql

## Campos

- Id (int): Identificador interno/autonumÃ©rico del registro.
- CodTarj (varchar(10)): CÃ³digo de tarjeta.
- Descrip (varchar(40)): DescripciÃ³n del registro.
- Clase (varchar(40)): Clase o categorÃ­a del registro.
- Activo (smallint): Indicador de activo (0/1).
- CodAlte (varchar(10)): CÃ³digo de alterno.
- Impuesto (decimal(28, 4)): Campo Impuesto (decimal(28, 4)).
- DiasDif (int): Campo DiasDif (int).
- BaseReten (decimal(28, 4)): Campo BaseReten (decimal(28, 4)).
- RetenIVA (decimal(28, 4)): Monto retenido de IVA/impuesto.
- TipoIns (smallint): Campo TipoIns (smallint).
- Monto (decimal(28, 4)): Monto/valor monetario asociado.
- ImpuestoD (decimal(28, 4)): Campo ImpuestoD (decimal(28, 4)).
- TipoTra (smallint): Campo TipoTra (smallint).
- TipoAtr (smallint): Campo TipoAtr (smallint).
- TipoPag (varchar(2)): Campo TipoPag (varchar(2)).
- TipoDef (smallint): Campo TipoDef (smallint).
- Minimo (smallint): Stock mÃ­nimo permitido.
- Moneda (nvarchar(max)): CÃ³digo o clave de moneda.
- TipoData (smallint): Campo TipoData (smallint).
- Settings (nvarchar(max)): Campo Settings (nvarchar(max)).
- CreatedAt (datetime): Fecha y hora de creaciÃ³n del registro.
- UpdatedAt (datetime): Fecha y hora de Ãºltima actualizaciÃ³n del registro.
- Id (ASC): Identificador interno/autonumÃ©rico del registro.

