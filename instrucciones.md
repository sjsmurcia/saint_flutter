# Guía completa por fases y estructura inicial

Esta guía define **cómo arrancar el proyecto** (app Flutter Android tablet-first, móvil-friendly) con **multi-empresa/sucursal**, **offline-first**, **seguridad por roles**, **licenciamiento**, **reportería DevExpress (en backend)** y **compartición**. Incluye:

* Fase 0: Preparación y entorno de desarrollo
* Fase 1: Bootstrap del proyecto (Flutter + backend de reportes)
* Fase 2: Modelo de datos local y sincronización offline (multi-tenant)
* Fase 3: Funcionalidades núcleo (Ventas/Compras/Bancos/Admin)
* Fase 4: Reportes con DevExpress + compartir/exportar
* Fase 5: Seguridad, roles y licenciamiento
* Fase 6: Calidad, rendimiento y hardening
* Fase 7: Publicación, soporte y operación
* Anexos: Árbol de carpetas, paquetes, snippets, checklists

> **Objetivo temporal:** MVP en 3–4 semanas. Mantener foco en alcance mínimo viable.

---

## Fase 0 — Preparación y entorno de desarrollo

### 0.1. Requisitos

* **SO:** Windows 10/11 (recomendado para DevExpress + .NET) y/o macOS si también compilarás iOS.
* **Flutter SDK:** 3.22+ (Dart 3.x).
* **Android Studio** (o VS Code) + **Android SDK** + **Emulador**.
* **.NET 8 SDK** (para microservicio de reportes) + **DevExpress Reporting** (XtraReports) instalado/licenciado en entorno de backend.
* **Git** + **Git LFS** (si planeas guardar PDFs de ejemplo).
* **Java JDK 17** (compat Android Gradle Plugin).
* **Node 18+** (opcional: scripts utilitarios, mock server o tools).doc

### 0.2. Instalaciones (resumen comandos)

```bash
# Flutter
choco install flutter -y          # Windows con Chocolatey (o descarga manual)
flutter doctor

# Android
# Instala Android Studio, SDKs (API 34), habilita emulador; asegúrate de ANDROID_HOME.

# .NET + DevExpress
winget install Microsoft.DotNet.SDK.8
# Instala DevExpress Reporting (GUI); agrega feed de NuGet de DevExpress al backend.

# Git hooks y herramientas
npm i -g @commitlint/cli @commitlint/config-conventional
```

### 0.3. Config global del repo

* **Monorepo opcional:** `apps/mobile` (Flutter) y `services/reporting` (.NET + DevExpress).
* **Convenciones de commit:** Conventional Commits (`feat:`, `fix:`, `chore:`…).
* **Branching:** `main` (estable), `develop` (integración), feature branches `feat/*`.
* **CI básico:** GitHub Actions: build Flutter (debug) + build backend.
* **Secrets:** almacenar claves (JWT signing, DevExpress) en store de secretos (GitHub/DevOps).

### 0.4. Variables de entorno

* **Flutter (.env):**

  * `API_BASE_URL` (https), `LICENSE_CHECK_INTERVAL_DAYS=3`, `GRACE_DAYS=14`.
* **Backend:**

  * `DB_CONNECTION`, `JWT_PRIVATE_KEY`, `JWT_PUBLIC_KEY`, `DEVEXPRESS_LICENSE`.

---

## Fase 1 — Bootstrap del proyecto

### 1.1. Crear proyecto Flutter

```bash
flutter create app_mobile
cd app_mobile
flutter pub add flutter_riverpod dio go_router flutter_secure_storage intl share_plus path_provider open_filex workmanager freezed_annotation json_annotation
flutter pub add --dev build_runner freezed json_serializable
```

### 1.2. Estructura base Flutter (Clean)

```
lib/
  app/              # theming, router, env
  di/               # providers Riverpod
  localization/     # intl + arb
  presentation/     # UI (features/*)
  application/      # use cases
  domain/           # entidades, repos
  infrastructure/   # datasources, db, mappers, network
  utils/
```

### 1.3. Theming + Router + i18n

* `Material3`, paleta neutra, tipografías legibles.
* `go_router` con rutas por módulo.
* `intl` + `flutter_localizations` + `l10n` con `.arb` (es/en) desde el día 1.

### 1.4. Backend de reportes (.NET + DevExpress)

```bash
mkdir -p services/reporting
cd services/reporting
 dotnet new webapi -n ReportingService
 cd ReportingService
 dotnet add package DevExpress.AspNetCore.Reporting
 dotnet add package DevExpress.XtraReports
```

* Endpoints stub: `/reports/invoice`, `/reports/sales-period`, etc.
* Añadir middleware de **JWT** + validación de `tenant_id` y `entitlements` (licencias).
* Conectar a DB corporativa (consulta datasets para cada reporte). No usar tablas heredadas de reportes salvo necesidad.

### 1.5. Primer “smoke test”

* Correr app móvil con pantalla de login (mock) + home vacío.
* Correr backend y responder 200 en `/health`.

---

