SELECT it.CodSucu, it.TipoFac, it.NumeroD, it.coditem, it.signo, ISNULL(pr.codinst, sr.codinst) AS CodInst, it.Descrip1, it.Descrip2, it.Descrip3, it.Descrip4, it.Descrip5, it.Descrip6, it.Descrip7, it.Descrip8, it.Descrip9, it.Descrip10, it.nrolinea, it.nrolineac, 
                  it.EsServ, F.CodOper, F.CodClie, F.CodVend, F.CodUsua, F.CodEsta, it.CodMeca, F.Signo * it.priceO AS PriceO, F.Signo * It.MtoTax AS MtoTax, F.Signo * it.precio AS Precio, F.Signo * it.Cantidad * (IT.Precio - ISNULL((F.Descto1 + F.Descto2) 
                  * IT.Precio / NULLIF (F.Monto + F.Descto1 + F.Descto2, 0), 0)) AS TotPrecio, F.Signo * IT.Cantidad * ((IT.Precio - ISNULL((F.Descto1 + F.Descto2) * IT.Precio / NULLIF (F.Monto + F.Descto1 + F.Descto2, 0), 0)) - IT.Costo) AS Utilidad, it.EsUnid, 
                  it.DEsComp, it.EsExento, it.CantMayor, F.Signo * it.Cantidad AS Cantidad, it.CantidadA, it.codUbic, it.nroUnicoL, It.Descto, it.MtoTaxO, F.Signo * it.Costo AS Costo, F.Signo * It.Cantidad * it.Costo AS TotCosto, ISNULL(it.NroLote, '') 
                  AS NroLote, it.fechaL, it.Fechav AS FechaVL, F.FechaE AS FechaEF, F.Fechav AS FechaVF, (CASE SUBSTRING(ISNULL(PR.DESCRIP, sr.descrip), 1, 1) WHEN '?' THEN 1 ELSE 0 END) AS ESFREEP, ISNULL(IIF(it.esunid = 0, pr.Existen, 
                  pr.ExUnidad), 0) AS ExActual, ISNULL(pr.DEsLote, 0) AS DEsLote, ISNULL(pr.DEsSeri, 0) AS DEsSeri, ISNULL(Pr.DEsVence, 0) AS DEsVence, ISNULL(pr.EsPesa, 0) AS EsPesa, ISNULL(pr.tara, 0) AS Tara, ISNULL(IIF(pr.factor = 0, 1, pr.factor), 
                  1) AS FACTOR, ISNULL(pr.Unidad, sr.Unidad) AS Unidad, ISNULL(pr.undempaq, '') AS UndEmpaq, ISNULL(pr.cantempaq, 0) AS CantEmpaq, ISNULL(pr.exdecimal, 0) AS ExDecimal, ISNULL(pr.refere, sr.clase) AS Refere, ISNULL(pr.precio1, 
                  sr.precio1) AS Precio1, ISNULL(pr.precio2, sr.precio2) AS Precio2, ISNULL(pr.precio3, sr.precio3) AS Precio3, ISNULL(Pr.precioU, 0) AS PrecioU, ISNULL(PR.Preciou2, 0) AS PrecioU2, ISNULL(PR.Preciou3, 0) AS PrecioU3, ISNULL(PR.Peso, 0) 
                  AS Peso, ISNULL(PR.Volumen, 0) AS Volumen, ISNULL(PR.UndVol, '') AS UndVol, ISNULL(pr.costpro, sr.costo) AS CostPro, ISNULL(pr.costAct, sr.costo) AS CostAct, ISNULL(pr.esImport, sr.EsImport) AS EsImport, ISNULL(0, sr.UsaServ) 
                  AS UsaServ
FROM     [dbo].saitemfac it WITH (NOLOCK) INNER JOIN
                  [dbo].SAFACT F ON (it.codSucu = f.codsucu) AND (F.TIPOFAC = IT.TIPOFAC) AND (F.NUMEROD = IT.NUMEROD) LEFT JOIN
                  [dbo].SATAXITF TX ON (it.codSucu = TX.codsucu) AND (IT.TIPOFAC = TX.TIPOFAC) AND (IT.NUMEROD = TX.NUMEROD) AND (IT.NROLINEA = TX.NROLINEA) LEFT JOIN
                  [dbo].SAPROD PR ON it.coditem = pr.codprod LEFT JOIN
                  [dbo].SASERV SR ON it.coditem = sr.codserv
WHERE  (IT.TipoFac IN ('A', 'B'))