# dbo.VW_ADM_MOVPROD

Vista: dbo.VW_ADM_MOVPROD
Origen: dbo.VW_ADM_MOVPROD.sql

## Columnas

- CodProd: Columna proveniente de `P.CodProd`.
- DESCRIP: Columna proveniente de `P.DESCRIP`.
- CODINST: Columna proveniente de `P.CODINST`.
- ESENSER: Columna proveniente de `P.ESENSER`.
- ESIMPORT: Columna proveniente de `P.ESIMPORT`.
- ESEMPAQUE: Columna proveniente de `P.ESEMPAQUE`.
- EXISTEN: Columna proveniente de `P.EXISTEN`.
- EXUNIDAD: Columna proveniente de `P.EXUNIDAD`.
- MARCA: Columna proveniente de `P.MARCA`.
- Tipo: Columna renombrada a partir de `SI.TipoFac`.
- NumeroD: Columna proveniente de `SI.NumeroD`.
- FechaE: Columna proveniente de `SI.FechaE`.
- Codigo: Columna renombrada a partir de `S.CodClie`.
- CodUbic1: Columna renombrada a partir de `SI.CodUbic`.
- CodUbic2: Columna renombrada a partir de `NULL`.
- DESCRIPT: Columna renombrada a partir de `S.Descrip`.
- EsUnid: Columna proveniente de `SI.EsUnid`.
- NroLinea: Columna proveniente de `SI.NroLinea`.
- Costo: Columna calculada a partir de la expresión `SUM(SI.Costo)`.
- Precio: Columna calculada a partir de la expresión `SUM(SI.Precio)`.
- Cantidad: Columna calculada a partir de la expresión `SUM(SI.Cantidad * SI.CantMayor)`.
- ExistAnt: Columna calculada a partir de la expresión `SUM(CASE si.esunid WHEN 1 THEN SI.existAntU ELSE SI.existAnt END)`.
- Entrada: Columna calculada a partir de la expresión `SUM((CASE WHEN SI.TipoFac IN ('B', 'D') THEN 1 ELSE 0 END) * SI.Cantidad * SI.CantMayor)`.
- Salida: Columna calculada a partir de la expresión `SUM((CASE WHEN SI.TipoFac IN ('A', 'C') THEN 1 ELSE 0 END) * SI.Cantidad * SI.CantMayor)`.
- Saldo: Columna calculada a partir de la expresión `SUM((CASE si.esunid WHEN 1 THEN SI.existAntU ELSE SI.existAnt END) - (CASE WHEN SI.TipoFac IN ('B', 'D') THEN - 1 ELSE 1 END) * SI.Cantidad * SI.CantMayor)`.
