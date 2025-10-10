# Semana 1 - Bitacora de trabajo

## Contexto general
- Se definio la base del monorepo con app Flutter y servicio .NET para reporteria.
- Se agregaron dependencias clave para arquitectura limpia, Riverpod, i18n, navegacion y manejo offline.

## App Flutter
- Reestructura de `lib/` siguiendo capas (`app`, `di`, `application`, `domain`, `infrastructure`, `presentation`).
- Configuracion de temas Material 3, `GoRouter`, localizacion (`l10n` con es/en) y `ProviderScope` global.
- Implementacion de autenticacion mock:
  - `AuthRepositoryImpl` + `MockAuthApi` y almacenamiento seguro con `FlutterSecureStorage`.
  - `AuthController` con estados via `freezed` y login en `LoginPage` (credenciales demo).
- Bases de datos locales con Drift (`AppDatabase`, tablas `Products`, `Clients`, `SyncStates`, `OutboxEntries`).
- Repositorios de catalogos (`ProductRepositoryImpl`, `ClientRepositoryImpl`) con caches locales y sync desde `MockCatalogApi`.
- UI inicial:
  - `HomePage` con accesos a catalogos.
  - Listados de productos y clientes (`RefreshIndicator`, sincronizacion manual, lectura offline).
- Pruebas y tooling:
  - `flutter analyze` sin errores.
  - `flutter test` cubriendo render basico del login.

## Servicio Reporting (.NET 9)
- Proyecto generado en `services/reporting/ReportingService`.
- Endpoints stubs:
  - `GET /health` (respuesta 200 con timestamp).
  - `POST /reports/invoice` devuelve ticket aceptado con estado `queued`.
- Build validado con `dotnet build`.

## Notas y pendientes
- Integrar autenticacion real (JWT) y DevExpress en fases posteriores.
- Definir sync real con backend y resolver conflicto multi-tenant.
- Documentar configuracion de entornos (.env) cuando se agreguen variables reales.
