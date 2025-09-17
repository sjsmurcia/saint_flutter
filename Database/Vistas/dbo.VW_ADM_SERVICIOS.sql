SELECT I.CodInst, I.DEsCorrel, I.DigitosC, I.Descto, I.DEsComi, S.CodServ, S.Descrip, S.Descrip2, S.Descrip3, S.Descrip + COALESCE (' ' + S.Descrip2, '') + COALESCE (' ' + S.Descrip3, '') AS DescripAll, (CASE SUBSTRING(S.DESCRIP, 1, 1) 
                  WHEN '?' THEN 1 ELSE 0 END) AS ESFREEP, S.Precio1, S.PrecioI1, S.Precio2, S.PrecioI2, S.Precio3, S.PrecioI3, S.EsReten, S.Unidad, S.PriceEx, S.Activo, S.EsImport, S.EsExento, S.EsVenta, S.EsCompra, S.Clase, S.Costo, S.EsPorCost, 
                  S.UsaServ, S.Comision, S.EsPorComi
FROM     dbo.SASERV AS S WITH (NOLOCK) INNER JOIN
                  dbo.SAINSTA AS I ON S.CodInst = I.CodInst