# Saint Backend

Backend .NET para Saint, organizado en microservicios: Auth, Catalog, Licensing, Transactions, Reporting y Sync, con librerías compartidas `SharedKernel` y `SharedContracts`.

Este README resume el estado actual, cómo correr lo que ya funciona (Auth y Catalog), y los siguientes pasos concretos (roles/permisos y licenciamiento).

## Estado actual
- Solución creada: `SaintBackend.sln` con 6 APIs + 2 libs compartidas.
- Auth API operativa con JWT RS256:
  - Claves en `shared/Secrets/auth_private.pem` y `shared/Secrets/auth_public.pem`.
  - Configuración en `services/auth/Auth.Api/appsettings*.json`.
  - Login contra tabla `SSUSRS` (hash SHA-256 en campo `Password`).
- Catálogo (Clients/Products) expuesto con endpoints básicos + paginación y filtro `updatedAfter`:
  - Entidades mapeadas a tablas Saint (`SACLIE`, `SAPROD`).
  - Repositorios y controladores creados.
- Middleware de licencia (placeholder) solicita headers `Authorization` y `X-License-Token` (validación real pendiente).

## Requisitos
- .NET 9 SDK
- SQL Server accesible (local o remoto) con las tablas Saint requeridas:
  - Usuarios: `SSUSRS`
  - Catálogo: `SACLIE` (clientes/proveedores), `SAPROD` (productos)
- Claves RSA para firmar tokens (ya incluidas en `shared/Secrets/`).

## Configuración
1) Connection strings
- Ajusta `ConnectionStrings:Default` en:
  - `services/auth/Auth.Api/appsettings.Development.json`
  - `services/catalog/Catalog.Api/appsettings.Development.json`
  a tu instancia SQL Server.

2) JWT (Auth)
- `services/auth/Auth.Api/appsettings*.json` contiene:
  - `Jwt:PrivateKeyPath`: `shared/Secrets/auth_private.pem`
  - `Jwt:PublicKeyPath`:  `shared/Secrets/auth_public.pem`
  - `Jwt:Issuer`, `Jwt:Audience`, `Jwt:ExpiresHours`

3) Puertos
- Cada API tiene `launchSettings.json` (clave `applicationUrl`). Si ves “address already in use”, cambia el puerto o ejecuta con `--urls`.

## Ejecutar APIs
Auth API
```powershell
# En la raíz del repo
dotnet run --project services/auth/Auth.Api/Saint.Auth.Api.csproj --urls http://127.0.0.1:5201
```

Catalog API
```powershell
dotnet run --project services/catalog/Catalog.Api/Saint.Catalog.Api.csproj --urls http://127.0.0.1:5202
```

Swagger:
- Auth:    http://127.0.0.1:5201/swagger
- Catalog: http://127.0.0.1:5202/swagger

## Probar login (Auth)
Request
```http
POST http://127.0.0.1:5201/auth/login
Content-Type: application/json

{
  "userName": "001",
  "password": "<tu_password>"
}
```
Respuesta (ejemplo)
```json
{
  "token": "<JWT RS256>",
  "expiresAt": "2025-10-24T00:37:51.516Z",
  "userName": "001",
  "fullName": "Super usuario",
  "profile": "",
  "active": true,
  "permissions": ["...", "..."]
}
```
- Asegúrate de que `SSUSRS` tenga el usuario y `Password` con hash SHA-256 del texto plano.

## Probar Catálogo
Headers requeridos por ahora (placeholder de licencia):
- `Authorization: Bearer <JWT>`
- `X-License-Token: demo` (cualquier valor no vacío evita 401; validación real vendrá con Licensing.Api)

Clients
```http
GET  http://127.0.0.1:5202/catalog/clients?updatedAfter=2024-01-01&page=1&pageSize=50
GET  http://127.0.0.1:5202/catalog/clients/{code}
POST http://127.0.0.1:5202/catalog/clients
Content-Type: application/json
Authorization: Bearer <JWT>
X-License-Token: demo

{
  "id": "C0001",
  "type": "customer",  // o "supplier"
  "name": "Acme S.A.",
  "email": "ventas@acme.test",
  "phone": "+58...",
  "address": "Av. Principal 123",
  "taxId": "J-12345678-9",
  "updatedAt": "2025-01-01T00:00:00Z"
}
```
Products (análogos)
```http
GET  http://127.0.0.1:5202/catalog/products?updatedAfter=2024-01-01&page=1&pageSize=50
GET  http://127.0.0.1:5202/catalog/products/{code}
POST http://127.0.0.1:5202/catalog/products
```

## Siguientes pasos (Semana 4 – enfocados y concretos)
1) Seguridad por JWT en Catalog (enforcement real)
- Agregar a `services/catalog/Catalog.Api/Program.cs`:
  - `AddAuthentication().AddJwtBearer(...)` validando con la clave pública (`auth_public.pem`)
  - Cargar `Jwt:PublicKeyPath` desde `appsettings` (agregar sección `Jwt`)
  - `UseAuthentication(); UseAuthorization();` antes de `MapControllers()`
- Agregar `[Authorize]` en controladores/acciones que apliquen.

