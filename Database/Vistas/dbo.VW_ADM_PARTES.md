# dbo.VW_ADM_PARTES

Vista: dbo.VW_ADM_PARTES
Origen: dbo.VW_ADM_PARTES.sql

## Columnas

- CODPROD: Columna proveniente de `PA.CODPROD`.
- CODALTE: Columna proveniente de `PA.CODALTE`.
- CANTIDAD: Columna proveniente de `PA.CANTIDAD`.
- ESUNID: Columna proveniente de `PA.ESUNID`.
- ESSERV: Columna proveniente de `PA.ESSERV`.
- NROUNICO: Columna proveniente de `PA.NROUNICO`.
- ESFIJO: Columna proveniente de `PA.ESFIJO`.
- CODINST: Columna calculada a partir de la expresión `(CASE WHEN PA.ESSERV = 0 THEN PR.CODINST ELSE SR.CODINST END)`.
- DESCRIP: Columna calculada a partir de la expresión `(CASE WHEN PA.ESSERV = 0 THEN PR.DESCRIP ELSE SR.DESCRIP END)`.
- DESCRIP2: Columna calculada a partir de la expresión `(CASE WHEN PA.ESSERV = 0 THEN PR.DESCRIP2 ELSE SR.DESCRIP2 END)`.
- DESCRIP3: Columna calculada a partir de la expresión `(CASE WHEN PA.ESSERV = 0 THEN PR.DESCRIP3 ELSE SR.DESCRIP3 END)`.
- ESEMPAQUE: Columna calculada a partir de la expresión `(CASE WHEN PA.ESSERV = 0 THEN PR.ESEMPAQUE ELSE 0 END)`.
- CANTEMPAQ: Columna calculada a partir de la expresión `(CASE WHEN PA.ESSERV = 0 THEN PR.CANTEMPAQ ELSE 0 END)`.
- DESVENCE: Columna calculada a partir de la expresión `(CASE WHEN PA.ESSERV = 0 THEN PR.DESVENCE ELSE 0 END)`.
- COSTACT: Columna calculada a partir de la expresión `(CASE WHEN PA.ESSERV = 0 THEN PR.COSTACT ELSE SR.COSTO END)`.
- COSTPRO: Columna calculada a partir de la expresión `(CASE WHEN PA.ESSERV = 0 THEN PR.COSTPRO ELSE SR.COSTO END)`.
- COSTANT: Columna calculada a partir de la expresión `(CASE WHEN PA.ESSERV = 0 THEN PR.COSTANT ELSE SR.COSTO END)`.
- FACTOR: Columna calculada a partir de la expresión `(CASE WHEN PA.ESSERV = 0 THEN IIF(PR.FACTOR = 0, 1, PR.FACTOR) ELSE 1 END)`.
- ESPORCOST: Columna calculada a partir de la expresión `(CASE WHEN PA.ESSERV = 0 THEN 0 ELSE SR.ESPORCOST END)`.
- PRECIO1: Columna calculada a partir de la expresión `(CASE WHEN PA.ESSERV = 0 THEN PR.PRECIO1 ELSE SR.PRECIO1 END)`.
- PRECIO2: Columna calculada a partir de la expresión `(CASE WHEN PA.ESSERV = 0 THEN PR.PRECIO2 ELSE SR.PRECIO2 END)`.
- PRECIO3: Columna calculada a partir de la expresión `(CASE WHEN PA.ESSERV = 0 THEN PR.PRECIO3 ELSE SR.PRECIO3 END)`.
- PRECIOU1: Columna calculada a partir de la expresión `(CASE WHEN PA.ESSERV = 0 THEN PR.PRECIOU ELSE 0 END)`.
- PRECIOU2: Columna calculada a partir de la expresión `(CASE WHEN PA.ESSERV = 0 THEN PR.PrecioU2 ELSE 0 END)`.
- PRECIOU3: Columna calculada a partir de la expresión `(CASE WHEN PA.ESSERV = 0 THEN PR.PrecioU3 ELSE 0 END)`.
- DESSERI: Columna calculada a partir de la expresión `(CASE WHEN PA.ESSERV = 0 THEN PR.DEsSeri ELSE 0 END)`.
- REFERE: Columna calculada a partir de la expresión `(CASE WHEN PA.ESSERV = 0 THEN PR.REFERE ELSE SR.CLASE END)`.
- DESLOTE: Columna calculada a partir de la expresión `(CASE WHEN PA.ESSERV = 0 THEN PR.DESLOTE ELSE 0 END)`.
- ESPESA: Columna calculada a partir de la expresión `(CASE WHEN PA.ESSERV = 0 THEN PR.ESPESA ELSE 0 END)`.
- TARA: Columna calculada a partir de la expresión `(CASE WHEN PA.ESSERV = 0 THEN PR.TARA ELSE 0 END)`.
- USASERV: Columna calculada a partir de la expresión `(CASE WHEN PA.ESSERV = 0 THEN 0 ELSE SR.USASERV END)`.
- UNIDAD: Columna calculada a partir de la expresión `(CASE WHEN PA.ESSERV = 0 THEN PR.UNIDAD ELSE SR.UNIDAD END)`.
- UNDEMPAQ: Columna calculada a partir de la expresión `(CASE WHEN PA.ESSERV = 0 THEN PR.UNDEMPAQ ELSE NULL END)`.
- EXDECIMAL: Columna calculada a partir de la expresión `(CASE WHEN PA.ESSERV = 0 THEN PR.EXDECIMAL ELSE 0 END)`.
