# Esquema de Base de Datos (Saint)

Este documento resume el propósito de cada tabla definida en `Database/Tablas/` y agrupa por área funcional para facilitar su consulta.

## Convenciones y prefijos
- `SA*`: Núcleo comercial (clientes, ventas, compras, inventario, impuestos, catálogos).
- `SB*`: Bancos y tesorería.
- `SS*`: Seguridad, usuarios y parámetros del sistema.
- Sufijos usuales: `CXC` (cuentas por cobrar), `CXP` (cuentas por pagar), `FACT` (facturas), `ITEM*` (renglones/detalle), `PROD` (productos), `PROV` (proveedores), `VEND` (vendedores), `EXIS` (existencias), `TAX*` (impuestos), `PAG*` (pagos), `REPO/REPT` (reportes), `CONF/SETTINGS` (configuración).

## Ventas y facturación
- `SAFACT`: Cabecera de documentos de venta/facturas.
- `SAITEMFAC`: Renglones/detalle de facturas de venta.
- `SAVEND`: Maestra de vendedores y parámetros de comisiones.
- `SAIVEN`: Recursos/elementos asociados a vendedores (p. ej., imágenes o contenidos por vendedor).
- `SACVEN`: Catálogo/maestra de condiciones de venta o convenios por cliente.
- `SACONV`: Convenios/condiciones comerciales (descuentos, listas, etc.).
- `SAOFER`: Ofertas y promociones.
- `SACLIOFE`: Ofertas y condiciones específicas por cliente.
- `SAPVPR`: Precios de venta parametrizados (p. ej., por producto, rango o perfil).
- `SAPRIM`: Esquemas de precios/primeras referencias de precios.
- `SAPRIMCOM`: Reglas/relación entre precios y compras.
- `SARGOTJT`: Tarifas/cargos por tarjeta en ventas.
- `SACORTEZ`: Cierres de caja/turno de ventas.
- `SATRAN`: Transacciones comerciales resumidas (movimientos globales).
- `SAJOIN`: Tabla de unión/relación auxiliar para procesos de ventas.
- `SAREPO`: Parámetros o datos intermedios para reportes de ventas.

## Compras y proveedores
- `SACOMP`: Cabecera de documentos de compra.
- `SAITEMCOM`: Renglones/detalle de compras.
- `SAPROV`: Maestra de proveedores.
- `SAPRNGIROS`: Rangos/giros/comprobantes asociados a compras.
- `SASEPRCOM`: Series o secuencias de numeración para compras.

## Inventario y productos
- `SAPROD`: Maestra de productos (ítems, precios, costos, banderas).
- `SAEXIS`: Existencias por sucursal/ubicación (stocks y pendientes).
- `SALOTE`: Lotes de productos.
- `SASERI`: Series de productos.
- `SACODBAR`: Códigos de barras por producto.
- `SAIMEC`: Imágenes u otros medios de productos.
- `SAIPRD`: Parámetros/índices auxiliares de productos.
- `SAMECA`: Mecanismos/clasificaciones auxiliares de productos.
- `SACMEC`: Catálogo/relación de mecanismos o categorías técnicas.
- `SAITFL`: Flujos/tipos de movimientos de inventario.
- `SAITRE`: Registros de transferencias o movimientos internos.
- `SAITEO`: Tipos de entradas/salidas operativas.
- `SAITEMOPI`: Renglones de operaciones de inventario (operaciones internas).
- `SAPART`: Partes/recursos asociados a productos.
- `SAIPAVTA`: Parámetros de ítems para ventas.

## Cuentas por cobrar (CxC)
- `SAACXC`: Movimientos de cuentas por cobrar por cliente/documento.
- `SAPAGCXC`: Pagos y aplicaciones a cuentas por cobrar.
- `SATAXCXC`: Impuestos asociados a documentos/operaciones de CxC.

## Cuentas por pagar (CxP)
- `SAACXP`: Movimientos de cuentas por pagar por proveedor/documento.
- `SAPAGCXP`: Pagos y aplicaciones a cuentas por pagar.
- `SATAXCXP`: Impuestos asociados a documentos/operaciones de CxP.

## Impuestos y fiscalidad
- `SATAXES`: Catálogo de impuestos/tasas.
- `SATAXVTA`: Impuestos aplicables a ventas.
- `SATAXCOM`: Impuestos aplicables a compras.
- `SATAXPRD`: Impuestos configurados por producto.
- `SATAXSRV`: Impuestos configurados por servicio.
- `SATAXITC`: Impuestos a nivel renglón en compras.
- `SATAXITF`: Impuestos a nivel renglón en ventas.
- `SAPRSRI`: Parámetros fiscales (SRI/entidad tributaria local).
- `SARGORET`: Retenciones aplicables.
- `SARGOCAT`: Catálogo de cargos/recargos.