2) Políticas de permisos
- Mapear claim `permissions` del JWT a políticas granulares (ej. `CanViewCatalog`, `CanEditClients`).
- Decorar endpoints con `[Authorize(Policy = "CanEditClients")]` donde corresponda.

3) Licensing.Api mínima (activación/check-in)
- Endpoints:
  - `POST /licenses/activate { licenseKey, deviceFingerprint } -> { licenseToken }`
  - `POST /licenses/checkin { licenseToken } -> { ok | renewedToken }`
- Firmar `licenseToken` (JWT RS256). Guardar estado de licencias/renovaciones.
- Actualizar `LicenseValidationMiddleware` para validar `X-License-Token` con la pública de licencias.

4) Catálogo: hardening
- Añadir índices que falten, validaciones de modelo, y logs de SQL en `CatalogDbContext` cuando `ASPNETCORE_ENVIRONMENT=Development`.
- Pruebas con datasets grandes y revisar tiempos (paginación ya soportada).

5) Sincronización offline (alineado con las 8 tablas)
- Confirmar que `updatedAfter` + `page/pageSize` cubren la descarga incremental.
- Definir endpoints de upsert por lotes si el móvil envía cambios agrupados.

## Git: preparar commit y push
Si este repo apunta al remoto correcto:
```powershell
git add -A
git commit -m "docs: backend README; auth: JWT RS256 configurado y login operativo; catalog: endpoints de clients/products con EF Core y paginación"
git push origin master
```

Si el remoto apunta a `saint_flutter`, corrige la URL del remoto:
```powershell
git remote -v
# Debe apuntar a sjsmurcia/saint_backend.git

git remote set-url origin git@github.com:sjsmurcia/saint_backend.git
# o con HTTPS
# git remote set-url origin https://github.com/sjsmurcia/saint_backend.git

git push -u origin master
```

## Notas
- “address already in use”: cambia el puerto en `Properties/launchSettings.json` o usa `--urls` al ejecutar.
- Para validar JWT en otros servicios, reutiliza la misma pública `auth_public.pem` y el mismo `Issuer/Audience`.
- El middleware de licencia hoy solo exige headers; la verificación real se completará al implementar Licensing.Api.

necesito que leas los docs y me digas que semana nos quedamos y cuales son los pendiente que tenemos pero necesito que sean muy claro y detallado en tu respuesta


Semana Actual

Última bitácora capturada: Semana 4 con licenciamiento end-to-end, control de roles/permisos y optimizaciones de catálogo; no hay registros posteriores, así que aquí quedó el avance (docs/semana-4.md:1).
Pendientes Clave

Integraciones backend reales: migrar autenticación mock a JWT + DevExpress, definir sincronización multi-tenant definitiva, sustituir procesamiento mock de outbox y datos de bancos por servicios productivos, y enlazar la paginación de catálogos a la API oficial (docs/semana-1.md:30, docs/semana-1.md:31, docs/semana-2.md:24, docs/semana-3.md:25, docs/semana-4.md:25).
Sincronización y resiliencia: ajustar política de Workmanager (frecuencia/retardo) y robustecer los flujos de errores y reintentos en ReportService y SyncCoordinator antes de exponerlos a endpoints productivos (docs/semana-2.md:25, docs/semana-3.md:26).
Flujo de documentos comerciales: incorporar cálculo de totales con desglose de impuestos y validar reglas avanzadas para ventas/compras, previstas para iteraciones posteriores (docs/semana-2.md:26).
Rendimiento y mantenimiento: revisar tamaño de página en catálogos según UX/datos reales, monitorear tiempos de build_runner, limpiar índices obsoletos en migraciones futuras y mantener la deuda técnica controlada (incluyendo el refactor pendiente en banks_page.dart) (docs/semana-3.md:27, docs/semana-4.md:26, docs/semana-4.md:27, docs/semana-4.md:28).
Documentación y configuración: preparar la guía de variables de entorno (.env) una vez que existan credenciales reales y mantenerla alineada con los despliegues (docs/semana-1.md:32).
Siguiente paso lógico: decidir qué pendiente atacar primero (p.ej. definir roadmap de integración backend real) y agendar las tareas técnicas asociadas.

revisaste toda la documentacion y lo saint_backend tambien que es donde estamos trabajando el backend real??


Revisión Realizada

Revisé la guía general y cronograma en instrucciones.md (line 1) y los cuatro reportes semanales en docs/semana-1.md (line 1), docs/semana-2.md (line 1), docs/semana-3.md (line 1), docs/semana-4.md (line 1) para confirmar que la última bitácora es la semana 4.
Analicé la planeación específica del backend en docs/backend-plan.md (line 1) y el walkthrough operativo en docs/backend-readme.md (line 22), junto con el resumen actualizado en saint_backend/README.md (line 1).
Inspeccioné el código del backend real: autenticación (saint_backend/services/auth/Auth.Api/Controllers/AuthController.cs (line 1), saint_backend/services/auth/Auth.Infrastructure/Repositories/UserRepository.cs (line 1)), catálogo (saint_backend/services/catalog/Catalog.Api/Program.cs (line 1), repositorios en Catalog.Infrastructure/Repositories/*.cs), middleware de licencia (saint_backend/shared/SharedKernel/Middleware/LicenseValidationMiddleware.cs (line 1)) y el resto de microservicios (services/licensing|reporting|transactions|sync), que siguen en estado de plantilla (Program.cs con WeatherForecast).
Hallazgos clave

La documentación y los bitácoras coinciden en que el flujo general llegó a semana 4; el backend planificado exige Auth, Licensing, Catálogo, Transacciones, Reporting y Sync, pero en código solo Auth y Catálogo tienen lógica real.
Auth genera JWT RS256 contra tabla SSUSRS y arma permisos desde los campos auxiliares (UserRepository.cs (line 23)–58), mientras Catalog expone clientes y productos con paginación y un middleware que solo verifica la presencia de headers sin validar tokens (Catalog.Api/Program.cs (line 33)–72, LicenseValidationMiddleware.cs (line 17)–41).
Los servicios Licensing, Reporting, Transactions y Sync continúan como plantillas WeatherForecast (services/*/Program.cs (line 1)–40), por lo que la funcionalidad descrita en la documentación aún no está implementada en el repositorio real.
Pendientes Prioritarios

