# dbo.VW_ADM_LIBROIVACOMPRAS

Vista: dbo.VW_ADM_LIBROIVACOMPRAS
Origen: dbo.VW_ADM_LIBROIVACOMPRAS.sql

## Columnas

- DBZ: Columna calculada a partir de la expresión `'0'`.
- CODSUCU: Columna proveniente de `C.CODSUCU`.
- Tipo: Columna renombrada a partir de `C.TipoCom`.
- TipoReg: Columna calculada a partir de la expresión `(CASE WHEN C.Tipocom = 'H' THEN '01-REG' ELSE '02-REG' END)`.
- FECHATRAN: Columna renombrada a partir de `C.FechaE`.
- FECHACOMPRA: Columna renombrada a partir de `C.FechaI`.
- FechaT: Columna proveniente de `C.FechaT`.
- ID3: Columna proveniente de `C.ID3`.
- CODPROV: Columna proveniente de `C.CODPROV`.
- Descrip: Columna proveniente de `C.Descrip`.
- ID3Ex: Columna calculada a partir de la expresión `IIF(P.TipoPrv = 1, (SELECT RIF FROM [dbo].saconf WITH (NOLOCK) WHERE CODSUCU = '00000'), C.ID3)`.
- DescripEx: Columna calculada a partir de la expresión `IIF(P.TipoPrv = 1, (SELECT Descrip FROM [dbo].saconf WITH (NOLOCK) WHERE codSUCU = '00000'), C.Descrip)`.
- CodOper: Columna proveniente de `C.CodOper`.
- TIPODOC: Columna calculada a partir de la expresión `(CASE WHEN C.Tipocom = 'H' THEN 'FAC' ELSE (CASE IsNull ((SELECT CORRELUNC FROM [dbo].SACONF WHERE CODSUCU = '00000'), 0) WHEN 1 THEN 'N/D' ELSE 'DEV' END) END)`.
- NUMERODOC: Columna renombrada a partir de `C.NumeroD`.
- DOCAFECTADO: Columna calculada a partir de la expresión `(CASE WHEN C.TIPOCOM = 'I' THEN C.NumeroN ELSE NULL END)`.
- NroCtrol: Columna proveniente de `C.NroCtrol`.
- Planilla_Import: Columna renombrada a partir de `C.NumeroP`.
- TOTALNACIONAL: Columna calculada a partir de la expresión `C.Signo * IIF(P.TIPOPRV = 0, (C.Monto + C.Fletes - (C.Descto1 + C.Descto2)), 0)`.
- TOTALIMPORTADO: Columna calculada a partir de la expresión `C.Signo * IIF(P.TIPOPRV = 1, (C.Monto + C.Fletes - (C.Descto1 + C.Descto2)), 0)`.
- TOTALCOMPRA: Columna calculada a partir de la expresión `C.Signo * (C.Monto + C.Fletes - (C.Descto1 + C.Descto2))`.
- TOTALCOMPRACONIVA: Columna calculada a partir de la expresión `C.Signo * (C.Monto + C.Fletes + C.MtoTax - (C.Descto1 + C.Descto2))`.
- TOTALALICUOTA: Columna calculada a partir de la expresión `C.Signo * C.MtoTax`.
- MtoExento: Columna calculada a partir de la expresión `C.Signo * C.TExento`.
- TotalGravable: Columna calculada a partir de la expresión `C.Signo * (C.TGravable + C.TGravable0)`.
- MtoGravable_IVA: Columna calculada a partir de la expresión `(CASE WHEN P.TipoPrv = 0 THEN C.Signo * isnull ((SELECT TOP 1 t .tgravable FROM [dbo].SATAXCOM T WITH (NOLOCK) WHERE (t .codtaxs = 'IVA') AND (t .TIPOCOM = C.TIPOCOM) AND (t .codSucu = c.codsucu) AND (t .codprov = c.codprov) AND (t .numerod = C.numerod)), 0) ELSE 0 END)`.
- Monto_IVA: Columna calculada a partir de la expresión `(CASE WHEN P.TipoPrv = 0 THEN C.Signo * IsNull ((SELECT TOP 1 t .Monto FROM [dbo].SATAXCOM t WITH (NOLOCK) WHERE (t .codtaxs = 'IVA') AND (t .codprov = c.codprov) AND (t .TIPOCOM = C.TIPOCOM) AND (t .codSucu = c.codsucu) AND (t .numerod = C.numerod)), 0) ELSE 0 END)`.
- Alicuota_IVA: Columna calculada a partir de la expresión `(CASE WHEN P.TipoPrv = 0 THEN IsNull ((SELECT TOP 1 t .MtoTax FROM [dbo].SATAXCOM t WITH (NOLOCK) WHERE (t .codtaxs = 'IVA') AND (t .TIPOCOM = C.TIPOCOM) AND (t .codprov = c.codprov) AND (t .codSucu = c.codsucu) AND (t .numerod = C.numerod)), 0) ELSE 0 END)`.
- MtoGravableImpo_IVA: Columna calculada a partir de la expresión `(CASE WHEN P.TipoPrv = 1 THEN C.Signo * isnull ((SELECT TOP 1 t .tgravable FROM [dbo].SATAXCOM T WITH (NOLOCK) WHERE (t .codtaxs = 'IVA') AND (t .TIPOCOM = C.TIPOCOM) AND (t .codprov = c.codprov) AND (t .codSucu = c.codsucu) AND (t .numerod = C.numerod)), 0) ELSE 0 END)`.
- MontoImpo_IVA: Columna calculada a partir de la expresión `(CASE WHEN P.TipoPrv = 1 THEN C.Signo * IsNull ((SELECT TOP 1 T .Monto FROM [dbo].SATAXCOM T WITH (NOLOCK) WHERE (T .Codtaxs = 'IVA') AND (t .codprov = c.codprov) AND (T .TIPOCOM = C.TIPOCOM) AND (t .codSucu = c.codsucu) AND (t .numerod = C.numerod)), 0) ELSE 0 END)`.
- AlicuotaImpo_IVA: Columna calculada a partir de la expresión `(CASE WHEN P.TipoPrv = 1 THEN IsNull ((SELECT TOP 1 t .MtoTax FROM [dbo].SATAXCOM t WITH (NOLOCK) WHERE (t .codtaxs = 'IVA') AND (t .TIPOCOM = C.TIPOCOM) AND (t .codprov = c.codprov) AND (t .codSucu = c.codsucu) AND (t .numerod = C.numerod)), 0) ELSE 0 END)`.
- RetencionIVA: Columna calculada a partir de la expresión `C.Signo * C.RetenIVA`.
- DifRetencion: Columna calculada a partir de la expresión `(CASE WHEN C.MtoTax <> C.RetenIVA THEN C.Signo * (C.MtoTax - C.RetenIVA) ELSE 0 END)`.
- PorctReten: Columna calculada a partir de la expresión `(CASE WHEN C.MtoTax <> 0 THEN C.Signo * Round(C.RetenIVA / C.MtoTax * 100, 2) ELSE 0 END)`.
- NRORETENCION: Columna renombrada a partir de `C.NUMEROR`.
- FechaRetencion: Columna renombrada a partir de `C.fechaR`.
- NroUnico: Columna proveniente de `C.NroUnico`.