## Bancos y tesorería (SB*)
- `SBBANC`: Cuentas bancarias.
- `SBCTAS`: Catálogo/plan de cuentas bancarias y contables.
- `SBCTAP`: Cuentas por pagar bancarias/terceros asociados.
- `SBTRAN`: Transacciones bancarias.
- `SBTRTR`: Transferencias entre cuentas.
- `SBDTRN`: Detalle de transacciones bancarias.
- `SBCONC`: Conciliaciones bancarias.
- `SBOPCTAS`: Operaciones sobre cuentas (configuración de movimientos).
- `SBOPMSTR`: Cabecera de operaciones bancarias parametrizadas.
- `SBOPFR`: Formularios/formatos de operación.
- `SBOPPGOS`: Pagos bancarios parametrizados.
- `SBOPDCTS`: Descuentos/deducciones de operaciones.
- `SBOPDPAG`: Detalle de pagos/egresos.
- `SBBENE`: Beneficiarios.
- `SBMONE`: Monedas y tipos de cambio.
- `SBRPTD`: Datos/parametría de reportes de bancos.
- `SBCOBA`: Configuraciones bancarias adicionales.
- `SBCONF`: Configuración general de módulo de bancos.
- `SBAPPD` / `SBAPPM`: Datos de aplicaciones/plantillas de procesos bancarios.
- `SBDEFPD` / `SBDEFPM`: Definiciones por defecto para documentos/pagos bancarios.
- `SBDOPF`: Operaciones por formato (relación formatos y operaciones).
- `SBFDCCONS` / `SBFDCDET` / `SBFDCPER` / `SBFDCREP`: Tablas de conciliación/flujo de caja (consolidados, detalle, periodos, reportes).
- `SBPRXC`: Proyecciones/anticipos asociados a CxC en bancos.

## Clientes y territorios
- `SACLIE`: Maestra de clientes.
- `SAICLI`: Índices/parametría auxiliar de clientes.
- `SAPTOSCLIENTE`: Puntos o programa de fidelidad de clientes.
- `SAZONA`: Zonas comerciales.
- `SAPAIS` / `SAESTADO` / `SACIUDAD` / `SAMUNICIPIO`: Catálogos de localización geográfica.

## Proveedores y compras auxiliares
- `SAIPRV`: Índices/parametría auxiliar de proveedores.
- `SAIPACOM`: Parámetros de integración/aplicación para compras.
- `SAIPACXP`: Parámetros de integración/aplicación para CxP.
- `SAIPACXC`: Parámetros de integración/aplicación para CxC.
- `SAIPAPRV`: Parámetros de integración/aplicación para proveedores.

## Configuración y catálogos generales
- `SACONF`: Configuración general del sistema/módulos.
- `SASETTINGS`: Ajustes globales de la aplicación.
- `SATABL`: Tablas genéricas de apoyo (catálogos varios).
- `SAESTA`: Estados/estatus de procesos y documentos.
- `SASEPRFAC`: Series o secuencias de numeración para facturas.
- `SASEPROPI`: Series/secuencias de numeración para operaciones internas.
- `SATARJ`: Tarjetas (crédito/débito) y condiciones.
- `SAOPER`: Catálogo de operaciones comerciales.
- `SAAOPER`: Operaciones auxiliares/ajustes.
- `SAOPEI`: Operaciones internas/inventario.
- `SAINITI`: Registros de inicialización (saldos, inventario inicial).
- `SAINSTA`: Estados posteriores a inicializaciones/cierres.
- `SAICLI` / `SAIMEC`: Índices/medios auxiliares de clientes/productos.

## Seguridad, usuarios y permisos (SS*)
- `SSUSRS`: Usuarios del sistema.
- `SSNIVL`: Niveles/roles de acceso.
- `SSOPMN`: Menús/opciones del sistema.
- `SSPARM` / `SSPARD`: Parámetros del sistema (maestro y detalle).
- `SSFMTS` / `SSFLDS`: Definición de formatos y campos del sistema.
- `SSAUTR`: Reglas de autorización/roles por operación.
- `SSDTAA`: Auditoría o bitácora técnica asociada a seguridad.

## Auditoría y trazabilidad
- `SAAUDTRAN`: Auditoría de transacciones.
- `SAAUDITEM`: Auditoría de renglones/detalle de transacciones.
- `SAAUTORIZ`: Autorizaciones de documentos/operaciones (aprobaciones).
- `SAANULAC`: Anulaciones y su trazabilidad.
- `SAFLDREF`: Referencias de campos (tracking de referencias cruzadas).
- `SAUSRREP`: Preferencias o permisos de usuarios para reportes.

## Temporal/auxiliar
- `SATMPCHQ`: Cheques temporales o staging de impresión.
- `SAITCV`: Tabla intermedia de cálculo/validación de ítems.
- `SAITPLANI` / `SAPLANI`: Planificación de ítems/procesos (cabecera y detalle).
- `SAFALO`: Log o bitácora auxiliar (fallos/alertas).
- `STIB01` / `STIB02`: Tablas técnicas/interop (staging o integración).
- `SADEPO`: Depósitos (auxiliar o staging).
- `SAEQUI`: Equivalencias/mapeos de códigos.
- `SACORRELSIS`: Correlativos/relaciones del sistema.

---

Notas
- Las descripciones se basan en nombres de tablas y campos presentes en los scripts. Si necesitas mayor detalle por tabla (campos clave, relaciones y ejemplos), indícame cuáles priorizar y lo añado.
- Algunas tablas con nombres menos obvios se han clasificado por contexto; puedo ajustarlas según tu uso real.

## Campos por tabla
- Consulta la documentación de campos (columnas) generada automáticamente por tabla en: `Database/Campos/README.md`