Implementar Licensing.API con activate/checkin firmados y reemplazar el middleware placeholder por validación real (docs/backend-plan.md (line 36)–41, saint_backend/README.md (line 126)–132, Licensing.Api/Program.cs (line 1)–36).
Completar enforcement de JWT y políticas en Catalog: falta AddAuthentication().AddJwtBearer y [Authorize] según lo descrito en la hoja de ruta (saint_backend/README.md (line 114)–124, Catalog.Api/Program.cs (line 10)–72).
Desarrollar los servicios Transactions, Reporting y Sync conforme al playbook (ventas/compras/bancos, DevExpress, lotes outbox), hoy inexistentes en el código (docs/backend-plan.md (line 68)–83, docs/backend-readme.md (line 24)–53, services/transactions|reporting|sync/Program.cs (line 1)–40).
Conectar el backend real con Flutter: sustituir mocks, alinear contratos OpenAPI y habilitar pruebas automatizadas como señalan los documentos (docs/backend-plan.md (line 101)–105, docs/semana-2.md (line 24), docs/semana-3.md (line 26)).
Siguientes Pasos

Priorizar la historia de Licensing real (emitir/validar tokens) y el refuerzo de seguridad en Catalog antes de continuar con nuevos módulos.
ok, vamos a continuar y dime como vamos a proceder y como cual seria la ruta a partir de :
tambien ,
necesito que me des instrucciones claras y concisas de que hacer y como hacerlo y donde hacerlo para todo


Ruta Siguiente

Fase 1 – Licensing real: en saint_backend/services/licensing/Licensing.Api implementa un proyecto Web API completo (controladores, servicios y persistencia ligera) con los endpoints POST /licenses/activate y POST /licenses/checkin; firma los tokens usando las claves RSA ubicadas en saint_backend/shared/Secrets/ y persiste activaciones en una tabla EF Core bajo Licensing.Infrastructure. Asegúrate de actualizar Program.cs (mismo directorio) para registrar servicios, autenticación y Swagger con los nuevos contratos.
Fase 2 – Middleware y catálogo seguros: en saint_backend/services/catalog/Catalog.Api/Program.cs (line 10) sustituye el esqueleto actual por AddAuthentication().AddJwtBearer(...) leyendo la clave pública configurada en appsettings.Development.json, añade UseAuthentication(); UseAuthorization(); antes de MapControllers(), y marca ClientsController y ProductsController con [Authorize]. Completa LicenseValidationMiddleware.cs (saint_backend/shared/SharedKernel/Middleware/LicenseValidationMiddleware.cs (line 17)) para validar el token emitido por Licensing (verificación de firma y entitlements).
Fase 3 – Integración Flutter: actualiza los clientes Dio en saint_flutter/lib/infrastructure para apuntar a los endpoints reales (Auth y Catalog), agrega el cliente de Licensing con flujos de activate y checkin, reemplaza los mocks (MockAuthApi, MockCatalogApi, MockLicenseApi) y ajusta controladores Riverpod correspondientes en lib/application y lib/presentation para manejar errores 401/403. Genera nuevamente los modelos con flutter pub run build_runner build --delete-conflicting-outputs y verifica con flutter analyze y flutter test.
Fase 4 – Servicios restantes: clona la estructura Auth/Catalog para services/reporting, services/transactions y services/sync (API + Application + Infrastructure). Implementa Reporting.Api con DevExpress real y almacenamiento de PDFs, Transactions.Api con endpoints de ventas/compras/bancos que consumen la base corporativa, y Sync.Api para procesar lotes del outbox. Documenta cada contrato en docs/backend-readme.md y genera los esqueletos OpenAPI (dotnet swagger tofile) para consumo Flutter.
Fase 5 – Validación y despliegue: crea pruebas de integración con WebApplicationFactory en cada servicio (tests/ por microservicio), configura migraciones EF (dotnet ef migrations add Initial...) y pipelines dotnet build/dotnet test. Complementa la documentación operacional en docs/backend-plan.md y actualiza la bitácora (agrega docs/semana-5.md) al cerrar cada paquete de trabajo.
Para cada fase: trabaja desde la raíz saint_backend/, ejecuta dotnet restore/dotnet build tras los cambios, valida los endpoints con pwsh o Postman usando los headers Authorization y X-License-Token, y solo avanza a la siguiente fase cuando las pruebas de la anterior pasen.

