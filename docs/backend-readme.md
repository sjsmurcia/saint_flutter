# Backend Overview & Checklist

Roadmap to build the backend on top of the Saint legacy database. The current sprint focuses on the **Catalog module (clientes/proveedores)**.

---

## 0. Quick status (actualizado)
| Paso | Descripcion | Estado |
| --- | --- | --- |
| 1 | Preparar entorno (.NET, SQL Server, variables) | Completado |
| 2 | Crear esquema `mobile_sync` y poblar desde Saint | Completado |
| 3 | Scaffold solucion `.NET` y proyectos base | Completado |
| 4.1 | Capas `Catalog.Application` / `Catalog.Infrastructure` + paquetes EF | Completado |
| 4.2 | Configuracion `appsettings.Development.json` en `Catalog.Api` | Completado |
| 4.3 | Entidad `ClientEntity`, `CatalogDbContext`, registro DI | Completado |
| 4.4 | DTO + repositorio `ClientRepository` | Completado |
| 4.5 | Controller `ClientsController` + middleware de validacion | Completado (falta validar tokens reales) |
| 5 | Pruebas locales + documentacion y git push | Pendiente |
| Futuro | Auth, Licensing, Transactions, Sync | Por iniciar |



---

## 1. Requisitos (âœ…)
1. Instalar .NET 8 SDK, SQL Server, SSMS, DevExpress Reporting. Opcional: Redis.
2. CLI: `dotnet tool install --global dotnet-ef`
3. Variables de entorno de desarrollo:
   ```powershell
   $env:ASPNETCORE_ENVIRONMENT = "Development"
   $env:CONNECTION_STR = "Server=localhost;Database=Saint;User Id=saint;Password=saint;TrustServerCertificate=True;"
   $env:JWT_PRIVATE_KEY = "..."
   $env:JWT_PUBLIC_KEY  = "..."
   $env:LICENSE_PRIVATE_KEY = "..."
   $env:LICENSE_PUBLIC_KEY  = "..."
   $env:REPORT_STORAGE_PATH = "C:\saint\reports"
   ```

---

## 2. Esquema staging `mobile_sync` (âœ…)
1. Ejecutar el script de creaciÃ³n de tablas en SQL Server (ver `docs/Esquema staging...sql`).
2. Poblado inicial desde Saint (ejemplo clientes):
   ```sql
   INSERT INTO mobile_sync.clients (id, tenant_id, type, name, email, phone, address, tax_id, updated_at)
   SELECT
       CodClie,
       'tenant-saint',
       CASE WHEN TipoCli = 1 THEN 'supplier' ELSE 'customer' END,
       Descrip,
       Email,
       Telef,
       CONCAT(ISNULL(Direc1, ''), ' ', ISNULL(Direc2, '')),
       ID3,
       ISNULL(UpdatedAt, SYSUTCDATETIME())
   FROM dbo.SACLIE;
   ```
3. Repetir para productos (`SAPROD` + `VW_ADM_PRODEXIST`), ventas (`SAFACT`), compras (`SACOMP`) y bancos (`SABANCO`, `SAMOVBAN`).

---

## 3. Scaffold soluciÃ³n (.NET) (âœ…)
```powershell
mkdir saint_backend
cd saint_backend

dotnet new sln -n SaintBackend

# APIs principales
Dotnet new webapi -n Saint.Auth.Api          -o services/auth/Auth.Api
Dotnet new webapi -n Saint.Licensing.Api     -o services/licensing/Licensing.Api
Dotnet new webapi -n Saint.Catalog.Api       -o services/catalog/Catalog.Api
Dotnet new webapi -n Saint.Transactions.Api  -o services/transactions/Transactions.Api
Dotnet new webapi -n Saint.Reporting.Api     -o services/reporting/Reporting.Api
Dotnet new webapi -n Saint.Sync.Api          -o services/sync/Sync.Api

# LibrerÃ­as compartidas
Dotnet new classlib -n Saint.SharedKernel    -o shared/SharedKernel
Dotnet new classlib -n Saint.SharedContracts -o shared/SharedContracts

# Agregar a la soluciÃ³n
Dotnet sln add services/auth/Auth.Api/Auth.Api.csproj
...
Dotnet sln add shared/SharedContracts/SharedContracts.csproj

Dotnet restore
Dotnet build
```
*(Usar los comandos `dotnet sln add` para cada proyecto; ver historial de consola.)*

