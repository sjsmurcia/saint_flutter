# Backend Overview & Getting Started

Esta guía detalla, paso a paso, cómo levantar el backend desde cero para acompañar al cliente Flutter. Complementa el documento `docs/backend-plan.md`.

---

## 1. Snapshot de arquitectura

| Servicio | Responsabilidad | Estado actual |
| --- | --- | --- |
| Auth & Licensing | Login de usuarios, tokens, activación/check-in de licencias, roles/permisos | Mock embebido en `services/reporting/Program.cs`. Debe separarse en servicio propio. |
| Catálogos | Productos, clientes, empresas/sucursales con paginación | Flutter consume mocks (`MockCatalogApi`). Backend real pendiente. |
| Transacciones | Ventas, compras, bancos, reconciliación de outbox | Flutter maneja lógica offline; backend debe validar y persistir. |
| Reporting | Generar y servir PDFs (DevExpress) | Servicio mínimo en `services/reporting/ReportingService` (PDF manual). |
| Sync API | Push/Pull de lotes, estados de sincronización | Contratos pendientes. Flutter espera endpoints `/sync`. |

---

## 2. Requisitos previos

1. **Herramientas**  
   - .NET 8 SDK (`dotnet --version`).  
   - SQL Server (Developer o Express) + SQL Server Management Studio. Puedes usar PostgreSQL si lo prefieres.  
   - DevExpress Reporting (XtraReports) instalado y licenciado.  
   - Opcional: Redis para cache de tokens/licencias.
2. **CLI**  
   ```powershell
   dotnet tool install --global dotnet-ef
   ```
3. **Variables de entorno sugeridas**  
   ```powershell
   $env:ASPNETCORE_ENVIRONMENT = "Development"
   $env:CONNECTION_STR = "Server=localhost;Database=Saint;User Id=saint;Password=saint;TrustServerCertificate=True;"
   $env:JWT_PRIVATE_KEY = "...RSA PRIVATE KEY..."
   $env:JWT_PUBLIC_KEY  = "...RSA PUBLIC KEY..."
   $env:LICENSE_PRIVATE_KEY = "...RSA PRIVATE KEY..."
   $env:LICENSE_PUBLIC_KEY  = "...RSA PUBLIC KEY..."
   $env:REPORT_STORAGE_PATH = "C:\saint\reports"
   ```
   (Lleva estas claves a un vault en ambientes productivos).

---

## 3. Crear solution y proyectos base

1. **Solution**  
   ```powershell
   mkdir saint_backend
   cd saint_backend
   dotnet new sln -n SaintBackend
   ```

2. **Proyectos Web API**  
   ```powershell
   dotnet new webapi -n Saint.Auth.Api          -o services/auth/Auth.Api
   dotnet new webapi -n Saint.Licensing.Api     -o services/licensing/Licensing.Api
   dotnet new webapi -n Saint.Catalog.Api       -o services/catalog/Catalog.Api
   dotnet new webapi -n Saint.Transactions.Api  -o services/transactions/Transactions.Api
   dotnet new webapi -n Saint.Reporting.Api     -o services/reporting/Reporting.Api
   dotnet new webapi -n Saint.Sync.Api          -o services/sync/Sync.Api
   dotnet new classlib -n Saint.SharedKernel    -o shared/SharedKernel
   dotnet new classlib -n Saint.SharedContracts -o shared/SharedContracts
   ```

3. **Agregar proyectos a la solución** (ejecutar en la raíz `saint_backend`):
   ```powershell
   dotnet sln add services/auth/Auth.Api/Auth.Api.csproj
   dotnet sln add services/licensing/Licensing.Api/Licensing.Api.csproj
   dotnet sln add services/catalog/Catalog.Api/Catalog.Api.csproj
   dotnet sln add services/transactions/Transactions.Api/Transactions.Api.csproj
   dotnet sln add services/reporting/Reporting.Api/Reporting.Api.csproj
   dotnet sln add services/sync/Sync.Api/Sync.Api.csproj
   dotnet sln add shared/SharedKernel/SharedKernel.csproj
   dotnet sln add shared/SharedContracts/SharedContracts.csproj
   ```

   **Posibles errores y soluciones**
   - `Project file path ... does not exist` → verifica que el proyecto se creó en la ruta indicada (`Get-ChildItem services -Recurse -Depth 2`).
   - `The project ... has already been added` → ignora o confirma con `dotnet sln list`.
   - `Unable to find project in current directory` → asegúrate de estar en la carpeta donde está `SaintBackend.sln`.

4. **Validación rápida**
   ```powershell
   dotnet restore
   dotnet build
   ```

---

## 4. Estructura sugerida