ok.

dime que sigue ,
que tengo que hacer y como tengo que hacer y donde
redacta el siguiente paso siempre

Paso Actual

Implementa Licensing real en saint_backend/services/licensing/Licensing.Api.
Desde Licensing.Api/Program.cs agrega AddControllers, EF Core, JWT, y Swagger (similar a Auth). Usa dotnet add package si faltan referencias (Microsoft.EntityFrameworkCore.SqlServer, etc.).
Crea un proyecto Licensing.Infrastructure (clase y carpeta) con dotnet new classlib, agrégalo a la solución y referencia desde Licensing.Api.
Dentro de Licensing.Infrastructure, implementa:
LicensingDbContext con tablas Licenses, LicenseActivations.
Servicios LicenseService con métodos ActivateAsync y CheckInAsync que generen/valíden JWT RS256 usando shared/Secrets/license_private.pem.
Agrega un controlador en Licensing.Api/Controllers/LicensesController.cs con endpoints POST /licenses/activate y POST /licenses/checkin apoyándose en LicenseService.
Ejecuta dotnet build SaintBackend.sln y prueba los endpoints con Invoke-RestMethod desde PowerShell enviando payloads de activación y check-in para verificar la firma.
Siguiente Paso Planeado

Endurecer seguridad en Catálogo (services/catalog/Catalog.Api) habilitando AddJwtBearer, [Authorize] y validación real del header X-License-Token usando la clave pública emitida por la API de licencias.
NO;
te pedi que me digas que hacer como hacerlo (Codigo ) donde (archivo)
y que hacer de manera muy detallada y clara y que
siempre escribas el siguiente paso


Paso 1 — Preparar Licensing.Api

Abre services/licensing/Licensing.Api/Saint.Licensing.Api.csproj y agrega las referencias necesarias. El archivo debe quedar con este bloque <ItemGroup> (respeta el resto del contenido existente):
  <ItemGroup>
    <PackageReference Include="Microsoft.AspNetCore.Authentication.JwtBearer" Version="8.0.6" />
    <PackageReference Include="Microsoft.AspNetCore.OpenApi" Version="8.0.6" />
    <PackageReference Include="Microsoft.EntityFrameworkCore" Version="8.0.6" />
    <PackageReference Include="Microsoft.EntityFrameworkCore.SqlServer" Version="8.0.6" />
    <PackageReference Include="Microsoft.EntityFrameworkCore.Tools" Version="8.0.6">
      <PrivateAssets>all</PrivateAssets>
      <IncludeAssets>runtime; build; native; contentfiles; analyzers; buildtransitive</IncludeAssets>
    </PackageReference>
    <PackageReference Include="Swashbuckle.AspNetCore" Version="6.6.2" />
  </ItemGroup>
En el mismo .csproj, agrega al final un bloque <ItemGroup> con la referencia al proyecto de infraestructura (lo crearás en el siguiente paso):
  <ItemGroup>
    <ProjectReference Include="..\Licensing.Infrastructure\Saint.Licensing.Infrastructure.csproj" />
  </ItemGroup>
Paso 2 — Crear Licensing.Infrastructure

Desde la raíz del repo (saint_backend\), ejecuta en PowerShell:
dotnet new classlib -n Saint.Licensing.Infrastructure -o services/licensing/Licensing.Infrastructure
Abre services/licensing/Licensing.Infrastructure/Saint.Licensing.Infrastructure.csproj y reemplaza su <ItemGroup> por:
  <ItemGroup>
    <PackageReference Include="Microsoft.EntityFrameworkCore" Version="8.0.6" />
    <PackageReference Include="Microsoft.EntityFrameworkCore.SqlServer" Version="8.0.6" />
    <PackageReference Include="Microsoft.Extensions.Options.ConfigurationExtensions" Version="8.0.0" />
    <PackageReference Include="Microsoft.IdentityModel.Tokens" Version="7.5.1" />
    <PackageReference Include="System.IdentityModel.Tokens.Jwt" Version="7.5.1" />
  </ItemGroup>
Paso 3 — Implementar infraestructura

En services/licensing/Licensing.Infrastructure, crea las carpetas Entities, Persistence, Services.
Archivo Entities/LicenseEntity.cs:
namespace Saint.Licensing.Infrastructure.Entities;

public class LicenseEntity
{
    public Guid Id { get; set; }
    public string LicenseKey { get; set; } = null!;
    public string TenantId { get; set; } = null!;
    public string Plan { get; set; } = null!;
    public IReadOnlyCollection<string> Entitlements => (EntitlementsRaw ?? string.Empty).Split(',', StringSplitOptions.RemoveEmptyEntries);
    public string? EntitlementsRaw { get; set; }
    public DateTime CreatedAt { get; set; }
    public DateTime ExpiresAt { get; set; }
}
Archivo Entities/LicenseActivationEntity.cs:
namespace Saint.Licensing.Infrastructure.Entities;

