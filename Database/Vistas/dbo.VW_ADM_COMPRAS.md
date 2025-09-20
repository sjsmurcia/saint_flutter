# dbo.VW_ADM_COMPRAS

Vista: dbo.VW_ADM_COMPRAS
Origen: dbo.VW_ADM_COMPRAS.sql

## Columnas

- TipoCom: Columna proveniente de `TipoCom`.
- NumeroD: Columna proveniente de `NumeroD`.
- NroCtrol: Columna proveniente de `NroCtrol`.
- CodSucu: Columna proveniente de `CodSucu`.
- CodEsta: Columna proveniente de `CodEsta`.
- CodUsua: Columna proveniente de `CodUsua`.
- NumeroC: Columna proveniente de `NumeroC`.
- Signo: Columna proveniente de `Signo`.
- NumeroP: Columna proveniente de `NumeroP`.
- CodProv: Columna proveniente de `CodProv`.
- CodUbic: Columna proveniente de `CodUbic`.
- Descrip: Columna proveniente de `Descrip`.
- Direc1: Columna proveniente de `Direc1`.
- Direc2: Columna proveniente de `Direc2`.
- Telef: Columna proveniente de `Telef`.
- ID3: Columna proveniente de `ID3`.
- DetalChq: Columna proveniente de `DetalChq`.
- FechaT: Columna proveniente de `FechaT`.
- FechaE: Columna proveniente de `FechaE`.
- FechaV: Columna proveniente de `FechaV`.
- OrdenC: Columna proveniente de `OrdenC`.
- CodOper: Columna proveniente de `CodOper`.
- NGiros: Columna proveniente de `NGiros`.
- NMeses: Columna proveniente de `NMeses`.
- Monto: Columna calculada a partir de la expresión `Signo * Monto`.
- MontoTotal: Columna calculada a partir de la expresión `Signo * MtoTotal`.
- MtoTax: Columna calculada a partir de la expresión `Signo * MtoTax`.
- Fletes: Columna calculada a partir de la expresión `Signo * Fletes`.
- TGravable: Columna calculada a partir de la expresión `Signo * (TGravable + TGravable0)`.
- TExento: Columna calculada a partir de la expresión `Signo * TExento`.
- DesctoP: Columna calculada a partir de la expresión `Signo * DesctoP`.
- RetenIVA: Columna calculada a partir de la expresión `Signo * RetenIVA`.
- CancelI: Columna calculada a partir de la expresión `Signo * CancelI`.
- CancelA: Columna calculada a partir de la expresión `Signo * CancelA`.
- CancelE: Columna calculada a partir de la expresión `Signo * CancelE`.
- CancelC: Columna calculada a partir de la expresión `Signo * CancelC`.
- CancelT: Columna calculada a partir de la expresión `Signo * CancelT`.
- CancelG: Columna calculada a partir de la expresión `Signo * CancelG`.
- Descto1: Columna calculada a partir de la expresión `Signo * Descto1`.
- Descto2: Columna calculada a partir de la expresión `Signo * Descto2`.
- TotalPrd: Columna calculada a partir de la expresión `Signo * TotalPrd`.
- TotalSrv: Columna calculada a partir de la expresión `Signo * TotalSrv`.
- MtoFinanc: Columna calculada a partir de la expresión `Signo * MtoFinanc`.
- Monto_Bruto: Columna calculada a partir de la expresión `Signo * (Monto + MtoTax + Fletes)`.
- Monto_PorUtil: Columna calculada a partir de la expresión `Signo * COALESCE ((Monto - (TotalPrd + TotalSrv)) / NULLIF (Monto, 0) * 100, 0)`.
- Monto_Neto: Columna calculada a partir de la expresión `Signo * Monto`.
- Monto_Descto: Columna calculada a partir de la expresión `Signo * (Descto1 + Descto2)`.
- Contado: Columna calculada a partir de la expresión `Signo * Contado`.
- Credito: Columna calculada a partir de la expresión `Signo * Credito`.
- Notas1: Columna proveniente de `Notas1`.
- Notas2: Columna proveniente de `Notas2`.
- Notas3: Columna proveniente de `Notas3`.
- Notas4: Columna proveniente de `Notas4`.
- Notas5: Columna proveniente de `Notas5`.
- Notas6: Columna proveniente de `Notas6`.
- Notas7: Columna proveniente de `Notas7`.
- Notas8: Columna proveniente de `Notas8`.
- Notas9: Columna proveniente de `Notas9`.
- Notas10: Columna proveniente de `Notas10`.