```
services/
  auth/
    Auth.Api/
    Auth.Application/
    Auth.Infrastructure/
  licensing/
    ...
  catalog/
    ...
  transactions/
    ...
  reporting/
    Reporting.Api/      # migrar lógica de ReportingService
  sync/
    ...
shared/
  SharedKernel/
  SharedContracts/
tools/
  Seed/                 # consola para poblar datos demo
```

Cada servicio debe seguir la misma arquitectura (API + Application + Infrastructure + Tests).

---

## 5. Configurar SQL Server y migraciones

1. Crear base de datos:
   ```sql
   CREATE DATABASE Saint;
   GO
   USE Saint;
   GO
   ```
2. Añadir EF Core en cada infraestructura:
   ```powershell
   dotnet add services/catalog/Catalog.Api/Catalog.Api.csproj package Microsoft.EntityFrameworkCore.SqlServer
   dotnet add services/catalog/Catalog.Api/Catalog.Api.csproj package Microsoft.EntityFrameworkCore.Tools
   ```
   (Repite para Auth, Licensing, Transactions).
3. Crear proyectos `*.Infrastructure` y referencias:
   ```powershell
   dotnet new classlib -n Saint.Catalog.Infrastructure -o services/catalog/Catalog.Infrastructure
   dotnet add services/catalog/Catalog.Api/Auth.Api.csproj reference services/catalog/Catalog.Infrastructure/Catalog.Infrastructure.csproj
   ```
4. Generar migraciones (ejemplo catálogo):
   ```powershell
   cd services/catalog/Catalog.Infrastructure
   dotnet ef migrations add InitialCatalog -o Persistence/Migrations
   dotnet ef database update
   ```

> Modela entidades replicando las tablas usadas en Flutter: `products`, `clients`, `sales_documents`, `purchase_documents`, `bank_accounts`, `bank_movements`, `sync_states`, `outbox_entries`. Todos llevan `tenant_id`.

---

## 6. Endpoints mínimos por servicio

| Servicio | Endpoints iniciales |
| --- | --- |
| Auth | `POST /auth/login` → entrega token con role y permisos |
| Licensing | `POST /licenses/activate`, `POST /licenses/checkin`, `GET /licenses/public-key` |
| Catálogo | `GET /catalog/products`, `GET /catalog/clients`, `GET /catalog/companies` con `tenantId`, `page`, `pageSize`, `updatedAfter` |
| Transacciones | `POST /sales`, `GET /sales`, `POST /banks/movements`, `PATCH /banks/movements/{id}/status` |
| Reporting | `POST /reports/invoice`, `POST /reports/sales-period` (con DevExpress real) |
| Sync | `POST /sync/outbox`, `GET /sync/pull` |

Todos deben validar:
```
Authorization: Bearer <userToken>
X-License-Token: <licenseToken>
```

---

## 7. Flujo de trabajo recomendado

1. Configura `appsettings.Development.json` por servicio (connection string, claves RSA, rutas).
2. Implementa entidades EF, DbContext y migraciones.
3. Crea seeds (`tools/Seed`) para usuarios demo, licencias demo y catálogos base.
4. Implementa controladores/minimal APIs asegurando validaciones de licencia y permisos.
5. Ejecuta pruebas (`dotnet test`) y valida con Swagger.
6. Documenta contratos (OpenAPI) y compártelos con Flutter.

Scripts útiles:
```powershell
dotnet restore SaintBackend.sln
dotnet build SaintBackend.sln
dotnet run --project services/auth/Auth.Api/Auth.Api.csproj
dotnet run --project services/licensing/Licensing.Api/Licensing.Api.csproj
```

---

## 8. Integración con Flutter

- Sustituye `MockAuthApi`/`MockCatalogApi` por clientes Dio hacia tus servicios.
- Asegura que las respuestas tengan `title/detail/status` para mostrar errores al usuario.
- Los entitlements de licencia deben coincidir con los permisos de rol; ambos se chequean en backend y frontend.
- Ejecuta en Flutter:
  ```bash
  flutter pub run build_runner build --delete-conflicting-outputs
  flutter analyze
  ```

---

## 9. Próximos pasos

1. Levantar cada servicio con endpoints mínimos funcionando.
2. Migrar la lógica de ReportingService (DevExpress real) al nuevo proyecto.
3. Implementar paginación real en catálogos y validar desde Flutter.
4. Construir pipelines CI/CD (build + tests + deploy).
5. Añadir telemetría y logging estructurado (Serilog, Application Insights, etc.).

Con este README tienes instrucciones detalladas para dejar el backend en marcha desde cero. A medida que avances, actualiza este documento y el `backend-plan.md` con decisiones y cambios relevantes. ¡Listo para empezar! 🚀
