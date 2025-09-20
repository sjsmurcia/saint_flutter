SELECT SE.CodServ, SE.CodTaxs, SD.CodFacE, SD.Descrip, SD.EsPorct, SE.Monto, SD.EsLibroI, SD.EsFijo, SD.EsTaxVenta, SD.EsTaxCompra, SD.EsReten, SD.CodOper, SD.Sustraendo
FROM     dbo.SATAXSRV AS SE INNER JOIN
                  dbo.SATAXES AS SD WITH (NOLOCK) ON SE.CodTaxs = SD.CodTaxs