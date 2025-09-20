SELECT I.DEsComi, I.DEsCorrel, I.DigitosC, I.Descto, I.CodInst, P.CodProd, P.Descrip, P.Descrip2, P.Descrip3, P.Descrip + COALESCE (' ' + P.Descrip2, '') + COALESCE (' ' + P.Descrip3, '') AS DescripAll, (CASE SUBSTRING(P.DESCRIP, 1, 1) 
                  WHEN '?' THEN 1 ELSE 0 END) AS ESFREEP, p.costact, (p.costact + isnull(tx.mtofijo, 0) + p.costact * isnull(tx.mtotax, 0)) costoacttx, p.costpro, (p.costpro + isnull(tx.mtofijo, 0) + p.costpro * isnull(tx.mtotax, 0)) costoprotx, p.costant, 
                  (p.costant + isnull(tx.mtofijo, 0) + p.costant * isnull(tx.mtotax, 0)) costoanttx, P.Precio1, (p.precio1 + isnull(tx.mtofijo, 0) + p.precio1 * isnull(tx.mtotax, 0)) preciotx1, P.PrecioI1, P.Precio2, (p.precio2 + isnull(tx.mtofijo, 0) 
                  + p.precio2 * isnull(tx.mtotax, 0)) preciotx2, P.PrecioI2, P.Precio3, (p.precio3 + isnull(tx.mtofijo, 0) + p.precio3 * isnull(tx.mtotax, 0)) preciotx3, P.PrecioI3, P.PrecioU preciou1, (p.precioU + isnull(tx.mtofijo / iif(p.cantempaq = 0, 1, p.cantempaq), 0) 
                  + p.precioU * isnull(tx.mtotax, 0)) precioUtx1, P.PrecioIU1, P.Preciou2, (p.precioU2 + isnull(tx.mtofijo / iif(p.cantempaq = 0, 1, p.cantempaq), 0) + p.precioU2 * isnull(tx.mtotax, 0)) precioUtx2, P.PrecioIU2, P.Preciou3, 
                  (p.precioU3 + isnull(tx.mtofijo / iif(p.cantempaq = 0, 1, p.cantempaq), 0) + p.precioU3 * isnull(tx.mtotax, 0)) precioUtx3, P.PrecioIU3, P.EsReten, P.fechaUV, p.FechaUC, P.DiasTole, P.Refere, P.Marca, P.Unidad, P.ACTIVO, P.UndEmpaq, 
                  P.CantEmpaq, P.Peso, P.Factor, P.PriceEx, P.Volumen, P.UndVol, P.Existen, P.ExUnidad, ISNULL(E.CantCom, 0) CantCom, ISNULL(E.CantPed, 0) CantPed, ISNULL(E.UnidCom, 0) UnidCom, ISNULL(E.UnidPed, 0) UnidPed, P.Minimo, P.Maximo, 
                  P.DEsVence, P.EsPesa, P.Tara, P.EsImport, P.EsExento, P.EsOferta, P.EsEnser, P.EsEmpaque, P.ExDecimal, P.DEsComp, P.DEsSeri, P.DEsLote
FROM     [dbo].SAPROD P WITH (NOLOCK) INNER JOIN
                  [dbo].SAINSTA I ON P.CodInst = I.CodInst LEFT JOIN
                      (SELECT CODPROD, SUM(cantcom) cantcom, SUM(unidcom) unidcom, SUM(cantped) cantped, SUM(unidped) unidped
                       FROM      [dbo].VW_ADM_PRODEXIST
                       GROUP BY CODPROD) E ON (P.CodProd = E.CodProd) LEFT JOIN
                      (SELECT tp.codprod, sum(iif(tp.esporct = 1, tp.monto / 100, 0)) mtotax, sum(iif((tx.esfijo = 1) AND (tx.esporct = 0), tp.monto, 0)) mtofijo
                       FROM      [dbo].sataxprd tp INNER JOIN
                                         [dbo].sataxes tx ON (tx.codtaxs = tp.codtaxs)
                       GROUP BY tp.codprod) tx ON tx.codprod = p.codprod