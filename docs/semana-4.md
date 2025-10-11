# Semana 4 - Bitacora de trabajo

## Objetivos cubiertos
- Licenciamiento completo en app y backend:
  - Endpoint de activacion/check-in firmado (RSA) y validacion de entitlements en servicios.
  - Control de periodo de gracia, renovacion y almacenamiento seguro (secure storage) con verificacion offline.
  - UI dedicada para activar, validar y mostrar estado de la licencia con manejo de errores.
- Seguridad basada en roles/permisos:
  - Backend valida permisos de usuario y licencia antes de generar reportes.
  - Token de usuario incluye role/permisos; UI muestra modulos segun licencia + permisos.
  - GoRouter con guardias que bloquean rutas restringidas y Home con tarjetas condicionadas.
- Optimización operativa:
  - Tablas locales con indices nuevos (tenant, fechas, estatus) para acelerar consultas y sincronizaciones.
  - Listados de productos y clientes paginados (20 items) con carga incremental y refresco manual.
  - Reutilizacion de controladores Riverpod para paginacion y triggers de sync.

## Cambios relevantes
- Nuevo backend `Program.cs` con endpoints `/auth/login`, licencias y validacion combinada de token + entitlements.
- Repository y servicios de autenticacion migrados a `AuthApi` (Dio) y `UserSession` ampliado con role/permisos.
- Controladores Riverpod (`productListController`, `clientListController`) y `PagedState` para paginación en catálogos.
- Actualizacion de `ProductsPage`/`ClientsPage` con listas paginadas, loader incremental y refresh + sync remoto.
- DB local (`app_database.dart`) con `@TableIndex`, migracion v4 y `customStatement` para crear indices en upgrade.

## Consideraciones y pendientes
- Integrar API real de catalogos/clientes para paginacion desde backend cuando esté disponible.
- Revisar tamaño de pagina en catálogos segun feedback de UX y volumen real de datos.
- Monitorear tiempos de build_runner tras crecimiento de modelos `freezed`; evaluar dividir generacion si se vuelve lento.
- Ajustar migracion para limpiar indices obsoletos al mover a backend productivo (si cambian nombres/tablas).
