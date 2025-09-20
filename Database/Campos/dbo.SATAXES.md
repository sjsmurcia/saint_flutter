# dbo.SATAXES

Tabla: dbo.SATAXES
Origen: dbo.SATAXES.sql

## Campos

- Id (int): Identificador interno/autonumÃ©rico del registro.
- CodTaxs (varchar(10)): CÃ³digo de impuesto.
- Descrip (varchar(40)): DescripciÃ³n del registro.
- MtoTax (decimal(28, 4)): Monto/valor monetario asociado.
- Activo (smallint): Indicador de activo (0/1).
- EsFijo (smallint): Indicador/flag de configuraciÃ³n (0/1).
- EsReten (smallint): Indicador de aplica retenciÃ³n (0/1).
- CodOper (varchar(10)): CÃ³digo de operaciÃ³n.
- CodFacE (varchar(10)): CÃ³digo de f a c e.
- EsPorct (smallint): Indicador/flag de configuraciÃ³n (0/1).
- EsCosto (smallint): Indicador/flag de configuraciÃ³n (0/1).
- TipoIVA (smallint): Campo TipoIVA (smallint).
- EsLibroI (smallint): Indicador/flag de configuraciÃ³n (0/1).
- EsPartic (smallint): Indicador/flag de configuraciÃ³n (0/1).
- EsTaxVenta (smallint): Indicador/flag de configuraciÃ³n (0/1).
- EsTaxCompra (smallint): Indicador: compuesto/agrupado (0/1).
- MontoMin (decimal(28, 4)): Monto/valor monetario asociado.
- MontoMax (decimal(28, 4)): Monto/valor monetario asociado.
- Sustraendo (decimal(28, 4)): Campo Sustraendo (decimal(28, 4)).
- EsCorrel (smallint): Indicador/flag de configuraciÃ³n (0/1).
- Formato (varchar(50)): Campo Formato (varchar(50)).
- CreatedAt (datetime): Fecha y hora de creaciÃ³n del registro.
- UpdatedAt (datetime): Fecha y hora de Ãºltima actualizaciÃ³n del registro.
- Id (ASC): Identificador interno/autonumÃ©rico del registro.