---

## 4. MÃ³dulo CatÃ¡logo

### 4.1 Capas y paquetes (âœ…)
```powershell
Dotnet new classlib -n Saint.Catalog.Application     -o services/catalog/Catalog.Application
Dotnet new classlib -n Saint.Catalog.Infrastructure  -o services/catalog/Catalog.Infrastructure
Dotnet add services/catalog/Catalog.Api/Catalog.Api.csproj reference services/catalog/Catalog.Application/Catalog.Application.csproj
Dotnet add services/catalog/Catalog.Application/Catalog.Application.csproj reference services/catalog/Catalog.Infrastructure/Catalog.Infrastructure.csproj
Dotnet add services/catalog/Catalog.Infrastructure/Catalog.Infrastructure.csproj reference shared/SharedKernel/SharedKernel.csproj
Dotnet add services/catalog/Catalog.Infrastructure/Catalog.Infrastructure.csproj reference shared/SharedContracts/SharedContracts.csproj
cd services/catalog/Catalog.Infrastructure
Dotnet add package Microsoft.EntityFrameworkCore.SqlServer
Dotnet add package Microsoft.EntityFrameworkCore.Tools
cd ../../..
```

### 4.2 ConfiguraciÃ³n (âœ…)
Actualizar `services/catalog/Catalog.Api/appsettings.Development.json` con:
```json
{
  "ConnectionStrings": {
    "Default": "Server=localhost;Database=Saint;User Id=saint;Password=saint;TrustServerCertificate=True;"
  }
}
```

### 4.3 Entidades y DbContext (completado)
- `services/catalog/Catalog.Infrastructure/Entities/ClientEntity.cs` mapea `dbo.SACLIE` (`CodClie`, `Descrip`, `Email`, `Telef`, `Direc1`, `Direc2`, `ID3`, `TipoCli`, `UpdatedAt`).
- `CatalogDbContext` expone `DbSet<ClientEntity>` y crea un indice unico por `Code` para acelerar las consultas.
- `DependencyInjection.AddCatalogInfrastructure` registra `CatalogDbContext` y se invoca desde `Catalog.Api/Program.cs`.

### 4.4 DTO y repositorio (completado)
- `SharedContracts/Catalog/ClientDto.cs` define el contrato compartido con identificador, tipo, datos de contacto y `UpdatedAt`.
- `Catalog.Application/Interfaces/IClientRepository.cs` expone `GetClientsAsync`, `GetByCodeAsync` y `UpsertAsync`.
- `Catalog.Infrastructure/Repositories/ClientRepository.cs` implementa paginacion, filtro por `updatedAfter` y upsert contra `SACLIE`.
- Pendiente: agregar pruebas unitarias o de integracion cuando exista base de datos de pruebas.

### 4.5 Controlador y validaciones (completado)
- `Catalog.Api/Controllers/ClientsController.cs` publica `GET /catalog/clients`, `GET /catalog/clients/{code}` y `POST /catalog/clients`.
- `SharedKernel/Middleware/LicenseValidationMiddleware.cs` valida los encabezados `Authorization` y `X-License-Token`, ignorando Swagger y OPTIONS.
- Swagger define esquemas de seguridad para inyectar ambos encabezados desde la interfaz y mantener la documentacion interactiva.
- Pendiente: reemplazar la validacion mock por integracion real con Auth/Licensing.

## 5. Pruebas y documentaciÃ³n (â¬œ pendiente)
1. `dotnet build SaintBackend.sln`
2. `dotnet run --project services/catalog/Catalog.Api/Catalog.Api.csproj`
3. Validar con Swagger o `curl`.
4. Actualizar `docs/backend-plan.md` y este README segÃºn avances.
5. `git add saint_backend docs/backend-plan.md docs/backend-readme.md && git commit && git push`.

---

## 6. PrÃ³ximos mÃ³dulos
Una vez CatÃ¡logo quede operativo, aplicar el mismo patrÃ³n para:
- **Auth**: mapear `SSUSRS`, `SSOPMN`, emitir tokens JWT.
- **Licensing**: gestionar licencias/activaciones.
- **Transactions**: ventas (`SAFACT`), compras (`SACOMP`), bancos (`SABANCO`).
- **Sync**: endpoints para outbox/pull apoyados en `mobile_sync`.

Mantener `docs/backend-plan.md` sincronizado con el estado real del proyecto.