## Fase 2 — Modelo local y sincronización offline (multi-tenant)

### 2.1. Base de datos local (Drift o Isar)

Tablas mínimas con **multi-tenant**:

* `products(tenant_id, company_id, branch_id?, ...)`
* `customers(tenant_id, ...)`, `suppliers(tenant_id, ...)`, `banks(tenant_id, ...)`
* `sales_header(tenant_id, company_id, branch_id, ...)` + `sales_items(...)`
* `purchases_header/items`, `bank_movements`
* `sync_state(entity, tenant_id, last_pulled_at)`
* `outbox(id, tenant_id, entity, payload_json, status, created_at)`

**Campos clave:** `created_at`, `updated_at`, `version` (optimistic concurrency), índices en `(tenant_id, updated_at)` y filtros comunes.

### 2.2. Sincronización

* **Pull incremental** por `updated_at` y `tenant_id`.
* **Push** de outbox en lotes (batch). Estrategia MVP: *last write wins*. Registrar conflictos.
* **Workmanager**: tarea periódica (cada 15–30 min) + on-demand al recuperar red.

### 2.3. Selector de empresa/sucursal

* UI inicial para **elegir tenant** y **branch** (persistir selección). Permitir “Cambiar empresa”.
* Token JWT con claim `tenant_id` activo.

---

## Fase 3 — Funcionalidades núcleo

### 3.1. Autenticación y roles (básico)

* Login → JWT (access/refresh) con `tenant_id`, `role`, `permissions`.
* Guardar tokens en `flutter_secure_storage`.
* Interceptor `dio` para renovar tokens al 401.

### 3.2. Catálogos (online + cache)

* Listar/buscar **productos, clientes, proveedores, bancos** (paginado).
* Cache local; UI soporta offline (última sync visible).

### 3.3. Ventas/Compras

* Crear **venta** (cabecera + items) con validaciones mínimas.
* Crear **compra** (flujo espejo).
* Guardar en **outbox** si offline, enviar en background.

### 3.4. Bancos

* Ver **cuentas** y **movimientos** (rango de fechas). Alta de movimiento simple.

---

## Fase 4 — Reportes DevExpress + compartir/exportar

### 4.1. Backend de reportes

* Implementar **XtraReport** para: `invoice`, `sales-period`, `purchases-period`, `bank-movements`.
* Endpoint `POST /reports/<tipo>` recibe `{from,to,branch?,format:pdf|xlsx,lang:es|en}` y responde stream o URL temporal.

### 4.2. App móvil

* Pantalla “Reportes”: filtros (fecha/branch/cliente/vendedor, etc.).
* Descargar **PDF/XLSX** y guardar en `appDir/reports/`.
* Ver con visor nativo o abrir con app externa.
* **share\_plus**: compartir por WhatsApp, email, etc.

---

## Fase 5 — Seguridad avanzada y licencias

### 5.1. Licenciamiento

* **Tipos**: `free`, `trial`, `standard`, `enterprise` con `entitlements` (feature flags).
* **Activación**: `POST /licenses/activate` con `license_key` + `device_fingerprint` → `license_token` (JWT RS256) con `expires_at` y `entitlements`.
* **Check-in** periódico: `POST /licenses/checkin` (cada 3 días). **Grace offline**: 14 días.
* Guardar token en `secure_storage`. Verificar firma local.

### 5.2. Roles y permisos

* UI oculta/inhabilita funciones según `permissions`. Backend valida de nuevo (defensa en profundidad).

### 5.3. Hardening mínimo seguridad

* HTTPS obligatorio. Cert pinning opcional.
* Ofuscación (R8/Proguard), deshabilitar logs sensibles.
* Detección de root (warning/limitaciones).

---

## Fase 6 — Calidad, rendimiento y hardening

### 6.1. Rendimiento

* **Paginación** en listas y búsquedas locales.
* **Índices** en SQLite (campos de búsqueda y filtros). Batches de inserción en sync.
* **Memoization** en providers y `select()` en Riverpod/Bloc.

### 6.2. Testing

* Unit tests (use cases), widget tests críticos (ventas), integración (sync y reportes).
* Contract tests API (Postman/Collection + CI).

### 6.3. Observabilidad

* Logger estructurado en app (nivel INFO/WARN/ERROR, sin datos sensibles).
* En backend: tracing básico + dashboards (APM opcional).

---

## Fase 7 — Publicación, soporte y operación

### 7.1. Entregables

* **APK/AAB** release firmado.
* Manual corto de usuario y video breve (grabación de flujos).
* Documentación técnica (contratos API, tabla de mapeos, setup).

### 7.2. Publicación

* Play Console: fichas, políticas, privacidad.
* ProGuard/R8, shrink, minify, split per abi (opcional).

### 7.3. Soporte/Operación

* Proceso de **licencias** (emisión, renovación, revocación).
* Backups DB de producción. Migraciones controladas.

---

# Anexos

## A) Árbol recomendado (monorepo opcional)

