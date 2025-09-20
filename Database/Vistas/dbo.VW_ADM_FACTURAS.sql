SELECT CodSucu, TipoFac, NumeroD, CodEsta, CodUsua, NumeroC, NumeroR, NumeroF, NumeroP, CodVend, Signo, CodClie, Descrip, ID3, Direc1, Direc2, Direc3, NroTurno, ZipCode, Telef, FechaT, FechaE, FechaV, FechaI, 
                  Signo * TotalPrd AS TotalPrd, Signo * TotalSrv AS TotalSrv, Signo * (TGravable + TGravable0) AS TGravable, Signo * TExento AS TExento, Signo * Monto AS Monto, Signo * (Descto1 + Descto2) AS Monto_Descto, 
                  Signo * MtoTax AS MtoTax, Signo * Fletes AS Fletes, Signo * Monto AS Monto_Neto, Signo * (Monto + MtoTax + Fletes) AS Monto_Bruto, Signo * MtoTotal AS MontoTotal, Signo * MtoExtra AS MtoExtra, Signo * MtoFinanc AS MtoFinanc, 
                  Signo * Credito AS Credito, Signo * Contado AS Contado, Signo * CancelI AS CancelI, Signo * CancelA AS CancelA, Signo * CancelE AS CancelE, Signo * CancelC AS CancelC, Signo * CancelT AS CancelT, Signo * CancelG AS CancelG, 
                  Signo * Descto1 AS Descto1, Signo * Descto2 AS Descto2, Signo * CostoPrd AS CostoPrd, Signo * CostoSrv AS CostoSrv, Signo * (CostoPrd + CostoSrv) AS Monto_Costo, Signo * DesctoP AS DesctoP, Signo * RetenIVA AS RetenIVA, 
                  Signo * Cambio AS Cambio, Signo * (Monto - (CostoPrd + CostoSrv)) AS Monto_Utili, Signo * COALESCE ((Monto - (CostoPrd + CostoSrv)) / NULLIF (Monto, 0) * 100, 0) AS Monto_PorUtil, 
                  Signo * COALESCE ((Monto - (MtoComiVta + MtoComiVtaD)) / NULLIF (Monto, 0) * 100, 0) AS Monto_PorComi, Signo * COALESCE ((Contado - (MtoComiCob + MtoComiCobD)) / NULLIF (Contado * 100, 0), 0) AS Monto_PorComiCob, 
                  Signo * MtoComiVta AS MtoComiVta, Signo * MtoComiCob AS MtoComiCob, Signo * MtoComiVtaD AS MtoComiVtaD, Signo * MtoComiCobD AS MtoComiCobD, Signo * (MtoComiVta + MtoComiVtaD) AS TotMtoComiVta, 
                  Signo * (MtoComiCob + MtoComiCobD) AS TotMtoComiCob, CodUbic, OrdenC, CodOper, DetalChq, NGiros, NMeses, NroCtrol, Notas1, Notas2, Notas3, Notas4, Notas5, Notas6, Notas7, Notas8, Notas9, Notas10, Signo * MtoInt1 AS MtoInt1, 
                  Signo * MtoInt2 AS MtoInt2
FROM     dbo.SAFACT AS FA WITH (NOLOCK)
WHERE  (TipoFac IN ('A', 'B'))