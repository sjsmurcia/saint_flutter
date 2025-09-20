SELECT (CASE WHEN F.TIPOFAC = 'A' THEN '01-REG' ELSE '03-REG' END) AS TipoReg, F.CodSucu, F.TipoFac AS Tipo, F.FechaE AS FechaEmision, F.FechaI AS FechaFactura, F.fechaT, F.ID3 AS RifCliente, F.NumeroP AS NroImprFiscal, 
                  F.NumeroF AS NroFacturaFiscal, F.Descrip AS Nombre, F.CodClie AS CodCliente, C.tipocli AS TipoCliente, 
                  (CASE C.tipocli WHEN 0 THEN 'Contribuyente' WHEN 1 THEN 'Consumidor final' WHEN 2 THEN 'Exportacion' WHEN 3 THEN 'Interno' WHEN 4 THEN 'Contribuyente especial' END) AS DescrTipoClie, F.CodOper, 
                  (CASE WHEN F.TipoFac = 'A' THEN 'FAC' ELSE (CASE IsNull
                      ((SELECT CORRELUNC
                        FROM      [dbo].SACONF
                        WHERE   CODSUCU = '00000'), 0) WHEN 1 THEN 'N/C' ELSE 'DEV' END) END) AS TIPODOC, F.NumeroD AS NumeroDOC, F.NumeroR AS FactAfectada, F.NroCtrol, F.Signo * (F.Monto + F.Fletes - (F.Descto1 + F.Descto2)) AS TOTALVENTAS, 
                  F.Signo * (F.Monto + F.Fletes + F.MtoTax) AS TOTALVENTASCONIVA, F.Signo * (F.TExento + F.Fletes *
                      (SELECT (CASE WHEN IMPFLETEV = 0 THEN 1 ELSE 0 END)
                       FROM      [dbo].SACONF
                       WHERE   CODSUCU = '00000')) AS MtoExento, f.Signo * IIF(C.tipocli <> 1, F.TGravable + TGravable0, 0) AS TotalGravable_Contribuye, f.Signo * IIF(C.tipocli <> 1, f.MtoTax, 0) AS TotalIVAContribuye, f.Signo * IIF(C.tipocli = 1, 
                  F.TGravable + TGravable0, 0) AS TotalGravable_NoContribuye, f.Signo * IIF(C.tipocli = 1, f.MtoTax, 0) AS TotalIVANoContribuye, (CASE WHEN C.tipocli <> 1 THEN F.Signo * isnull
                      ((SELECT TOP 1 t .tgravable
                        FROM      [dbo].sataxvta T WITH (NOLOCK)
                        WHERE   t .codtaxs = 'IVA' AND t .tipofac = f.tipofac AND (t .codSucu = f.codsucu) AND t .numerod = f.numerod), 0) ELSE 0 END) AS MtoGravable_ContribuyeIVA, (CASE WHEN C.tipocli <> 1 THEN F.Signo * IsNull
                      ((SELECT TOP 1 t .Monto
                        FROM      [dbo].sataxvta t WITH (NOLOCK)
                        WHERE   t .codtaxs = 'IVA' AND t .tipofac = f.tipofac AND (t .codSucu = f.codsucu) AND t .numerod = f.numerod), 0) ELSE 0 END) AS MontoIVA_ContribuyeIVA, (CASE WHEN C.tipocli <> 1 THEN IsNull
                      ((SELECT TOP 1 t .MtoTax
                        FROM      [dbo].sataxvta t WITH (NOLOCK)
                        WHERE   t .codtaxs = 'IVA' AND (t .codSucu = f.codsucu) AND t .tipofac = f.tipofac AND t .numerod = f.numerod), 0) ELSE 0 END) AS Alicuota_ContribuyeIVA, (CASE WHEN C.tipocli = 1 THEN F.Signo * isnull
                      ((SELECT TOP 1 t .tgravable
                        FROM      [dbo].sataxvta T WITH (NOLOCK)
                        WHERE   t .codtaxs = 'IVA' AND (t .codSucu = f.codsucu) AND t .tipofac = f.tipofac AND t .numerod = f.numerod), 0) ELSE 0 END) AS MtoGravable_NoContribuyeIVA, (CASE WHEN C.tipocli = 1 THEN F.Signo * IsNull
                      ((SELECT TOP 1 t .Monto
                        FROM      [dbo].sataxvta t WITH (NOLOCK)
                        WHERE   t .codtaxs = 'IVA' AND (t .codSucu = f.codsucu) AND t .tipofac = f.tipofac AND t .numerod = f.numerod), 0) ELSE 0 END) AS MontoIVA_NoContribuyeIVA, (CASE WHEN C.tipocli = 1 THEN IsNull
                      ((SELECT TOP 1 t .MtoTax
                        FROM      [dbo].sataxvta t WITH (NOLOCK)
                        WHERE   t .codtaxs = 'IVA' AND (t .codSucu = f.codsucu) AND t .tipofac = f.tipofac AND t .numerod = f.numerod), 0) ELSE 0 END) AS Alicuota_NoContribuyeIVA, F.Signo * F.RetenIVA AS RetencionIVA, F.Signo * IIF(F.RetenIVA <> 0, 
                  (F.MtoTax - F.RetenIVA), 0) AS DifRetencion, F.Signo * IIF(F.RetenIVA <> 0, Round(F.RetenIVA / F.MtoTax * 100, 2), 0) AS PorctReten, 0 AS BaseReten, f.NumeroT AS NroRetencion, f.FechaR AS FechaRetencion, F.NroUnico AS NroUnico, 
                  0 AS DBZ
