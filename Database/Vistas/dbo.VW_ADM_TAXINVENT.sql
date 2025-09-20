SELECT SE.CodProd, SE.CodTaxs, SD.Descrip, SD.EsPorct, SE.Monto, SD.EsLibroI, SD.CodFacE, SD.EsFijo, SD.EsTaxVenta, SD.EsTaxCompra, SD.EsReten, SD.CodOper, SD.Sustraendo
FROM     dbo.SATAXPRD AS SE INNER JOIN
                  dbo.SATAXES AS SD WITH (NOLOCK) ON SE.CodTaxs = SD.CodTaxs