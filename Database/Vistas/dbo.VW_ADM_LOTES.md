# dbo.VW_ADM_LOTES

Vista: dbo.VW_ADM_LOTES
Origen: dbo.VW_ADM_LOTES.sql

## Columnas

- codsucu: Columna proveniente de `l.codsucu`.
- nrounico: Columna proveniente de `l.nrounico`.
- codprod: Columna proveniente de `l.codprod`.
- codubic: Columna proveniente de `l.codubic`.
- descrip: Columna proveniente de `u.descrip`.
- nrolote: Columna proveniente de `l.nrolote`.
- puestoi: Columna proveniente de `l.puestoi`.
- cantidad: Columna proveniente de `l.cantidad`.
- cantidadu: Columna proveniente de `l.cantidadu`.
- costo: Columna proveniente de `l.costo`.
- fechae: Columna proveniente de `l.fechae`.
- fechav: Columna proveniente de `l.fechav`.
- diastole: Columna proveniente de `p.diastole`.
- precio1: Columna proveniente de `l.precio1`.
- preciotx1: Columna calculada a partir de la expresión `(l.precio1 + isnull(tx.mtofijo, 0) + l.precio1 * isnull(tx.mtotax, 0))`.
- precioi1: Columna proveniente de `l.precioi1`.
- precio2: Columna proveniente de `l.precio2`.
- preciotx2: Columna calculada a partir de la expresión `(l.precio1 + isnull(tx.mtofijo, 0) + l.precio1 * isnull(tx.mtotax, 0))`.
- precioi2: Columna proveniente de `l.precioi2`.
- precio3: Columna proveniente de `l.precio3`.
- preciotx3: Columna calculada a partir de la expresión `(l.precio1 + isnull(tx.mtofijo, 0) + l.precio1 * isnull(tx.mtotax, 0))`.
- precioi3: Columna proveniente de `l.precioi3`.
- preciou1: Columna proveniente de `l.preciou1`.
- precioutx1: Columna calculada a partir de la expresión `(l.preciou1 + isnull(tx.mtofijo / iif(p.cantempaq = 0, 1, p.cantempaq), 0) + l.preciou1 * isnull(tx.mtotax, 0))`.
- precioui1: Columna proveniente de `l.precioui1`.
- preciou2: Columna proveniente de `l.preciou2`.
- precioutx2: Columna calculada a partir de la expresión `(l.preciou2 + isnull(tx.mtofijo / iif(p.cantempaq = 0, 1, p.cantempaq), 0) + l.preciou2 * isnull(tx.mtotax, 0))`.
- precioui2: Columna proveniente de `l.precioui2`.
- preciou3: Columna proveniente de `l.preciou3`.
- precioutx3: Columna calculada a partir de la expresión `(l.preciou3 + isnull(tx.mtofijo / iif(p.cantempaq = 0, 1, p.cantempaq), 0) + l.preciou3 * isnull(tx.mtotax, 0))`.
- precioui3: Columna proveniente de `l.precioui3`.
