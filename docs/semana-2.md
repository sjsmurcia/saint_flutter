# Semana 2 - Bitacora de trabajo

## Objetivos cubiertos
- Ventas/Compras offline con colas de sincronizacion:
  - Nuevas entidades locales Drift (`SalesDocuments`, `PurchaseDocuments`, `OutboxEntries`) y repositorios asociados.
  - Servicios `SalesService` y `PurchaseService` permiten registrar documentos en modo borrador, guardando la seleccion de empresa/sucursal y encolando payloads en outbox.
  - Paginas de UI (`SalesPage`, `PurchasesPage`, `OutboxPage`) para consultar, crear y monitorear pendientes.
- Selector de empresa y sucursal:
  - Implementacion de `CompanySelectionController` con persistencia segura por tenant y mock de companias/sucursales en `MockCatalogApi`.
  - Bottom sheet reutilizable (`company_selector_sheet.dart`) accesible desde Home y modulos, sincroniza inmediatamente tras el cambio.
- Sincronizacion push/pull por tenant + Workmanager:
  - `SyncCoordinator` centraliza pulls (catalogos) y procesa outbox marcando documentos como `sent`.
  - Registro de tarea periodica (`Workmanager`) y callback (`background_sync.dart`) usan un `ProviderContainer` para ejecutar sync en segundo plano.

## Cambios relevantes

- Actualizacion de `AppDatabase` (migracion v2) y nuevos DAO/Repos.
- `HomePage` extendido con accesos a ventas, compras y outbox, mostrando contexto de empresa seleccionado.
- Integracion de Workmanager en `main.dart` y definicion de tarea `saint_background_sync`.
- Internacionalizacion ampliada (strings nuevos en `app_en.arb` y `app_es.arb`).
- Pruebas y tooling: `flutter analyze`, `flutter test`, `flutter pub run build_runner build`, `flutter gen-l10n` ejecutados sin errores.

## Consideraciones y pendientes
- Los servicios mock procesan outbox marcando documentos como `sent`; integrar API real requerira reemplazar `SyncCoordinator._processOutbox`.
- Workmanager usa frecuencia de 30 minutos con retardo inicial de 5 minutos; ajustar segun politicas finales.
- Falta manejo de totales con desglose de items/impuestos y validaciones avanzadas de documentos (planes para semanas posteriores).
