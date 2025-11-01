# Backend Development Playbook

## 1. Panorama general
- **Stack recomendado**: .NET 8 (ASP.NET Core Web API) + PostgreSQL (o SQL Server) según despliegue. Persistir reportes en storage compartido (blob/S3) cuando se habilite.
- **Microservicios base**:
  1. **Auth & Licensing** (token RS256, roles/permisos, activación/check-in).
  2. **Catálogos** (productos, clientes, empresas/sucursales).
  3. **Ventas/Compras/Bancos** (documentos offline, movimientos bancarios, sincronización).
  4. **Reporting** (DevExpress/XtraReports + almacenamiento de PDFs).
  5. **Sync API** (webhooks/outbox, lotes de subida y descarga).
- **Integración actual**: El proyecto Flutter consume `reporting/Program.cs` (licencias + reportes) y espera endpoints REST JSON para el resto de módulos. Tokens de usuario y licencia se validan en cada request.

## 2. Preparación de entorno
- Requisitos: .NET 8 SDK, DevExpress Reporting (para informes), PostgreSQL 14+ (o SQL Server), Redis opcional (cache de tokens/licencias), Herramientas EF Core CLI.
- Variables comunes (`appsettings`/KeyVault):
  - `DATABASE_URL` / cadena de conexión.
  - `JWT_PRIVATE_KEY`, `JWT_PUBLIC_KEY` (usuario) y `LICENSE_PRIVATE_KEY`, `LICENSE_PUBLIC_KEY` (licencia).
  - `REPORT_STORAGE_PATH` o `BLOB_CONNECTION` para archivos.
  - `TENANT_DEFAULT_PLAN` (plan de licencia inicial con entitlements).
- Estructura recomendada: `services/auth`, `services/catalog`, `services/transactions`, `services/reporting`, `services/sync`. Usar solution única (`saint_backend.sln`) con proyectos por servicio + librería `SharedContracts`.

## 3. Modelo de datos (base SQLite/Drift ya implementada)
| Tabla | Campos clave | Notas | 
| ---   | ---          | ---   |
| `products` | tenant_id, company_id, branch_id, sku, price, updated_at | Multi tenant, requiere índices por tenant + updated_at. |
| `clients` | tenant_id, name, email, phone, updated_at | Igual a products. |
| `sales_documents` | tenant_id, company_id, branch_id, total, status, created_at | Status: draft/sent. |
| `purchase_documents` | tenant_id, company_id, branch_id, total, status, created_at | Similar a sales. |
| `bank_accounts` | tenant_id, name, currency, balance, updated_at | Licencia puede bloquear módulo bancos. |
| `bank_movements` | tenant_id, account_id, amount, type, occurred_at, status | Encolados en outbox para sincronización. |
| `sync_states` | id (tenant+entity), last_synced_at | Control de pulls. |
| `outbox_entries` | id, tenant_id, entity, payload(json), status, created_at | Subidas pendientes. |

> Backend debe replicar estos esquemas (o mapear a tablas corporativas). Mantener `tenant_id` obligatorio en todas las tablas multi-empresa.

## 4. Contratos de dominio y seguridad
### 4.1 Licencias
- Endpoint `/licenses/activate`: recibe `licenseKey` + `deviceFingerprint`. Devuelve JWT RS256 con `tenant_id`, `license_type`, `entitlements`, `check_interval_days`, `grace_days` y `expires_at`.
- Endpoint `/licenses/checkin`: revalida token, renueva fecha de check-in.
- Header requerido hacia otros servicios: `X-License-Token`.
- Entitlements actuales: `catalog`, `sales`, `purchases`, `banks`, `reports`.

### 4.2 Autenticación y permisos
- Endpoint `/auth/login`: email/password → token (Base64 JSON) para MVP. En producción migrar a JWT RS256.
- Claims esperados: `role` (admin/operator/etc.), `permissions` (lista string). Flutter revisa `session.hasPermission(permission)` y el backend aplica las mismas políticas.
- Permisos estándar: `catalog.products.view`, `catalog.clients.view`, `sales.access`, `purchases.access`, `banks.access`, `reports.generate`, `outbox.access`.

