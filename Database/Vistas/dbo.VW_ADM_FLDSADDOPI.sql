SELECT A.name AS TblName, C.CodTbl, C.TipoCpo, O.NroOper, C.NumGrp, G.AliasGrp, C.NombCpo, C.AliasCpo, C.Value, C.Longitud, C.Requerido, B.colorder
FROM     dbo.SAAGRUPOS AS G WITH (NOLOCK) INNER JOIN
                  dbo.SAACAMPOS AS C ON C.CodTbl = G.CodTbl AND G.NumGrp = C.NumGrp INNER JOIN
                  sys.sysobjects AS A ON A.name LIKE G.CodTbl + '%' AND LEN(G.CodTbl) <> LEN(A.name) AND A.xtype = 'U' INNER JOIN
                  sys.syscolumns AS B ON A.id = B.id AND B.name = C.NombCpo LEFT OUTER JOIN
                  dbo.SAAOPER AS O ON O.CodTbl = C.CodTbl AND O.NumGrp = C.NumGrp
WHERE  (C.CodTbl LIKE 'SAITEPRDOPI%') OR
                  (C.CodTbl LIKE 'SAITESERVOPI%') OR
                  (C.CodTbl LIKE 'SAOPEI%')