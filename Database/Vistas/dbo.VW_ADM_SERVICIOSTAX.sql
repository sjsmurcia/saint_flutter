SELECT I.CodInst, I.Descto, I.DEsComi, I.DEsCorrel, I.DigitosC, S.codserv, S.Descrip, S.Descrip2, S.Descrip3, S.Descrip + COALESCE (' ' + S.Descrip2, '') + COALESCE (' ' + S.Descrip3, '') AS DescripAll, (CASE SUBSTRING(S.DESCRIP, 1, 1) 
                  WHEN '?' THEN 1 ELSE 0 END) AS ESFREEP, S.Precio1, (S.precio1 + isnull(tx.mtofijo, 0) + S.precio1 * isnull(tx.mtotax, 0)) preciotx1, S.PrecioI1, S.Precio2, (S.precio2 + isnull(tx.mtofijo, 0) + S.precio2 * isnull(tx.mtotax, 0)) preciotx2, S.PrecioI2, 
                  S.Precio3, (S.precio3 + isnull(tx.mtofijo, 0) + S.precio3 * isnull(tx.mtotax, 0)) preciotx3, S.PrecioI3, S.EsReten, S.Unidad, S.PriceEx, S.Activo, S.EsImport, S.EsExento, s.EsVenta, s.EsCompra, S.Clase, S.Costo, S.EsPorCost, S.usaServ, 
                  S.comision, S.esporcomi
FROM     [dbo].SASERV S WITH (NOLOCK) INNER JOIN
                  [dbo].SAINSTA I ON S.CodInst = I.CodInst LEFT JOIN
                      (SELECT ts .codserv, sum(iif(ts .esporct = 1, ts .monto / 100, 0)) mtotax, sum(iif((tx.esfijo = 1) AND (tx.esporct = 0), ts .monto, 0)) mtofijo
                       FROM      [dbo].sataxsrv ts INNER JOIN
                                         sataxes tx ON (tx.codtaxs = ts .codtaxs)
                       GROUP BY ts .codserv) tx ON tx.codserv = S.codserv