SELECT '0' AS DBZ, C.CODSUCU, C.TipoCom AS Tipo, (CASE WHEN C.Tipocom = 'H' THEN '01-REG' ELSE '02-REG' END) AS TipoReg, C.FechaE AS FECHATRAN, C.FechaI AS FECHACOMPRA, C.FechaT, C.ID3, C.CODPROV, C.Descrip, 
                  IIF(P.TipoPrv = 1,
                      (SELECT RIF
                       FROM      [dbo].saconf WITH (NOLOCK)
                       WHERE   CODSUCU = '00000'), C.ID3) AS ID3Ex, IIF(P.TipoPrv = 1,
                      (SELECT Descrip
                       FROM      [dbo].saconf WITH (NOLOCK)
                       WHERE   codSUCU = '00000'), C.Descrip) AS DescripEx, C.CodOper, (CASE WHEN C.Tipocom = 'H' THEN 'FAC' ELSE (CASE IsNull
                      ((SELECT CORRELUNC
                        FROM      [dbo].SACONF
                        WHERE   CODSUCU = '00000'), 0) WHEN 1 THEN 'N/D' ELSE 'DEV' END) END) AS TIPODOC, C.NumeroD AS NUMERODOC, (CASE WHEN C.TIPOCOM = 'I' THEN C.NumeroN ELSE NULL END) AS DOCAFECTADO, C.NroCtrol, 
                  C.NumeroP AS Planilla_Import, C.Signo * IIF(P.TIPOPRV = 0, (C.Monto + C.Fletes - (C.Descto1 + C.Descto2)), 0) AS TOTALNACIONAL, C.Signo * IIF(P.TIPOPRV = 1, (C.Monto + C.Fletes - (C.Descto1 + C.Descto2)), 0) AS TOTALIMPORTADO, 
                  C.Signo * (C.Monto + C.Fletes - (C.Descto1 + C.Descto2)) AS TOTALCOMPRA, C.Signo * (C.Monto + C.Fletes + C.MtoTax - (C.Descto1 + C.Descto2)) AS TOTALCOMPRACONIVA, C.Signo * C.MtoTax AS TOTALALICUOTA, 
                  C.Signo * C.TExento AS MtoExento, C.Signo * (C.TGravable + C.TGravable0) AS TotalGravable, (CASE WHEN P.TipoPrv = 0 THEN C.Signo * isnull
                      ((SELECT TOP 1 t .tgravable
                        FROM      [dbo].SATAXCOM T WITH (NOLOCK)
                        WHERE   (t .codtaxs = 'IVA') AND (t .TIPOCOM = C.TIPOCOM) AND (t .codSucu = c.codsucu) AND (t .codprov = c.codprov) AND (t .numerod = C.numerod)), 0) ELSE 0 END) AS MtoGravable_IVA, 
                  (CASE WHEN P.TipoPrv = 0 THEN C.Signo * IsNull
                      ((SELECT TOP 1 t .Monto
                        FROM      [dbo].SATAXCOM t WITH (NOLOCK)
                        WHERE   (t .codtaxs = 'IVA') AND (t .codprov = c.codprov) AND (t .TIPOCOM = C.TIPOCOM) AND (t .codSucu = c.codsucu) AND (t .numerod = C.numerod)), 0) ELSE 0 END) AS Monto_IVA, (CASE WHEN P.TipoPrv = 0 THEN IsNull
                      ((SELECT TOP 1 t .MtoTax
                        FROM      [dbo].SATAXCOM t WITH (NOLOCK)
                        WHERE   (t .codtaxs = 'IVA') AND (t .TIPOCOM = C.TIPOCOM) AND (t .codprov = c.codprov) AND (t .codSucu = c.codsucu) AND (t .numerod = C.numerod)), 0) ELSE 0 END) AS Alicuota_IVA, 
                  (CASE WHEN P.TipoPrv = 1 THEN C.Signo * isnull
                      ((SELECT TOP 1 t .tgravable
                        FROM      [dbo].SATAXCOM T WITH (NOLOCK)
                        WHERE   (t .codtaxs = 'IVA') AND (t .TIPOCOM = C.TIPOCOM) AND (t .codprov = c.codprov) AND (t .codSucu = c.codsucu) AND (t .numerod = C.numerod)), 0) ELSE 0 END) AS MtoGravableImpo_IVA, 
                  (CASE WHEN P.TipoPrv = 1 THEN C.Signo * IsNull
                      ((SELECT TOP 1 T .Monto
                        FROM      [dbo].SATAXCOM T WITH (NOLOCK)
                        WHERE   (T .Codtaxs = 'IVA') AND (t .codprov = c.codprov) AND (T .TIPOCOM = C.TIPOCOM) AND (t .codSucu = c.codsucu) AND (t .numerod = C.numerod)), 0) ELSE 0 END) AS MontoImpo_IVA, 
                  (CASE WHEN P.TipoPrv = 1 THEN IsNull
                      ((SELECT TOP 1 t .MtoTax
                        FROM      [dbo].SATAXCOM t WITH (NOLOCK)
                        WHERE   (t .codtaxs = 'IVA') AND (t .TIPOCOM = C.TIPOCOM) AND (t .codprov = c.codprov) AND (t .codSucu = c.codsucu) AND (t .numerod = C.numerod)), 0) ELSE 0 END) AS AlicuotaImpo_IVA, C.Signo * C.RetenIVA AS RetencionIVA, 
                  (CASE WHEN C.MtoTax <> C.RetenIVA THEN C.Signo * (C.MtoTax - C.RetenIVA) ELSE 0 END) AS DifRetencion, (CASE WHEN C.MtoTax <> 0 THEN C.Signo * Round(C.RetenIVA / C.MtoTax * 100, 2) ELSE 0 END) AS PorctReten, 
                  C.NUMEROR AS NRORETENCION, C.fechaR AS FechaRetencion, C.NroUnico AS NroUnico
