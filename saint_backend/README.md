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