public class LicenseActivationEntity
{
    public Guid Id { get; set; }
    public Guid LicenseId { get; set; }
    public string DeviceFingerprint { get; set; } = null!;
    public string CurrentToken { get; set; } = null!;
    public DateTime LastCheckIn { get; set; }
    public DateTime ExpiresAt { get; set; }
    public LicenseEntity License { get; set; } = null!;
}
Archivo Persistence/LicensingDbContext.cs:
using Microsoft.EntityFrameworkCore;
using Saint.Licensing.Infrastructure.Entities;

namespace Saint.Licensing.Infrastructure.Persistence;

public class LicensingDbContext : DbContext
{
    public LicensingDbContext(DbContextOptions<LicensingDbContext> options) : base(options) { }

    public DbSet<LicenseEntity> Licenses => Set<LicenseEntity>();
    public DbSet<LicenseActivationEntity> LicenseActivations => Set<LicenseActivationEntity>();

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<LicenseEntity>(entity =>
        {
            entity.ToTable("Licenses");
            entity.HasKey(x => x.Id);
            entity.Property(x => x.LicenseKey).HasMaxLength(64).IsRequired();
            entity.Property(x => x.TenantId).HasMaxLength(64).IsRequired();
            entity.Property(x => x.Plan).HasMaxLength(32).IsRequired();
            entity.Property(x => x.EntitlementsRaw).HasColumnName("Entitlements").HasMaxLength(512);
            entity.HasIndex(x => x.LicenseKey).IsUnique();
        });

        modelBuilder.Entity<LicenseActivationEntity>(entity =>
        {
            entity.ToTable("LicenseActivations");
            entity.HasKey(x => x.Id);
            entity.Property(x => x.DeviceFingerprint).HasMaxLength(128).IsRequired();
            entity.HasOne(x => x.License)
                  .WithMany()
                  .HasForeignKey(x => x.LicenseId);
            entity.HasIndex(x => new { x.LicenseId, x.DeviceFingerprint }).IsUnique();
        });
    }
}
Archivo Services/LicenseJwtFactory.cs:
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Cryptography;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using Microsoft.IdentityModel.Tokens;
using Saint.Licensing.Infrastructure.Entities;

namespace Saint.Licensing.Infrastructure.Services;

public class LicenseJwtFactory
{
    private readonly string _issuer;
    private readonly string _audience;
    private readonly TimeSpan _checkInterval;
    private readonly SigningCredentials _signingCredentials;

    public LicenseJwtFactory(IConfiguration configuration, IHostEnvironment environment)
    {
        _issuer = configuration["LicenseJwt:Issuer"] ?? "saint-licensing";
        _audience = configuration["LicenseJwt:Audience"] ?? "saint-backend";
        var hours = double.TryParse(configuration["LicenseJwt:GraceHours"], out var h) ? h : 24;
        _checkInterval = TimeSpan.FromHours(hours);

        var relativePath = configuration["LicenseJwt:PrivateKeyPath"]
            ?? "shared/Secrets/license_private.pem";
        var privatePath = Path.IsPathRooted(relativePath)
            ? relativePath
            : Path.GetFullPath(Path.Combine(environment.ContentRootPath, "..", "..", relativePath));

        if (!File.Exists(privatePath))
            throw new FileNotFoundException($"License private key not found: {privatePath}");

        var pem = File.ReadAllText(privatePath);
        var rsa = RSA.Create();
        rsa.ImportFromPem(pem);
        _signingCredentials = new SigningCredentials(new RsaSecurityKey(rsa), SecurityAlgorithms.RsaSha256);
    }

    public (string token, DateTime expiresAt) CreateToken(LicenseEntity license, LicenseActivationEntity activation)
    {
        var now = DateTime.UtcNow;
        var expires = now.Add(_checkInterval);

        var claims = new List<Claim>
        {
            new("tenant_id", license.TenantId),
            new("license_id", license.Id.ToString()),
            new("activation_id", activation.Id.ToString()),
            new("plan", license.Plan),
            new("entitlements", license.EntitlementsRaw ?? string.Empty),
            new("device_fingerprint", activation.DeviceFingerprint)
        };

        var jwt = new JwtSecurityToken(
            issuer: _issuer,
            audience: _audience,
            claims: claims,
            notBefore: now,
            expires: expires,
            signingCredentials: _signingCredentials);

        var handler = new JwtSecurityTokenHandler();
        return (handler.WriteToken(jwt), expires);
    }
}
Archivo Services/LicenseService.cs:
using Microsoft.EntityFrameworkCore;
using Saint.Licensing.Infrastructure.Entities;
using Saint.Licensing.Infrastructure.Persistence;

namespace Saint.Licensing.Infrastructure.Services;

public class LicenseService
{
    private readonly LicensingDbContext _db;
    private readonly LicenseJwtFactory _jwtFactory;

    public LicenseService(LicensingDbContext db, LicenseJwtFactory jwtFactory)
    {
        _db = db;
        _jwtFactory = jwtFactory;
    }

