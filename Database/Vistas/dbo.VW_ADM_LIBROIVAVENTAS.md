# dbo.VW_ADM_LIBROIVAVENTAS

Vista: dbo.VW_ADM_LIBROIVAVENTAS
Origen: dbo.VW_ADM_LIBROIVAVENTAS.sql

## Columnas

- TipoReg: Columna calculada a partir de la expresión `(CASE WHEN F.TIPOFAC = 'A' THEN '01-REG' ELSE '03-REG' END)`.
- CodSucu: Columna proveniente de `F.CodSucu`.
- Tipo: Columna renombrada a partir de `F.TipoFac`.
- FechaEmision: Columna renombrada a partir de `F.FechaE`.
- FechaFactura: Columna renombrada a partir de `F.FechaI`.
- fechaT: Columna proveniente de `F.fechaT`.
- RifCliente: Columna renombrada a partir de `F.ID3`.
- NroImprFiscal: Columna renombrada a partir de `F.NumeroP`.
- NroFacturaFiscal: Columna renombrada a partir de `F.NumeroF`.
- Nombre: Columna renombrada a partir de `F.Descrip`.
- CodCliente: Columna renombrada a partir de `F.CodClie`.
- TipoCliente: Columna renombrada a partir de `C.tipocli`.
- DescrTipoClie: Columna calculada a partir de la expresión `(CASE C.tipocli WHEN 0 THEN 'Contribuyente' WHEN 1 THEN 'Consumidor final' WHEN 2 THEN 'Exportacion' WHEN 3 THEN 'Interno' WHEN 4 THEN 'Contribuyente especial' END)`.
- CodOper: Columna proveniente de `F.CodOper`.
- TIPODOC: Columna calculada a partir de la expresión `(CASE WHEN F.TipoFac = 'A' THEN 'FAC' ELSE (CASE IsNull ((SELECT CORRELUNC FROM [dbo].SACONF WHERE CODSUCU = '00000'), 0) WHEN 1 THEN 'N/C' ELSE 'DEV' END) END)`.
- NumeroDOC: Columna renombrada a partir de `F.NumeroD`.
- FactAfectada: Columna renombrada a partir de `F.NumeroR`.
- NroCtrol: Columna proveniente de `F.NroCtrol`.
- TOTALVENTAS: Columna calculada a partir de la expresión `F.Signo * (F.Monto + F.Fletes - (F.Descto1 + F.Descto2))`.
- TOTALVENTASCONIVA: Columna calculada a partir de la expresión `F.Signo * (F.Monto + F.Fletes + F.MtoTax)`.
- MtoExento: Columna calculada a partir de la expresión `F.Signo * (F.TExento + F.Fletes * (SELECT (CASE WHEN IMPFLETEV = 0 THEN 1 ELSE 0 END) FROM [dbo].SACONF WHERE CODSUCU = '00000'))`.
- TotalGravable_Contribuye: Columna calculada a partir de la expresión `f.Signo * IIF(C.tipocli <> 1, F.TGravable + TGravable0, 0)`.
- TotalIVAContribuye: Columna calculada a partir de la expresión `f.Signo * IIF(C.tipocli <> 1, f.MtoTax, 0)`.
- TotalGravable_NoContribuye: Columna calculada a partir de la expresión `f.Signo * IIF(C.tipocli = 1, F.TGravable + TGravable0, 0)`.
- TotalIVANoContribuye: Columna calculada a partir de la expresión `f.Signo * IIF(C.tipocli = 1, f.MtoTax, 0)`.
- MtoGravable_ContribuyeIVA: Columna calculada a partir de la expresión `(CASE WHEN C.tipocli <> 1 THEN F.Signo * isnull ((SELECT TOP 1 t .tgravable FROM [dbo].sataxvta T WITH (NOLOCK) WHERE t .codtaxs = 'IVA' AND t .tipofac = f.tipofac AND (t .codSucu = f.codsucu) AND t .numerod = f.numerod), 0) ELSE 0 END)`.
- MontoIVA_ContribuyeIVA: Columna calculada a partir de la expresión `(CASE WHEN C.tipocli <> 1 THEN F.Signo * IsNull ((SELECT TOP 1 t .Monto FROM [dbo].sataxvta t WITH (NOLOCK) WHERE t .codtaxs = 'IVA' AND t .tipofac = f.tipofac AND (t .codSucu = f.codsucu) AND t .numerod = f.numerod), 0) ELSE 0 END)`.
- Alicuota_ContribuyeIVA: Columna calculada a partir de la expresión `(CASE WHEN C.tipocli <> 1 THEN IsNull ((SELECT TOP 1 t .MtoTax FROM [dbo].sataxvta t WITH (NOLOCK) WHERE t .codtaxs = 'IVA' AND (t .codSucu = f.codsucu) AND t .tipofac = f.tipofac AND t .numerod = f.numerod), 0) ELSE 0 END)`.
- MtoGravable_NoContribuyeIVA: Columna calculada a partir de la expresión `(CASE WHEN C.tipocli = 1 THEN F.Signo * isnull ((SELECT TOP 1 t .tgravable FROM [dbo].sataxvta T WITH (NOLOCK) WHERE t .codtaxs = 'IVA' AND (t .codSucu = f.codsucu) AND t .tipofac = f.tipofac AND t .numerod = f.numerod), 0) ELSE 0 END)`.
- MontoIVA_NoContribuyeIVA: Columna calculada a partir de la expresión `(CASE WHEN C.tipocli = 1 THEN F.Signo * IsNull ((SELECT TOP 1 t .Monto FROM [dbo].sataxvta t WITH (NOLOCK) WHERE t .codtaxs = 'IVA' AND (t .codSucu = f.codsucu) AND t .tipofac = f.tipofac AND t .numerod = f.numerod), 0) ELSE 0 END)`.
- Alicuota_NoContribuyeIVA: Columna calculada a partir de la expresión `(CASE WHEN C.tipocli = 1 THEN IsNull ((SELECT TOP 1 t .MtoTax FROM [dbo].sataxvta t WITH (NOLOCK) WHERE t .codtaxs = 'IVA' AND (t .codSucu = f.codsucu) AND t .tipofac = f.tipofac AND t .numerod = f.numerod), 0) ELSE 0 END)`.
- RetencionIVA: Columna calculada a partir de la expresión `F.Signo * F.RetenIVA`.
- DifRetencion: Columna calculada a partir de la expresión `F.Signo * IIF(F.RetenIVA <> 0, (F.MtoTax - F.RetenIVA), 0)`.
- PorctReten: Columna calculada a partir de la expresión `F.Signo * IIF(F.RetenIVA <> 0, Round(F.RetenIVA / F.MtoTax * 100, 2), 0)`.
- BaseReten: Columna renombrada a partir de `0`.
- NroRetencion: Columna renombrada a partir de `f.NumeroT`.
- FechaRetencion: Columna renombrada a partir de `f.FechaR`.
- NroUnico: Columna proveniente de `F.NroUnico`.
- DBZ: Columna renombrada a partir de `0`.