FROM     [dbo].SACOMP C WITH (NOLOCK) LEFT JOIN
                  [dbo].SAPROV P ON C.CodProv = P.CodProv
WHERE  (C.TipoCom IN ('H', 'I'))
UNION ALL
(SELECT '1' AS DBZ, T .CODSUCU, T .TipoCxP AS Tipo, (CASE WHEN T .TipoCxP = '10' THEN '01-REG' WHEN T .TipoCxP = '30' THEN '03-REG' WHEN T .TipoCxP = '81' THEN '03-REG' WHEN T .TipoCxP = '82' THEN '03-REG' WHEN SUBSTRING(T .TipoCxP, 
                   1, 1) = '2' THEN '02-REG' END) AS Reg, T .FechaE, T .FechaI, T .FechaT, T .ID3, P.CODPROV, T .Descrip, (CASE WHEN P.TipoPrv = 1 THEN
                       (SELECT RIF
                        FROM      [dbo].SACONF WITH (NOLOCK)) ELSE T .ID3 END) AS ID3Ex, (CASE WHEN P.TipoPrv = 1 THEN
                       (SELECT Descrip
                        FROM      [dbo].SACONF WITH (NOLOCK)) ELSE T .Descrip END) AS DescripEx, T .CodOper, 
                   (CASE WHEN T .TipoCxP = '10' THEN 'FAC' WHEN T .TipoCxP = '30' THEN 'N/C' WHEN T .TipoCxP = '81' THEN 'RET' WHEN T .TipoCxP = '82' THEN 'RET' WHEN T .TipoCxP = '21' THEN 'N/D' END) AS TIPODOC, T .NUMEROD, T .NumeroN, 
                   T .NroCtrol, NULL AS Planilla_Import, T .Monto * (CASE WHEN P.TipoPrv = 0 THEN (CASE WHEN T .TipoCxP IN ('10', '30') THEN 1 ELSE - 1 END) ELSE 0 END) AS TotalNac, 
                   T .Monto * (CASE WHEN P.TipoPrv = 1 THEN (CASE WHEN T .TipoCxP IN ('10', '30') THEN 1 ELSE - 1 END) ELSE 0 END) AS TotalExt, T .MontoNETO * (CASE WHEN T .TipoCxP IN ('10', '30') THEN 1 ELSE - 1 END) AS TOTALCOMPRA, 
                   (T .MontoNeto + T .MtoTax) * (CASE WHEN T .TipoCxP IN ('10', '30') THEN 1 WHEN T .TipoCxP IN ('81') THEN 0 ELSE - 1 END) AS TOTALCOMPRACONIVA, T .MtoTax * (CASE WHEN T .TipoCxP IN ('10', '30') THEN 1 WHEN T .TipoCxP IN ('81') 
                   THEN 0 ELSE - 1 END) AS TOTALALICUOTA, (CASE WHEN T .TipoCxP IN ('10', '30') THEN 1 WHEN T .TipoCxP IN ('81') THEN 0 ELSE - 1 END) 
                   * ((CASE WHEN T .MontoNeto = 0 THEN T .MONTO - (CASE WHEN T .ORGTAX = 0 THEN T .MTOTAX ELSE T .OrgTax END) ELSE T .MontoNETO END) - T .BaseImpo), (CASE WHEN T .TipoCxP IN ('10', '30') THEN 1 ELSE - 1 END) * T .BaseImpo, 
                   (CASE WHEN P.TipoPrv = 0 THEN (CASE WHEN T .TipoCxP IN ('10', '30') THEN 1 ELSE - 1 END) * IsNull
                       ((SELECT TOP 1 tP.tgravable
                         FROM      [dbo].SATAXCXP TP WITH (NOLOCK)
                         WHERE   (tp.codtaxs = 'IVA') AND (tp.nroppal = T .nrounico)), 0) ELSE 0 END) AS MtoGravable_IVA, (CASE WHEN P.TipoPrv = 0 THEN (CASE WHEN T .TipoCxP IN ('10', '30') THEN 1 ELSE - 1 END) * IsNull
                       ((SELECT TOP 1 tP.Monto
                         FROM      [dbo].SATAXCXP tP WITH (NOLOCK)
                         WHERE   (tP.codtaxs = 'IVA') AND (tp.nroppal = T .nrounico)), 0) ELSE 0 END) AS Monto_IVA, (CASE WHEN P.TipoPrv = 0 THEN (CASE WHEN T .TipoCxP IN ('10', '30') THEN 1 ELSE - 1 END) * IsNull
                       ((SELECT TOP 1 tP.MtoTax
                         FROM      [dbo].SATAXCXP tP WITH (NOLOCK)
                         WHERE   (tP.codtaxs = 'IVA') AND (tp.nroppal = T .nrounico)), 0) ELSE 0 END) AS Alicuota_IVA, (CASE WHEN P.TipoPrv = 1 THEN (CASE WHEN T .TipoCxP IN ('10', '30') THEN 1 ELSE - 1 END) * IsNull
                       ((SELECT TOP 1 tP.tgravable
                         FROM      [dbo].SATAXCXP TP WITH (NOLOCK)
                         WHERE   (tp.codtaxs = 'IVA') AND (tp.nroppal = T .nrounico)), 0) ELSE 0 END) AS MtoGravableImpo_IVA, (CASE WHEN P.TipoPrv = 1 THEN (CASE WHEN T .TipoCxP IN ('10', '30') THEN 1 ELSE - 1 END) * IsNull
                       ((SELECT TOP 1 tP.Monto
                         FROM      [dbo].SATAXCXP tP WITH (NOLOCK)
                         WHERE   (tP.codtaxs = 'IVA') AND (tp.nroppal = T .nrounico)), 0) ELSE 0 END) AS MontoImpo_IVA, (CASE WHEN P.TipoPrv = 1 THEN (CASE WHEN T .TipoCxP IN ('10', '30') THEN 1 ELSE - 1 END) * IsNull
                       ((SELECT TOP 1 tP.MtoTax
                         FROM      [dbo].SATAXCXP tP WITH (NOLOCK)
                         WHERE   (tP.codtaxs = 'IVA') AND (tp.nroppal = T .nrounico)), 0) ELSE 0 END) AS AlicuotaImpo_IVA, (CASE WHEN T .TipoCxP IN ('10', '30', '81') THEN 1 ELSE - 1 END) * T .RetenIVA AS RetencionIVA, 
                   (CASE WHEN T .RetenIVA <> 0 THEN (CASE WHEN T .TipoCxP IN ('10', '30', '81') THEN 1 ELSE - 1 END) * (T .MtoTax - T .RetenIVA) ELSE 0 END) AS DifRetencion, (CASE WHEN T .MtoTax <> 0 THEN (CASE WHEN T .TipoCxP IN ('10', '30', '81') 
                   THEN 1 ELSE - 1 END) * Round(T .RetenIVA / T .MtoTax * 100, 2) ELSE 0 END) AS PorctReten, (CASE WHEN T .TipoCxP IN ('10', '30') THEN
                       (SELECT TOP 1 NUMEROD
                        FROM      [dbo].SAACXP
                        WHERE   NROREGI = T .NROUNICO AND TIPOCXP = '81') WHEN T .TipoCxP = '81' THEN T .NUMEROD ELSE NULL END) AS NRORETENCION, (CASE WHEN T .TipoCxP IN ('10', '30') 
                   THEN T .fechaR WHEN T .TipoCxP = '81' THEN T .FECHAE ELSE NULL END) AS FechaRetencion, T .NroUnico AS NroUnico
 FROM      [dbo].SAACXP T WITH (NOLOCK) LEFT JOIN
                   [dbo].SAPROV P ON (T .CodProv = P.CodProv)
 WHERE   (T .FROMTRAN = 1) AND (T .EsLibroI = 1) AND (T .TipoCxP IN ('10', '21', '30', '81', '82')));