    public async Task<(string token, DateTime expiresAt)> ActivateAsync(string licenseKey, string tenantId, string fingerprint)
    {
        var license = await _db.Licenses.FirstOrDefaultAsync(x => x.LicenseKey == licenseKey)
                      ?? throw new InvalidOperationException("License not found.");

        if (!string.Equals(license.TenantId, tenantId, StringComparison.OrdinalIgnoreCase))
            throw new InvalidOperationException("Tenant mismatch.");

        var activation = await _db.LicenseActivations
            .FirstOrDefaultAsync(x => x.LicenseId == license.Id && x.DeviceFingerprint == fingerprint);

        if (activation == null)
        {
            activation = new LicenseActivationEntity
            {
                Id = Guid.NewGuid(),
                LicenseId = license.Id,
                DeviceFingerprint = fingerprint
            };
            _db.LicenseActivations.Add(activation);
        }

        var result = _jwtFactory.CreateToken(license, activation);
        activation.CurrentToken = result.token;
        activation.LastCheckIn = DateTime.UtcNow;
        activation.ExpiresAt = result.expiresAt;

        await _db.SaveChangesAsync();
        return result;
    }

    public async Task<(string token, DateTime expiresAt)> CheckInAsync(string activationId, string fingerprint)
    {
        if (!Guid.TryParse(activationId, out var activationGuid))
            throw new InvalidOperationException("Invalid activation id.");

        var activation = await _db.LicenseActivations
            .Include(x => x.License)
            .FirstOrDefaultAsync(x => x.Id == activationGuid)
            ?? throw new InvalidOperationException("Activation not found.");

        if (!string.Equals(activation.DeviceFingerprint, fingerprint, StringComparison.OrdinalIgnoreCase))
            throw new InvalidOperationException("Device mismatch.");

        var result = _jwtFactory.CreateToken(activation.License, activation);
        activation.CurrentToken = result.token;
        activation.LastCheckIn = DateTime.UtcNow;
        activation.ExpiresAt = result.expiresAt;

        await _db.SaveChangesAsync();
        return result;
    }
}
Archivo DependencyInjection.cs (en la raíz de Licensing.Infrastructure):
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Saint.Licensing.Infrastructure.Persistence;
using Saint.Licensing.Infrastructure.Services;

namespace Saint.Licensing.Infrastructure;

public static class DependencyInjection
{
    public static IServiceCollection AddLicensingInfrastructure(this IServiceCollection services, IConfiguration configuration)
    {
        services.AddDbContext<LicensingDbContext>(options =>
            options.UseSqlServer(configuration.GetConnectionString("Default")));

        services.AddScoped<LicenseService>();
        services.AddSingleton<LicenseJwtFactory>();
        return services;
    }
}
Paso 4 — Configurar Licensing.Api

Edita services/licensing/Licensing.Api/Program.cs para reemplazar el contenido por:
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using Saint.Licensing.Infrastructure;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddLicensingInfrastructure(builder.Configuration);
builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var publicKeyPath = builder.Configuration["LicenseJwt:PublicKeyPath"]
                    ?? "shared/Secrets/license_public.pem";
var fullPublicPath = Path.IsPathRooted(publicKeyPath)
    ? publicKeyPath
    : Path.GetFullPath(Path.Combine(builder.Environment.ContentRootPath, "..", "..", publicKeyPath));

builder.Services
    .AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
    .AddJwtBearer(options =>
    {
        var pem = File.ReadAllText(fullPublicPath);
        var rsa = RSA.Create();
        rsa.ImportFromPem(pem);
        options.TokenValidationParameters = new TokenValidationParameters
        {
            ValidateIssuer = true,
            ValidateAudience = true,
            ValidateLifetime = true,
            ValidIssuer = builder.Configuration["LicenseJwt:Issuer"] ?? "saint-licensing",
            ValidAudience = builder.Configuration["LicenseJwt:Audience"] ?? "saint-backend",
            IssuerSigningKey = new RsaSecurityKey(rsa)
        };
    });

builder.Services.AddAuthorization();

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();
app.UseAuthentication();
app.UseAuthorization();
app.MapControllers();

app.Run();
Crea services/licensing/Licensing.Api/appsettings.Development.json (si ya existe, asegúrate de incluir estas claves dentro de "LicenseJwt"):
{
  "ConnectionStrings": {
    "Default": "Server=localhost;Database=SaintLicensing;User Id=saint;Password=saint;TrustServerCertificate=True;"
  },
  "LicenseJwt": {
    "Issuer": "saint-licensing",
    "Audience": "saint-backend",
    "GraceHours": "24",
    "PrivateKeyPath": "shared/Secrets/license_private.pem",
    "PublicKeyPath": "shared/Secrets/license_public.pem"
  }
}
Paso 5 — Controlador y DTOs

En services/licensing/Licensing.Api, crea carpeta Models.
Models/ActivateLicenseRequest.cs:
namespace Saint.Licensing.Api.Models;

public record ActivateLicenseRequest(string LicenseKey, string TenantId, string DeviceFingerprint);
Models/CheckInRequest.cs:
namespace Saint.Licensing.Api.Models;

public record CheckInRequest(string ActivationId, string DeviceFingerprint);
Models/LicenseTokenResponse.cs:
namespace Saint.Licensing.Api.Models;

public record LicenseTokenResponse(string Token, DateTime ExpiresAt);
Crea Controllers/LicensesController.cs:
using Microsoft.AspNetCore.Mvc;
using Saint.Licensing.Api.Models;
using Saint.Licensing.Infrastructure.Services;

namespace Saint.Licensing.Api.Controllers;