FROM     [dbo].SAFACT F WITH (NOLOCK) LEFT JOIN
                  [dbo].SACLIE C ON F.CodClie = C.CodClie
WHERE  (F.TipoFac IN ('A', 'B'))
UNION ALL
(SELECT (CASE WHEN F.TipoCxc = '10' THEN '01-REG' WHEN F.TipoCxc = '20' THEN '02-REG' WHEN SUBSTRING(F.TipoCxc, 1, 1) IN ('3', '8') THEN '03-REG' END) AS TipoReg, F.CodSucu, F.TipoCxc, F.FechaE, F.FechaI, F.FechaT, C.ID3, NULL 
                   AS NroImprFiscal, NULL AS NroFacturaFiscal, C.Descrip AS Nombre, C.codclie AS CodCliente, C.tipocli AS TipoCliente, 
                   (CASE C.tipocli WHEN 0 THEN 'Contribuyente' WHEN 1 THEN 'Consumidor final' WHEN 2 THEN 'Exportacion' WHEN 3 THEN 'Interno' WHEN 4 THEN 'Contribuyente especial' END) AS DescrTipoClie, F.CodOper, 
                   (CASE WHEN F.TipoCxc = '10' THEN 'FAC' WHEN F.TipoCxc = '20' THEN 'N/D' WHEN F.TipoCxc = '31' THEN 'N/C' WHEN F.TipoCxc = '81' THEN 'RET' ELSE NULL END) AS TIPODOC, F.NumeroD AS NumeroDoc, f.numeroN AS factAfectada, 
                   F.NroCtrol, F.Montoneto * (CASE WHEN F.TipoCxc IN ('10', '20') THEN 1 WHEN F.TipoCxc IN ('31') THEN - 1 WHEN F.TipoCxc IN ('81') THEN 0 END) AS TotalVentas, F.Monto * (CASE WHEN F.TipoCxc IN ('10', '20') 
                   THEN 1 WHEN F.TipoCxc IN ('31') THEN - 1 WHEN F.TipoCxc IN ('81') THEN 0 END) AS TotalVentasConIVA, F.TExento * (CASE WHEN f.TipoCxc IN ('10', '20') THEN 1 WHEN f.TipoCxc IN ('31') THEN - 1 WHEN F.TipoCxc IN ('81') THEN 0 END) 
                   AS MtoExento, (CASE WHEN C.tipocli <> 1 THEN (CASE WHEN f.TipoCxc IN ('10', '20') THEN 1 WHEN f.TipoCxc IN ('31') THEN - 1 WHEN f.TipoCxc IN ('81') THEN 0 END) * f.BaseImpo ELSE 0 END), 
                   (CASE WHEN C.tipocli <> 1 THEN (CASE WHEN f.TipoCxc IN ('10', '20') THEN 1 WHEN f.TipoCxc IN ('31') THEN - 1 WHEN f.TipoCxc IN ('81') THEN 0 END) * f.MtoTax ELSE 0 END), (CASE WHEN C.tipocli = 1 THEN (CASE WHEN f.TipoCxc IN ('10', 
                   '20') THEN 1 WHEN f.TipoCxc IN ('31') THEN - 1 WHEN f.TipoCxc IN ('81') THEN 0 END) * f.BaseImpo ELSE 0 END), (CASE WHEN C.tipocli = 1 THEN (CASE WHEN f.TipoCxc IN ('10', '20') THEN 1 WHEN f.TipoCxc IN ('31') 
                   THEN - 1 WHEN f.TipoCxc IN ('81') THEN 0 END) * f.MtoTax ELSE 0 END), (CASE WHEN C.tipocli <> 1 THEN (CASE WHEN f.TipoCxc IN ('10', '20') THEN 1 WHEN f.TipoCxc IN ('31') THEN - 1 WHEN f.TipoCxc IN ('81') THEN 0 END) * Isnull
                       ((SELECT TOP 1 T .TGravable
                         FROM      [dbo].SATAXCXC T WITH (NOLOCK)
                         WHERE   T .Codtaxs = 'IVA' AND T .NroPpal = f.NroUnico), 0) ELSE 0 END), (CASE WHEN C.TipoCli <> 1 THEN (CASE WHEN f.TipoCxc IN ('10', '20') THEN 1 WHEN f.TipoCxc IN ('31') THEN - 1 WHEN f.TipoCxc IN ('81') THEN 0 END) 
                   * Isnull
                       ((SELECT TOP 1 t .Monto
                         FROM      [dbo].SATAXCXC T WITH (NOLOCK)
                         WHERE   t .codtaxs = 'IVA' AND t .nroppal = f.nrounico), 0) ELSE 0 END), (CASE WHEN C.TipoCli <> 1 THEN (CASE WHEN f.TipoCxc IN ('10', '20') THEN 1 WHEN f.TipoCxc IN ('31') THEN - 1 WHEN f.TipoCxc IN ('81') THEN 0 END) 
                   * Isnull
                       ((SELECT TOP 1 T .MtoTax
                         FROM      [dbo].SATAXCXC T WITH (NOLOCK)
                         WHERE   t .codtaxs = 'IVA' AND t .nroppal = f.nrounico), 0) ELSE 0 END), (CASE WHEN C.TipoCli = 1 THEN (CASE WHEN f.TipoCxc IN ('10', '20') THEN 1 WHEN f.TipoCxc IN ('31') THEN - 1 WHEN f.TipoCxc IN ('81') THEN 0 END) * Isnull
                       ((SELECT TOP 1 t .TGravable
                         FROM      [dbo].SATAXCXC T WITH (NOLOCK)
                         WHERE   T .Codtaxs = 'IVA' AND T .NroPpal = f.NroUnico), 0) ELSE 0 END), (CASE WHEN C.TipoCli = 1 THEN (CASE WHEN f.TipoCxc IN ('10', '20') THEN 1 WHEN f.TipoCxc IN ('31') THEN - 1 WHEN f.TipoCxc IN ('81') THEN 0 END) 
                   * Isnull
                       ((SELECT TOP 1 t .Monto
                         FROM      [dbo].SATAXCXC T WITH (NOLOCK)
                         WHERE   t .codtaxs = 'IVA' AND t .nroppal = f.nrounico), 0) ELSE 0 END), (CASE WHEN C.tipocli = 1 THEN (CASE WHEN f.TipoCxc IN ('10', '20') THEN 1 WHEN f.TipoCxc IN ('31') THEN - 1 WHEN f.TipoCxc IN ('81') THEN 0 END) * Isnull
                       ((SELECT TOP 1 t .MtoTax
                         FROM      [dbo].SATAXCXC T WITH (NOLOCK)
                         WHERE   t .codtaxs = 'IVA' AND t .nroppal = f.nrounico), 0) ELSE 0 END), D .Monto * (CASE WHEN f.TipoCxc IN ('10', '20', '81') THEN 1 WHEN f.TipoCxc IN ('31') THEN - 1 END), (CASE WHEN f.TipoCxc IN ('10', '20', '81') 
                   THEN 1 WHEN f.TipoCxc IN ('31') THEN - 1 END) * (CASE WHEN F.RetenIVA <> 0 THEN (D .BaseReten - D .Monto) ELSE 0 END) AS DifRetencion, (CASE WHEN f.TipoCxc IN ('10', '20', '81') THEN 1 WHEN f.TipoCxc IN ('31') THEN - 1 END) 
                   * (CASE WHEN D .Monto <> 0 THEN Round(D .Monto / IIF(D .BaseReten = 0, 1, D .BaseReten) * 100, 2) ELSE 0 END) AS PorctReten, D .BaseReten, f.NumeroT AS NroRetencion, f.fechaR AS FechaRetencion, F.NroUnico AS NroUnico, 
                   1 AS DBZ
 FROM      [dbo].SAACXC F WITH (NOLOCK) LEFT JOIN
                   [dbo].SACLIE C ON C.CodClie = F.CodClie LEFT JOIN
                   [dbo].SAPAGCXC D ON F.NroUnico = D .NroPpal
 WHERE   (f.TipoCxc IN ('10', '20', '31', '81')) AND (f.EsLibroI = 1 AND f.FROMTRAN = 1));