```
root/
  apps/
    mobile/            # Flutter
      lib/
        app/
        di/
        localization/
        presentation/
          features/
            auth/
            sales/
            purchases/
            banks/
            admin/
            reports/
        application/
        domain/
        infrastructure/
          db/
          network/
          repositories_impl/
          mappers/
        utils/
      assets/
      test/
      pubspec.yaml
  services/
    reporting/
      ReportingService/
        Controllers/
        Reports/
        Services/
        appsettings.json
```

## B) Paquetes Flutter clave

* **Estado:** `flutter_riverpod`
* **HTTP:** `dio`
* **DB:** `drift` (o `isar`)
* **BG tasks:** `workmanager`
* **Seguridad:** `flutter_secure_storage`
* **Compartir:** `share_plus`
* **Archivos:** `path_provider`, `open_filex`
* **Rutas:** `go_router`
* **i18n:** `intl`, `flutter_localizations`
* **Modelado:** `freezed`, `json_serializable`

## C) Snippets de arranque

**pubspec.yaml (extracto)**

```yaml
dependencies:
  flutter: { sdk: flutter }
  flutter_riverpod: ^2.5.1
  dio: ^5.7.0
  go_router: ^14.2.0
  flutter_secure_storage: ^9.2.2
  intl: ^0.19.0
  share_plus: ^10.0.2
  path_provider: ^2.1.4
  open_filex: ^4.5.0
  workmanager: ^0.5.2
  freezed_annotation: ^2.4.4
  json_annotation: ^4.9.0

dev_dependencies:
  build_runner: ^2.4.11
  freezed: ^2.5.7
  json_serializable: ^6.8.0
```

**Interceptor JWT con refresh (Dart, simplificado)**

```dart
class AuthInterceptor extends Interceptor {
  final TokenStore store; final Dio dio;
  AuthInterceptor(this.store, this.dio);
  @override
  void onRequest(RequestOptions o, RequestInterceptorHandler h) async {
    final t = await store.accessToken(); if (t!=null) o.headers['Authorization']='Bearer $t'; h.next(o);
  }
  @override
  void onError(DioException e, ErrorInterceptorHandler h) async {
    if (e.response?.statusCode==401 && await store.refreshTokens()) {
      final req = e.requestOptions; req.headers['Authorization']='Bearer ${await store.accessToken()}';
      return h.resolve(await dio.fetch(req));
    }
    h.next(e);
  }
}
```

**Outbox (Drift - ejemplo)**

```dart
class OutboxEntries extends Table {
  TextColumn get id => text()();                // uuid
  TextColumn get tenantId => text()();
  TextColumn get entity => text()();            // 'sale' | 'purchase' | 'bank'
  TextColumn get payload => text()();           // json
  TextColumn get status => text().withDefault(const Constant('pending'))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  @override Set<Column> get primaryKey => {id};
}
```

**Workmanager (registro tarea)**

```dart
Workmanager().initialize(callbackDispatcher);
Workmanager().registerPeriodicTask(
  'syncTask', 'syncJob', frequency: const Duration(minutes: 30),
);
```

**Llamada de reporte y compartir**

```dart
final res = await dio.post(
  '/reports/sales-period',
  data: {'from': fromIso, 'to': toIso, 'format': 'pdf', 'lang': localeCode},
  options: Options(responseType: ResponseType.bytes),
);
final dir = await getApplicationDocumentsDirectory();
final f = File('${dir.path}/reports/sales_${DateTime.now().millisecondsSinceEpoch}.pdf');
await f.writeAsBytes(res.data);
await Share.shareXFiles([XFile(f.path)], text: 'Reporte de ventas');
```

## D) Checklist por semana (MVP 4 semanas)

**Semana 1**

* ✅ Proyecto Flutter + estructura Clean + i18n + router
* ✅ Backend reporting stub + `/health`
* ✅ Login (mock o real) + almacenamiento seguro token
* ✅ DB local creada (catálogos + outbox + sync\_state) con `tenant_id`
* ✅ Listado de productos/clientes (online + cache)

**Semana 2**

* ✅ Ventas/Compras: crear docs (offline), outbox y envío
* ✅ Selector empresa/sucursal + token con `tenant_id`
* ✅ Sync pull/push por tenant + BG sync con Workmanager

**Semana 3**

* ✅ Bancos: movimientos básicos
* ✅ Reportes: invoice + sales-period (backend DevExpress)
* ✅ Descarga/visor/compartir PDF desde app

**Semana 4**

* ✅ Licencias: activate/checkin/grace (UI + server)
* ✅ Roles/permissions en UI + enforcement server
* ✅ Optimización (paginación, índices, batches) + tests críticos
* ✅ Preparación release (AAB firmado) + docs y walkthrough

## E) Riesgos y mitigación

* **Alcance vs tiempo:** proteger el MVP, backlog para extras.
* **DevExpress:** empezar con 1 reporte (invoice) y replicar patrón.
* **Offline conflictos:** MVP con last-write-wins; registrar conflictos para mejoras.
* **Licencias:** firma asimétrica + grace. Probar revocación.
* **Rendimiento:** paginación/índices/batches; evitar over-fetch.

---

