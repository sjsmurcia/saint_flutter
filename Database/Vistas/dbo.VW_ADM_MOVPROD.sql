SELECT P.CodProd, P.DESCRIP, P.CODINST, P.ESENSER, P.ESIMPORT, P.ESEMPAQUE, P.EXISTEN, P.EXUNIDAD, P.MARCA, SI.TipoFac AS Tipo, SI.NumeroD, SI.FechaE, S.CodClie AS Codigo, SI.CodUbic AS CodUbic1, NULL AS CodUbic2, 
                  S.Descrip AS DESCRIPT, SI.EsUnid, SI.NroLinea, SUM(SI.Costo) AS Costo, SUM(SI.Precio) AS Precio, SUM(SI.Cantidad * SI.CantMayor) AS Cantidad, SUM(CASE si.esunid WHEN 1 THEN SI.existAntU ELSE SI.existAnt END) AS ExistAnt, 
                  SUM((CASE WHEN SI.TipoFac IN ('B', 'D') THEN 1 ELSE 0 END) * SI.Cantidad * SI.CantMayor) AS Entrada, SUM((CASE WHEN SI.TipoFac IN ('A', 'C') THEN 1 ELSE 0 END) * SI.Cantidad * SI.CantMayor) AS Salida, 
                  SUM((CASE si.esunid WHEN 1 THEN SI.existAntU ELSE SI.existAnt END) - (CASE WHEN SI.TipoFac IN ('B', 'D') THEN - 1 ELSE 1 END) * SI.Cantidad * SI.CantMayor) AS Saldo
FROM     SAPROD AS P, SAINSTA AS I, SAFACT AS S, SAITEMFAC AS SI WITH (NOLOCK)
WHERE  (P.CodProd = SI.CodItem) AND (P.CODINST = I.CODINST) AND (P.DEsComp = 0) AND (S.TipoFac = SI.TipoFac) AND (S.NumeroD = SI.NumeroD) AND (S.codSucu = SI.codsucu) AND (SI.TipoFac IN ('A', 'B', 'C', 'D'))
GROUP BY P.CodProd, si.FechaE, SI.Existant, SI.CodUbic, S.Descrip, SI.EsUnid, SI.NroLinea, SI.TipoFac, SI.ExistantU, S.CodClie, SI.NumeroD, P.DESCRIP, P.CODINST, P.ESENSER, P.ESIMPORT, P.ESEMPAQUE, P.MARCA, P.EXISTEN, 
                  P.EXUNIDAD
UNION ALL
(SELECT P.CodProd, P.DESCRIP, P.CODINST, P.ESENSER, P.ESIMPORT, P.ESEMPAQUE, P.EXISTEN, P.EXUNIDAD, P.MARCA, SI.TipoCOM AS Tipo, SI.NumeroD, SI.FechaE, S.CodPROV AS Codigo, SI.CodUbic AS CodUbic1, NULL AS CODUBIC2, 
                   S.DESCRIP AS DESCRIPT, SI.EsUnid, SI.NroLinea, SUM(SI.Costo) AS Costo, SUM(SI.Costo) AS Precio, SUM(SI.Cantidad) AS Cantidad, SUM(CASE si.esunid WHEN 1 THEN SI.existAntU ELSE SI.existAnt END) AS ExistAnt, 
                   SUM((CASE WHEN si.TipoCom IN ('H', 'J') THEN 1 ELSE 0 END) * SI.Cantidad) AS Entrada, SUM((CASE WHEN si.TipoCom IN ('I', 'K') THEN 1 ELSE 0 END) * SI.Cantidad) AS Salida, 
                   SUM((CASE si.esunid WHEN 1 THEN SI.existAntU ELSE SI.existAnt END) + (CASE WHEN si.TipoCom IN ('H', 'J') THEN 1 ELSE - 1 END) * SI.Cantidad) AS Saldo
 FROM      [dbo].SAPROD AS P, SAINSTA AS I, SACOMP AS S, SAITEMCOM AS SI WITH (NOLOCK)
 WHERE   (P.CodProd = SI.CodItem) AND (P.CODINST = I.CODINST) AND (S.codSucu = SI.codsucu) AND (S.TipoCom = SI.TipoCom) AND (S.NumeroD = SI.NumeroD) AND (S.CodProv = SI.CodProv) AND (SI.TipoCom IN ('H', 'I', 'J', 'K'))
 GROUP BY P.CodProd, si.FechaE, si.existAnt, si.CodUbic, S.Descrip, SI.EsUnid, SI.NroLinea, si.TipoCom, SI.ExistantU, S.CodProv, Si.NumeroD, P.DESCRIP, P.CODINST, P.ESENSER, P.ESIMPORT, P.ESEMPAQUE, P.MARCA, P.EXISTEN, P.EXUNIDAD)
