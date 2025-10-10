# ReportingService

Servicio .NET 9 minimalista que actua como stub para el backend de reportes.

## Endpoints expuestos

- `GET /health` devuelve `{ "status": "ok" }` con timestamp.
- `POST /reports/invoice` recibe `tenantId`, `documentId`, `format` y responde 202 con ticket simulado.

## Ejecutar localmente

```bash
cd services/reporting/ReportingService
 dotnet watch run
```

## Notas

- No hay dependencia real a DevExpress; los endpoints retornan datos simulados.
- Puntos de extension: agregar autenticacion JWT, validacion de tenant y generacion real de reportes.
