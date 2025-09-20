# dbo.SAIPAVTA

Tabla: dbo.SAIPAVTA
Origen: dbo.SAIPAVTA.sql

## Campos

- NroUnico (int): NÃºmero Ãºnico/autoincremental de la transacciÃ³n o documento.
- CodSucu (varchar(5)): CÃ³digo de sucursal.
- TipoFac (varchar(1)): Campo TipoFac (varchar(1)).
- NumeroD (varchar(20)): NÃºmero de documento principal.
- CodTarj (varchar(10)): CÃ³digo de tarjeta.
- Descrip (varchar(40)): DescripciÃ³n del registro.
- TipoPag (int): Campo TipoPag (int).
- TipoTra (int): Campo TipoTra (int).
- FechaE (datetime): Fecha de emisiÃ³n/entrada.
- Monto (decimal(28, 4)): Monto/valor monetario asociado.
- Impuesto (decimal(28, 4)): Campo Impuesto (decimal(28, 4)).
- ImpuestoD (decimal(28, 4)): Campo ImpuestoD (decimal(28, 4)).
- RetencT (decimal(28, 4)): Campo RetencT (decimal(28, 4)).
- Factor (decimal(28, 4)): Factor de conversiÃ³n (p. ej., tasa de cambio).
- Refere (varchar(40)): Referencia/cÃ³digo alterno.
- Terminal (varchar(10)): Campo Terminal (varchar(10)).
- NroLote (varchar(5)): NÃºmero correlativo asociado.
- Propina (decimal(28, 4)): Campo Propina (decimal(28, 4)).
- MontoMEx (decimal(28, 4)): Monto/valor monetario asociado.
- ID3 (varchar(15)): IdentificaciÃ³n fiscal (RUC/CI/NIT) del tercero.
- Autoriza (varchar(20)): Campo Autoriza (varchar(20)).
- Adquiere (varchar(20)): Campo Adquiere (varchar(20)).
- Afiliado (varchar(20)): Campo Afiliado (varchar(20)).
- response (nvarchar(max)): Campo response (nvarchar(max)).
- NroTurno (int): NÃºmero de turno/caja.
- CreatedAt (datetime): Fecha y hora de creaciÃ³n del registro.
- UpdatedAt (datetime): Fecha y hora de Ãºltima actualizaciÃ³n del registro.
- NroUnico (ASC): NÃºmero Ãºnico/autoincremental de la transacciÃ³n o documento.

