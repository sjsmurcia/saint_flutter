SELECT I.CodInst, I.DEsComi, I.DEsCorrel, I.DigitosC, I.Descto, P.CodProd, P.Descrip, P.Descrip2, P.Descrip3, P.Descrip + COALESCE (' ' + P.Descrip2, '') + COALESCE (' ' + P.Descrip3, '') AS DescripAll, (CASE SUBSTRING(P.DESCRIP, 1, 1) 
                  WHEN '?' THEN 1 ELSE 0 END) AS ESFREEP, P.CostAct, P.CostPro, P.CostAnt, P.Precio1, P.PrecioI1, P.Precio2, P.PrecioI2, P.Precio3, P.PrecioI3, P.PrecioU, P.PrecioIU1, P.PrecioU2, P.PrecioIU2, P.PrecioU3, P.PrecioIU3, P.EsReten, 
                  P.FechaUV, P.FechaUC, P.DiasTole, P.Refere, P.Marca, P.Unidad, P.Activo, P.UndEmpaq, P.CantEmpaq, P.Peso, P.Factor, P.PriceEx, P.Volumen, P.UndVol, P.Existen, P.ExUnidad, ISNULL(E.cantcom, 0) AS CantCom, ISNULL(E.cantped, 0) 
                  AS CantPed, ISNULL(E.unidcom, 0) AS UnidCom, ISNULL(E.unidped, 0) AS UnidPed, P.Minimo, P.Maximo, P.DEsVence, P.EsPesa, P.Tara, P.EsImport, P.EsExento, P.EsOferta, P.EsEnser, P.EsEmpaque, P.ExDecimal, P.DEsComp, P.DEsSeri, 
                  P.DEsLote
FROM     dbo.SAPROD AS P WITH (NOLOCK) INNER JOIN
                  dbo.SAINSTA AS I ON P.CodInst = I.CodInst LEFT OUTER JOIN
                      (SELECT CodProd, SUM(CantCom) AS cantcom, SUM(UnidCom) AS unidcom, SUM(CantPed) AS cantped, SUM(UnidPed) AS unidped
                       FROM      dbo.VW_ADM_PRODEXIST
                       GROUP BY CodProd) AS E ON P.CodProd = E.CodProd