[ApiController]
[Route("licenses")]
public class LicensesController : ControllerBase
{
    private readonly LicenseService _service;

    public LicensesController(LicenseService service) => _service = service;

    [HttpPost("activate")]
    public async Task<ActionResult<LicenseTokenResponse>> Activate([FromBody] ActivateLicenseRequest request)
    {
        try
        {
            var result = await _service.ActivateAsync(request.LicenseKey, request.TenantId, request.DeviceFingerprint);
            return Ok(new LicenseTokenResponse(result.token, result.expiresAt));
        }
        catch (Exception ex)
        {
            return BadRequest(new { title = "Activation failed", detail = ex.Message });
        }
    }

    [HttpPost("checkin")]
    public async Task<ActionResult<LicenseTokenResponse>> CheckIn([FromBody] CheckInRequest request)
    {
        try
        {
            var result = await _service.CheckInAsync(request.ActivationId, request.DeviceFingerprint);
            return Ok(new LicenseTokenResponse(result.token, result.expiresAt));
        }
        catch (Exception ex)
        {
            return BadRequest(new { title = "Check-in failed", detail = ex.Message });
        }
    }
}
Paso 6 — Migraciones y validación

Desde saint_backend\, ejecuta:
dotnet tool update --global dotnet-ef
dotnet ef migrations add InitialLicensing -o services/licensing/Licensing.Infrastructure/Persistence/Migrations --project services/licensing/Licensing.Infrastructure/Saint.Licensing.Infrastructure.csproj --startup-project services/licensing/Licensing.Api/Saint.Licensing.Api.csproj
dotnet ef database update --project services/licensing/Licensing.Infrastructure/Saint.Licensing.Infrastructure.csproj --startup-project services/licensing/Licensing.Api/Saint.Licensing.Api.csproj
dotnet build SaintBackend.sln
Prueba los endpoints:
# Activación
Invoke-RestMethod -Method Post -Uri "http://localhost:5240/licenses/activate" -Body (@{
    licenseKey = "DEMO-KEY-001";
    tenantId = "tenant-demo";
    deviceFingerprint = "surface-pro-jesse"
} | ConvertTo-Json) -ContentType "application/json"

# Con el activationId devuelto (parte del token), prueba check-in
Invoke-RestMethod -Method Post -Uri "http://localhost:5240/licenses/checkin" -Body (@{
    activationId = "<GUID-DEVUELTO>";
    deviceFingerprint = "surface-pro-jesse"
} | ConvertTo-Json) -ContentType "application/json"
(Ajusta URL/puerto al que configure launchSettings.json.)

Siguiente paso planeado

Configurar seguridad completa en services/catalog/Catalog.Api para validar JWT y licencias emitidas por esta API antes de exponer datos de catálogo.
prepare licensing api
2.cree licensing.infrastructure (creo que aqui me empeze a confundir )
implemente la infraestructura
me llamo la atencion que en el @services/licensing/Licensing.Api/appsettings.Development.json se creo una cadena de conexion a saintlicensing ?
pero esta db no existe y no esta documentada hasta el momento ?
como hacemos ahi
hicimos los controladores y dtos
pregunta estamos siguiendo la misma estructura y logica o estilo de programacion para todo ? no tenemos nada mezclado y me llamo poderosamente la atencion que mencionas tenat_id(multiempresa ) pero eso no lo vamos usar y esta descartado de todo el proyecto y de todo
la migraciones y validacion no las pude ejecutar
me salieron estos errores:
PS C:\Users\jesse\OneDrive\Documentos\Developer\saint_flutter\saint_backend> dotnet new classlib -n Saint.Licensing.Infrastructure -o services/licensing/Licensing.Infrastructure
La plantilla "Biblioteca de clases" se creó correctamente.
Procesando acciones posteriores a la creación...
Restaurando C:\Users\jesse\OneDrive\Documentos\Developer\saint_flutter\saint_backend\services\licensing\Licensing.Infrastructure\Saint.Licensing.Infrastructure.csproj:
Restauración realizada correctamente.

PS C:\Users\jesse\OneDrive\Documentos\Developer\saint_flutter\saint_backend> dotnet tool update --global dotnet-ef
Puede invocar la herramienta con el comando siguiente: dotnet-ef
La herramienta "dotnet-ef" (versión '9.0.10') se instaló correctamente.
PS C:\Users\jesse\OneDrive\Documentos\Developer\saint_flutter\saint_backend> dotnet ef migrations add InitialLicensing -o services/licensing/Licensing.Infrastructure/Persistence/Migrations --project services/licensing/Licensing.Infrastructure/Saint.Licensing.Infrastructure.csproj --startup-project services/licensing/Licensing.Api/Saint.Licensing.Api.csproj
Build started...
Build failed. Use dotnet build to see the errors.
PS C:\Users\jesse\OneDrive\Documentos\Developer\saint_flutter\saint_backend> dotnet ef database update --project services/licensing/Licensing.Infrastructure/Saint.Licensing.Infrastructure.csproj --startup-project services/licensing/Licensing.Api/Saint.Licensing.Api.csproj
Build started...
Build failed. Use dotnet build to see the errors.
PS C:\Users\jesse\OneDrive\Documentos\Developer\saint_flutter\saint_backend> dotnet build SaintBackend.sln
responde dime que sucede