UNION ALL
(SELECT P.CodProd, P.DESCRIP, P.CODINST, P.ESENSER, P.ESIMPORT, P.ESEMPAQUE, P.EXISTEN, P.EXUNIDAD, P.MARCA, SI.TipoOPI AS Tipo, SI.NumeroD, SI.FechaE, NULL AS Codigo, SI.CodUbic, NULL AS Codubic2, S.USOMAT AS DESCRIPT, 
                   SI.EsUnid, SI.NroLinea, SUM(si.Costo) AS Costo, SUM(si.Costo) AS Precio, SUM(CASE WHEN si.TipoOpI IN ('O', 'N', 'P') THEN SI.Cantidad ELSE Abs(SI.CantidadA - SI.Cantidad) END) AS Cantidad, 
                   SUM(CASE si.esunid WHEN 1 THEN SI.existAntU ELSE SI.existAnt END) AS ExistAnt, SUM((CASE WHEN si.TipoOpI = 'O' THEN SI.Cantidad WHEN si.TipoOpI IN ('N', 'P') 
                   THEN 0 WHEN si.TipoOpI = 'Q' THEN (CASE WHEN SI.CantidadA - SI.Cantidad < 0 THEN Abs(SI.CantidadA - SI.Cantidad) ELSE 0 END) END)) AS Entrada, SUM((CASE WHEN si.TipoOpI = 'O' THEN 0 WHEN si.TipoOpI IN ('N', 'P') 
                   THEN SI.Cantidad WHEN si.TipoOpI = 'Q' THEN (CASE WHEN SI.CantidadA - SI.Cantidad < 0 THEN 0 ELSE Abs(SI.CantidadA - SI.Cantidad) END) END)) AS Salida, SUM((CASE si.esunid WHEN 1 THEN SI.existAntU ELSE SI.existAnt END) 
                   + (CASE WHEN SI.TipoOpI = 'O' THEN SI.Cantidad WHEN SI.TipoOpI IN ('N', 'P') THEN - SI.Cantidad WHEN SI.TipoOpI = 'Q' THEN (CASE WHEN SI.CantidadA - SI.Cantidad <= 0 THEN Abs(SI.CantidadA - SI.Cantidad) 
                   ELSE - Abs(SI.CantidadA - SI.Cantidad) END) END)) AS Saldo
 FROM      [dbo].SAPROD AS P, SAINSTA AS I, SAOPEI AS S, SAITEMOPI AS SI WITH (NOLOCK)
 WHERE   (P.CodProd = SI.CodItem) AND (P.CODINST = I.CODINST) AND (S.CodSucu = SI.CodSucu) AND (S.TipoOpI = SI.TipoOpI) AND (S.NumeroD = SI.NumeroD) AND (SI.TipoOpI IN ('N', 'O', 'Q', 'P'))
 GROUP BY P.CodProd, si.FechaE, si.existAnt, si.CodUbic, si.CodUbic2, S.UsoMat, SI.EsUnid, SI.ExistantU, SI.NroLinea, si.TipoOpI, S.Autori, Si.NumeroD, P.DESCRIP, P.CODINST, P.ESENSER, P.ESIMPORT, P.ESEMPAQUE, P.MARCA, P.EXISTEN, 
                   P.EXUNIDAD)
UNION ALL
(SELECT P.CodProd, P.DESCRIP, P.CODINST, P.ESENSER, P.ESIMPORT, P.ESEMPAQUE, P.EXISTEN, P.EXUNIDAD, P.MARCA, SI.TipoOPI AS Tipo, SI.NumeroD, SI.FechaE + 0.001, NULL AS Codigo, SI.CodUbic2, SI.CodUbic, S.USOMAT AS DESCRIPT, 
                   SI.EsUnid, SI.NroLinea, SUM(SI.Costo) AS Costo, SUM(SI.Costo) AS Precio, SUM(SI.Cantidad) AS Cantidad, SUM(CASE si.esunid WHEN 1 THEN SI.existAntU ELSE SI.existAnt END) AS ExistAnt, SUM(SI.Cantidad) AS Entrada, SUM(0) 
                   AS Salida, SUM((CASE si.esunid WHEN 1 THEN SI.existAntU ELSE SI.existAnt END)) AS Saldo
 FROM      [dbo].SAPROD AS P, SAINSTA AS I, SAOPEI AS S, SAITEMOPI AS SI WITH (NOLOCK)
 WHERE   (P.CodProd = SI.CodItem) AND (P.CODINST = I.CODINST) AND (P.DEsComp = 0) AND (S.CODSUCU = SI.CODSUCU) AND (S.TipoOpI = SI.TipoOpI) AND (S.NumeroD = SI.NumeroD) AND (SI.TipoOpI = 'N')
 GROUP BY P.CodProd, si.FechaE, si.existAnt, SI.ExistantU, si.CodUbic, si.CodUbic2, S.UsoMat, SI.EsUnid, SI.NroLinea, si.TipoOpI, s.Autori, Si.NumeroD, P.DESCRIP, P.CODINST, P.ESENSER, P.ESIMPORT, P.ESEMPAQUE, P.MARCA, P.EXISTEN, 
                   P.EXUNIDAD)