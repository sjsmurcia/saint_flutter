SELECT l.codsucu, l.nrounico, l.codprod, l.codubic, u.descrip, l.nrolote, l.puestoi, l.cantidad, l.cantidadu, l.costo, l.fechae, l.fechav, p.diastole, l.precio1, (l.precio1 + isnull(tx.mtofijo, 0) + l.precio1 * isnull(tx.mtotax, 0)) preciotx1, l.precioi1, l.precio2, 
                  (l.precio1 + isnull(tx.mtofijo, 0) + l.precio1 * isnull(tx.mtotax, 0)) preciotx2, l.precioi2, l.precio3, (l.precio1 + isnull(tx.mtofijo, 0) + l.precio1 * isnull(tx.mtotax, 0)) preciotx3, l.precioi3, l.preciou1, (l.preciou1 + isnull(tx.mtofijo / iif(p.cantempaq = 0, 1, 
                  p.cantempaq), 0) + l.preciou1 * isnull(tx.mtotax, 0)) precioutx1, l.precioui1, l.preciou2, (l.preciou2 + isnull(tx.mtofijo / iif(p.cantempaq = 0, 1, p.cantempaq), 0) + l.preciou2 * isnull(tx.mtotax, 0)) precioutx2, l.precioui2, l.preciou3, 
                  (l.preciou3 + isnull(tx.mtofijo / iif(p.cantempaq = 0, 1, p.cantempaq), 0) + l.preciou3 * isnull(tx.mtotax, 0)) precioutx3, l.precioui3
FROM     [dbo].salote l WITH (nolock) INNER JOIN
                  [dbo].saprod p ON (l.codprod = p.codprod) INNER JOIN
                      (SELECT codubic, descrip
                       FROM      [dbo].sadepo) u ON (l.codubic = u.codubic) LEFT JOIN
                      (SELECT tp.codprod, sum(iif(tp.esporct = 1, tp.monto / 100, 0)) mtotax, sum(iif((tx.esfijo = 1) AND (tx.esporct = 0), tp.monto, 0)) mtofijo
                       FROM      [dbo].sataxprd tp INNER JOIN
                                         [dbo].sataxes tx ON (tx.codtaxs = tp.codtaxs)
                       GROUP BY tp.codprod) tx ON tx.codprod = p.codprod