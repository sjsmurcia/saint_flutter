# dbo.SAACXP

Tabla: dbo.SAACXP
Origen: dbo.SAACXP.sql

## Campos

- NroUnico (int): NÃºmero Ãºnico/autoincremental de la transacciÃ³n o documento.
- CodSucu (varchar(5)): CÃ³digo de sucursal.
- CodProv (varchar(15)): CÃ³digo de proveedor.
- NroRegi (int): NÃºmero de registro/Ã­tem.
- FechaI (datetime): Fecha de inicio.
- FechaE (datetime): Fecha de emisiÃ³n/entrada.
- FechaT (datetime): Fecha de transacciÃ³n.
- FechaR (datetime): Fecha de registro/recepciÃ³n.
- FechaV (datetime): Fecha de vencimiento.
- CodEsta (varchar(10)): CÃ³digo de establecimiento/estado.
- CodUsua (varchar(10)): CÃ³digo de usuario.
- CodOper (varchar(10)): CÃ³digo de operaciÃ³n.
- NumeroD (varchar(20)): NÃºmero de documento principal.
- NumeroN (varchar(20)): NÃºmero de documento o referencia
- NroCtrol (varchar(20)): NÃºmero de control fiscal.
- FromTran (int): Campo FromTran (int).
- TipoCxP (varchar(2)): Campo TipoCxP (varchar(2)).
- TipoSus (smallint): Campo TipoSus (smallint).
- TipoTraE (smallint): Tipo de transacciÃ³n/estado externo.
- NroEstable (varchar(10)): NÃºmero de establecimiento.
- PtoEmision (varchar(10)): Punto de emisiÃ³n fiscal.
- AutSRI (varchar(80)): CÃ³digo/clave de autorizaciÃ³n fiscal (SRI).
- CodTarj (varchar(10)): CÃ³digo de tarjeta.
- Moneda (varchar(5)): CÃ³digo o clave de moneda.
- Factor (decimal(28, 4)): Factor de conversiÃ³n (p. ej., tasa de cambio).
- MontoMEx (decimal(28, 4)): Monto/valor monetario asociado.
- SaldoMEx (decimal(28, 4)): Saldo asociado (moneda base), segÃºn contexto.
- Document (varchar(40)): Referencia al documento asociado.
- Notas1 (varchar(60)): Observaciones/notas del documento.
- Notas2 (varchar(60)): Observaciones/notas del documento.
- Notas3 (varchar(60)): Observaciones/notas del documento.
- Notas4 (varchar(60)): Observaciones/notas del documento.
- Notas5 (varchar(60)): Observaciones/notas del documento.
- Notas6 (varchar(60)): Observaciones/notas del documento.
- Notas7 (varchar(60)): Observaciones/notas del documento.
- Notas8 (varchar(60)): Observaciones/notas del documento.
- Notas9 (varchar(60)): Observaciones/notas del documento.
- Notas10 (varchar(60)): Observaciones/notas del documento.
- Monto (decimal(28, 4)): Monto/valor monetario asociado.
- Debitos (decimal(28, 4)): Total de dÃ©bitos.
- Creditos (decimal(28, 4)): Total de crÃ©ditos.
- MontoNeto (decimal(28, 4)): Monto/valor monetario asociado.
- MtoTax (decimal(28, 4)): Monto/valor monetario asociado.
- RetenIVA (decimal(28, 4)): Monto retenido de IVA/impuesto.
- Saldo (decimal(28, 4)): Saldo asociado (moneda base), segÃºn contexto.
- SaldoOrg (decimal(28, 4)): Saldo asociado (moneda base), segÃºn contexto.
- OrgTax (decimal(28, 4)): Campo OrgTax (decimal(28, 4)).
- SaldoAct (decimal(28, 4)): Saldo asociado (moneda base), segÃºn contexto.
- EsLibroI (smallint): Indicador/flag de configuraciÃ³n (0/1).
- BaseImpo (decimal(28, 4)): Campo BaseImpo (decimal(28, 4)).
- TExento (decimal(28, 4)): Base exenta de impuestos.
- CancelI (decimal(28, 4)): Montos cancelados/aplicados por forma o estado.
- CancelA (decimal(28, 4)): Montos cancelados/aplicados por forma o estado.
- CancelE (decimal(28, 4)): Montos cancelados/aplicados por forma o estado.
- CancelC (decimal(28, 4)): Montos cancelados/aplicados por forma o estado.
- CancelT (decimal(28, 4)): Montos cancelados/aplicados por forma o estado.
- CancelG (decimal(28, 4)): Montos cancelados/aplicados por forma o estado.
- CancelD (decimal(28, 4)): Montos cancelados/aplicados por forma o estado.
- EsUnPago (smallint): Indicador/flag de configuraciÃ³n (0/1).
- EsReten (smallint): Indicador de aplica retenciÃ³n (0/1).
- DetalChq (varchar(40)): Campo DetalChq (varchar(40)).
- AfectaCom (smallint): Campo AfectaCom (smallint).
- Descrip (varchar(60)): DescripciÃ³n del registro.
- ID3 (varchar(25)): IdentificaciÃ³n fiscal (RUC/CI/NIT) del tercero.
- NroOPago (varchar(15)): NÃºmero correlativo asociado.
- CreatedAt (datetime): Fecha y hora de creaciÃ³n del registro.
- UpdatedAt (datetime): Fecha y hora de Ãºltima actualizaciÃ³n del registro.
- NroUnico (ASC): NÃºmero Ãºnico/autoincremental de la transacciÃ³n o documento.