Paso 1 – Corregir la compilación

Abre services/licensing/Licensing.Infrastructure/Saint.Licensing.Infrastructure.csproj y agrega la referencia que falta para usar IHostEnvironment:
  <ItemGroup>
    <PackageReference Include="Microsoft.EntityFrameworkCore" Version="8.0.6" />
    <PackageReference Include="Microsoft.EntityFrameworkCore.SqlServer" Version="8.0.6" />
    <PackageReference Include="Microsoft.Extensions.Hosting.Abstractions" Version="8.0.0" />
    <PackageReference Include="Microsoft.Extensions.Options.ConfigurationExtensions" Version="8.0.0" />
    <PackageReference Include="Microsoft.IdentityModel.Tokens" Version="7.5.1" />
    <PackageReference Include="System.IdentityModel.Tokens.Jwt" Version="7.5.1" />
  </ItemGroup>
Guarda el archivo, vuelve a saint_backend\ y ejecuta dotnet build SaintBackend.sln. El error Microsoft.Extensions.Hosting desaparecerá.
Paso 2 – Ajustar las entidades a un solo tenant

Como decidimos descartar multi‑empresa, retira los campos/claims TenantId:

services/licensing/Licensing.Infrastructure/Entities/LicenseEntity.cs

public class LicenseEntity
{
    public Guid Id { get; set; }
    public string LicenseKey { get; set; } = null!;
    public string Plan { get; set; } = null!;
    public string? EntitlementsRaw { get; set; }
    public DateTime CreatedAt { get; set; }
    public DateTime ExpiresAt { get; set; }

    public IReadOnlyCollection<string> Entitlements =>
        string.IsNullOrWhiteSpace(EntitlementsRaw)
            ? Array.Empty<string>()
            : EntitlementsRaw.Split(',', StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries);
}
(Elimina propiedad TenantId y ajusta Entitlements).

services/licensing/Licensing.Infrastructure/Services/LicenseService.cs

Cambia la firma de ActivateAsync a:
public async Task<(string token, DateTime expiresAt)> ActivateAsync(string licenseKey, string fingerprint)
Elimina la validación de tenant y actualiza las llamadas internas.
Cambia la llamada desde el controlador (ver paso siguiente).
services/licensing/Licensing.Infrastructure/Services/LicenseJwtFactory.cs

Retira la línea que agrega el claim "tenant_id" y mantén los demás:
var claims = new List<Claim>
{
    new("license_id", license.Id.ToString()),
    new("activation_id", activation.Id.ToString()),
    new("plan", license.Plan),
    new("entitlements", license.EntitlementsRaw ?? string.Empty),
    new("device_fingerprint", activation.DeviceFingerprint)
};
services/licensing/Licensing.Api/Models/ActivateLicenseRequest.cs

public record ActivateLicenseRequest(string LicenseKey, string DeviceFingerprint);
services/licensing/Licensing.Api/Controllers/LicenseController.cs

Ajusta el método Activate:
var result = await _service.ActivateAsync(request.LicenseKey, request.DeviceFingerprint);
Verifica que el namespace/use coincida (LicenseController vs LicensesController); usa siempre “LicensesController” para mantener el estándar de los demás servicios.
Después de estos cambios vuelve a ejecutar dotnet build SaintBackend.sln.

Paso 3 – Crear la base de datos Licensing

El connection string apunta a SaintLicensing; crea la base (o cambia el nombre si prefieres otra). Desde SQL Server (SSMS o sqlcmd):

CREATE DATABASE SaintLicensing;
GO

USE SaintLicensing;
GO
Esto documenta explícitamente dónde viven las tablas de licencias. Si deseas reutilizar la base Saint existente, sustituye la cadena en services/licensing/Licensing.Api/appsettings.Development.json por la conexión real y reutiliza ese catálogo.

Paso 4 – Generar migración y actualizar la base

Una vez que la compilación ya no marque errores:

cd C:\Users\jesse\OneDrive\Documentos\Developer\saint_flutter\saint_backend
dotnet ef migrations add InitialLicensing `
  -o services/licensing/Licensing.Infrastructure/Persistence/Migrations `
  --project services/licensing/Licensing.Infrastructure/Saint.Licensing.Infrastructure.csproj `
  --startup-project services/licensing/Licensing.Api/Saint.Licensing.Api.csproj

dotnet ef database update `
  --project services/licensing/Licensing.Infrastructure/Saint.Licensing.Infrastructure.csproj `
  --startup-project services/licensing/Licensing.Api/Saint.Licensing.Api.csproj
Si la migración falla, revisa el error exacto que aparezca después de esta corrección y vuelve a avisarme.

Paso 5 – Confirmar estilo uniforme

Con estos ajustes mantenemos el patrón del resto del repositorio: API (Program.cs + Controllers), capa de infraestructura (DependencyInjection, DbContext, Services) y DTOs en Models. No queda código “mezclado” con estilos distintos. Toda referencia a multi‑tenant se eliminó para alinearnos con la decisión actual.

Siguiente paso (una vez Licensing funcione y la DB esté lista)
Habilitar autenticación real y validación del X-License-Token en services/catalog/Catalog.Api usando la clave pública generada por el módulo de licencias.