### 4.3 Integraciones Flutter
- Headers por request:
  - `Authorization: Bearer <userToken>`
  - `X-License-Token: <licenseToken>`
- Errores deben regresar HTTP 401/403 con `title/detail` para mostrarlos en UI.

## 5. Servicios priorizados por semana
### Semana 1-2 (ya cubiertas en Flutter)
1. **Auth Service**: tablas `users`, `user_roles`, `user_permissions`, endpoints de sesión y refresco (si se migra a JWT). En MVP: usuarios pre-configurados como en Program.cs.
2. **Licensing Service**: modelos `licenses`, `license_activations`, `license_plans`, CLI para generar claves. Persistir tokens emitidos para revocación.
3. **Catalog Service**:
   - GET `/catalog/products?tenantId=&updatedAfter=&page=&pageSize=`
   - GET `/catalog/clients?...`
   - GET `/catalog/companies?tenantId=...` (multi sucursal).
   - Estado actual: clientes y productos (GET/POST) expuestos en `Catalog.Api`; falta completar companias. Definir manejo multi-sucursal (CodSucu) y correlativos por sucursal antes de permitir escrituras.
4. **Sync API**:
   - POST `/sync/outbox` recibe lote (sales/purchases/banks) → valida y actualiza estatus.
   - GET `/sync/pull?entity=sales&since=` devuelve cambios incremental.

### Semana 3
1. **Bank Service**:
   - POST `/banks/movements` (validar tipo deposit/withdraw, saldo, pertenencia tenant).
   - PATCH `/banks/movements/{id}/status` (sync).
   - GET `/banks/accounts` y `/banks/movements?accountId=...` con paginación.
2. **Reports Service**: extender `Program.cs` hacia proyecto real DevExpress.
   - Sustituir PDF manual por generación XtraReport (`Invoice`, `SalesPeriod`).
   - Almacenar archivos en storage y exponer metadata via `/reports/history` si se requiere.

### Semana 4
1. **Roles & permisos**: endpoints CRUD `admin/users`, `admin/roles`, `admin/permissions`. Backend debe devolver permisos en login.
2. **Paginación & optimizaciones**:
   - Implementar filtros `limit/offset` y `updatedAfter` en catálogos, ventas, compras, movimientos.
   - Agregar índices en BD productiva equivalentes a `@TableIndex` del lado Flutter.
3. **Observabilidad**:
   - Logging estructurado (serilog) y métricas para activaciones/check-in fallidas.
   - Auditoría de movimientos bancarios y reportes generados.

## 6. Roadmap inmediato
1. **Crear solution backend** con proyectos:
   - `Saint.SharedContracts` (DTO comunes).
   - `Saint.Auth`, `Saint.Licensing`, `Saint.Catalog`, `Saint.Transactions`, `Saint.Reporting`.
   - `Saint.Gateway` (API Gateway opcional) o usar reverse proxy.
2. **Configurar EF Core** con migraciones iniciales para cada servicio (schemas por tenant).
3. **Implementar endpoints** descritos y pruebas unitarias/integración (xUnit + WebApplicationFactory).
4. **Extraer claves** de Program.cs a KeyVault / secrets locales.
5. **CI/CD**: pipelines GitHub Actions para dotnet test + publish container.
6. **Sincronizar contratos**: generar `openapi.yaml` por servicio para consumo Flutter (via `chopper` o manual).

## 7. Requisitos adicionales
- **DevExpress**: definir repositorio Git separado con proyectos `.repx` y pipeline de publicación.
- **Seguridad**: En hosting productivo, validar `tenant_id` contra licencia activa en cada request; usar rate limiting por dispositivo.
- **Backoffice web** (futuro): React/Blazor para administrar licencias, usuarios y monitorear outbox.

## 8. Próximos pasos sugeridos
1. Esqueletos de servicios con endpoints vacíos y contratos compartidos (`SharedContracts`).
2. Crear migraciones base y comandos de seed (usuarios demo, licencias demo).
3. Implementar catálogo paginado y federar datos desde Flutter para validar end-to-end.
4. Sustituir lógica mock de reportes por DevExpress real.
5. Documentar endpoints en `docs/api` (OpenAPI + workflows de curl/postman).
