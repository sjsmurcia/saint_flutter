using System.Globalization;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using System.Text.Json;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;

JwtSecurityTokenHandler.DefaultInboundClaimTypeMap.Clear();

const string LicensePrivateKeyPem =
    """
    -----BEGIN RSA PRIVATE KEY-----
    MIIEpAIBAAKCAQEA90uk29eprlcLt4S6IU/OV42zedrlHgv2sMSVbWc4pvMHXEDIweQ9m0L5A9Ki
    LuOEJffnbLW9AExucYJOmVpegAikjVJzX6x2BjwJNi7PYxH7kwYoC3UK4YZE4ybpCb796vfBKJRg
    eeUgETk2K3eI/ml7lbiTnSZ+Np7lD/dDjfTAk7J4o35KYeThPjpjOomfYZZP8gu2PP3DT3UKhHJa
    4wUXQ1vy/c21Y/EeTp/r/l3iwbzWED8fvZg6aCui/qTg/b93FVLC5BLudnCeowJEIU3v5UPgXPIg
    gDy7DJM6RiEJ8Dj774qvmbRkJQRIZdAZ873TohqVbvN8qMxJ+QMU4QIDAQABAoIBAQDlRSRbDd8q
    21jplAxcxfiwA5fZ6a9x4/WafSdsfr5vSfIQ/Z8i49CaGcV0XdwvTJBAA05z4yqPFE1wvzbPxpDG
    czzcKQz+Lo5dyVtg+JUdbJapAJQvyxuDa1CCqJh1iLUxGvHiBW5MlLjePwSR2AkSlgkWDkIM+Jsb
    WMVVwBDJkcZCliXUmuRI3NezR4tzdpHvBaAUqWtTPY/T3jC1TrN749Me5IrTcwBxA/1f6YSUy91X
    +x5mFnI/L8nKZFpGahimdOnjp4JdYCAG+wZrdUdfXqnG0sHgqhnfyA8iNoTXa7YKt25tTVyzbPPN
    3MhrsYXyd7rKGbh73B64vG8iz/7hAoGBAPhPrdHz3xariYVj3vZ50y5aLRIZQlzZumn0E9gNuMqY
    cWXQ4SUReiLXNp7UewqU690Mwp4KekTD80+lk+uqd+Pjxpu2Abf8NXhDr6ITRUOQXdKTNdAZfRXt
    D6bEXfsPrKERVr0BXDZ/bxsVVnqEhE6V9UtUh+cd6PUmkf6ePQajAoGBAP7z6ckOEGsCOaZpNT2m
    /HXtMHvbYCbO/CXy3VGGvOWxP96aL+9tZblLji5Ls4psPbwTdFgJ3FjphiOUdNgUayWufiFpbC9B
    G+46/8JBfXzJzxPTb0URJodH1YxeS6poXx4vFPgX5OIyILebOIwECga9fEzWVaC1mgGshBQDCiKr
    AoGAbLi+e7oSyONMsGn9GuBWdeon58/FfdAbTf7/nU7MxXAf3pupqMhROOYQVVTllsmDyGKo5/fg
    dzFw3EO8U6htHAwETvNPJ1a3trO0N/vGDQIuAmBQZJB0c2A7xSIfoCjJxjBIUTNCQ95iMHKUTcqt
    /5arM1OMucYf1Q8RR3HTeI8CgYEAshcJgHL9jvIv+QlWsmk5wtpbWrlD8ff19EAwzukSfFQTLFiC
    EXpWa1fWyooAsTmo6f6g73p72/PLyoDCGcoxilHYM1ijxGJzszatPzFmCcwihVPVTuaLBkZsai/Y
    JQHhJ4F14VM3g7XGWtrnZg7QPiMQd8/kYm1YVcD/RcdVxh8CgYACLEZi6M18vZoCUtt2UZZhjn5Q
    2p73DTqDjRAeFtzHfqD9FJEnEiAc2We7uIMS+mwi84R9sg2JV+XMElSSCsmeks+sbeIu4QwCWDyB
    yPA+UFLxBlE6bY1szJgAHJXA0boZg4vEtqPixqhwmcoYlF65mYfVxfLGdWsEcllo7fPyoQ==
    -----END RSA PRIVATE KEY-----
    """;

const string LicensePublicKeyPem =
    """
    -----BEGIN PUBLIC KEY-----
    MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA90uk29eprlcLt4S6IU/OV42zedrlHgv2
    sMSVbWc4pvMHXEDIweQ9m0L5A9KiLuOEJffnbLW9AExucYJOmVpegAikjVJzX6x2BjwJNi7PYxH7
    kwYoC3UK4YZE4ybpCb796vfBKJRgeeUgETk2K3eI/ml7lbiTnSZ+Np7lD/dDjfTAk7J4o35KYeTh
    PjpjOomfYZZP8gu2PP3DT3UKhHJa4wUXQ1vy/c21Y/EeTp/r/l3iwbzWED8fvZg6aCui/qTg/b93
    FVLC5BLudnCeowJEIU3v5UPgXPIggDy7DJM6RiEJ8Dj774qvmbRkJQRIZdAZ873TohqVbvN8qMxJ
    +QMU4QIDAQAB
    -----END PUBLIC KEY-----
    """;

var signingRsa = RSA.Create();
signingRsa.ImportFromPem(LicensePrivateKeyPem);
var signingCredentials = new SigningCredentials(new RsaSecurityKey(signingRsa), SecurityAlgorithms.RsaSha256);

var validationRsa = RSA.Create();
validationRsa.ImportFromPem(LicensePublicKeyPem);
var validationParameters = new TokenValidationParameters
{
    ValidateIssuer = false,
    ValidateAudience = false,
    ValidateLifetime = true,
    RequireExpirationTime = true,
    IssuerSigningKey = new RsaSecurityKey(validationRsa),
    ClockSkew = TimeSpan.FromMinutes(1),
};

var tokenHandler = new JwtSecurityTokenHandler();
var tokenSerializerOptions = new JsonSerializerOptions
{
    PropertyNamingPolicy = JsonNamingPolicy.CamelCase,
};

var licenseRegistry = new Dictionary<string, LicenseDefinition>(StringComparer.OrdinalIgnoreCase)
{
    ["SAINT-TRIAL-001"] = new LicenseDefinition(
        LicenseId: "LIC-TRIAL-001",
        TenantId: "tenant-001",
        LicenseType: "trial",
        Entitlements: new[] { "catalog", "sales", "purchases", "banks", "reports" },
        ValidUntilUtc: DateTime.UtcNow.AddMonths(6),
        CheckIntervalDays: 3,
        GraceDays: 14),
    ["SAINT-STANDARD-001"] = new LicenseDefinition(
        LicenseId: "LIC-STD-001",
        TenantId: "tenant-002",
        LicenseType: "standard",
        Entitlements: new[] { "catalog", "sales", "reports" },
        ValidUntilUtc: DateTime.UtcNow.AddMonths(12),
        CheckIntervalDays: 3,
        GraceDays: 14),
};

var revokedLicenses = new HashSet<string>(StringComparer.OrdinalIgnoreCase);

var userRegistry = new Dictionary<string, UserRecord>(StringComparer.OrdinalIgnoreCase)
{
    ["demo@saint.com"] = new UserRecord(
        Email: "demo@saint.com",
        Password: "demo123",
        UserName: "Demo Admin",
        TenantId: "tenant-001",
        Role: "admin",
        Permissions: new[] { "*" }),
    ["operador@saint.com"] = new UserRecord(
        Email: "operador@saint.com",
        Password: "operador123",
        UserName: "Operador Bancos",
        TenantId: "tenant-001",
        Role: "operator",
        Permissions: new[]
        {
            "catalog.products.view",
            "catalog.clients.view",
            "sales.access",
            "purchases.access",
            "banks.access",
            "reports.generate",
            "outbox.access",
        }),
};

var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.UseHttpsRedirection();

app.MapGet("/health", () => Results.Ok(new HealthResponse("ok", DateTime.UtcNow)));

app.MapGet("/licenses/public-key", () => Results.Ok(new PublicKeyResponse(LicensePublicKeyPem)));

app.MapPost("/licenses/activate", (ActivateLicenseRequest request) =>
    ActivateLicense(request, licenseRegistry, revokedLicenses, tokenHandler, signingCredentials));

app.MapPost("/licenses/checkin", (CheckInRequest request) =>
    CheckInLicense(request, licenseRegistry, revokedLicenses, tokenHandler, signingCredentials, validationParameters));

app.MapPost("/auth/login", (LoginRequest request) =>
{
    if (!userRegistry.TryGetValue(request.Email.Trim().ToLowerInvariant(), out var user))
    {
        return Results.Problem("Credenciales invalidas", statusCode: StatusCodes.Status401Unauthorized);
    }

    if (!string.Equals(user.Password, request.Password, StringComparison.Ordinal))
    {
        return Results.Problem("Credenciales invalidas", statusCode: StatusCodes.Status401Unauthorized);
    }

    var expiresAt = DateTime.UtcNow.AddHours(8);
    var payload = new UserTokenPayload(
        user.UserName,
        user.Role,
        user.TenantId,
        user.Permissions,
        expiresAt);
    var token = EncodeUserToken(payload, tokenSerializerOptions);
    var response = new LoginResponse(
        user.UserName,
        user.Role,
        user.TenantId,
        user.Permissions,
        expiresAt,
        token);
    return Results.Ok(response);
});

app.MapPost("/reports/invoice", (HttpContext context, InvoiceRequest request) =>
{
    var licenseValidation = EnsureLicense(context, request.TenantId, "reports", validationParameters, tokenHandler, licenseRegistry, revokedLicenses);
    if (licenseValidation is IResult licenseFailure)
    {
        return licenseFailure;
    }

    var userValidation = EnsureUser(context, request.TenantId, "reports.generate", tokenSerializerOptions);
    if (userValidation is IResult userFailure)
    {
        return userFailure;
    }

    var title = $"Factura #{request.DocumentId}";
    var body = $"Tenant: {request.TenantId}\nGenerado: {DateTime.UtcNow:yyyy-MM-dd HH:mm}\nFormato: {request.Format}";
    var pdf = PdfGenerator.CreateDocument(title, body);
    var fileName = $"invoice_{request.DocumentId}.pdf";
    return Results.File(pdf, "application/pdf", fileName);
}).WithName("CreateInvoiceReport");

app.MapPost("/reports/sales-period", (HttpContext context, SalesPeriodRequest request) =>
{
    var licenseValidation = EnsureLicense(context, request.TenantId, "reports", validationParameters, tokenHandler, licenseRegistry, revokedLicenses);
    if (licenseValidation is IResult licenseFailure)
    {
        return licenseFailure;
    }

    var userValidation = EnsureUser(context, request.TenantId, "reports.generate", tokenSerializerOptions);
    if (userValidation is IResult userFailure)
    {
        return userFailure;
    }

    var title = "Reporte de ventas";
    var body = $"Tenant: {request.TenantId}\nPeriodo: {request.From:yyyy-MM-dd} - {request.To:yyyy-MM-dd}\nFormato: {request.Format}";
    var pdf = PdfGenerator.CreateDocument(title, body);
    var fileName = $"sales_{request.From:yyyyMMdd}_{request.To:yyyyMMdd}.pdf";
    return Results.File(pdf, "application/pdf", fileName);
}).WithName("CreateSalesPeriodReport");

app.Run();

static IResult ActivateLicense(
    ActivateLicenseRequest request,
    IReadOnlyDictionary<string, LicenseDefinition> registry,
    ISet<string> revokedLicenses,
    JwtSecurityTokenHandler handler,
    SigningCredentials signingCredentials)
{
    if (string.IsNullOrWhiteSpace(request.LicenseKey))
    {
        return Results.BadRequest(new ProblemDetails { Title = "License key required" });
    }

    if (!registry.TryGetValue(request.LicenseKey, out var definition))
    {
        return Results.Problem("License key invalid or not found", statusCode: StatusCodes.Status400BadRequest);
    }

    if (revokedLicenses.Contains(definition.LicenseId))
    {
        return Results.Problem("License revoked", statusCode: StatusCodes.Status403Forbidden);
    }

    if (DateTime.UtcNow > definition.ValidUntilUtc)
    {
        return Results.Problem("License expired", statusCode: StatusCodes.Status403Forbidden);
    }

    var lastCheckIn = DateTime.UtcNow;
    var token = CreateLicenseToken(request.LicenseKey, definition, lastCheckIn, handler, signingCredentials);
    var response = new LicenseResponse(
        token,
        definition.LicenseId,
        definition.TenantId,
        definition.LicenseType,
        definition.Entitlements,
        definition.ValidUntilUtc,
        definition.GraceDays,
        definition.CheckIntervalDays,
        lastCheckIn);
    return Results.Ok(response);
}

static IResult CheckInLicense(
    CheckInRequest request,
    IReadOnlyDictionary<string, LicenseDefinition> registry,
    ISet<string> revokedLicenses,
    JwtSecurityTokenHandler handler,
    SigningCredentials signingCredentials,
    TokenValidationParameters validationParameters)
{
    if (string.IsNullOrWhiteSpace(request.LicenseToken))
    {
        return Results.BadRequest(new ProblemDetails { Title = "License token required" });
    }

    try
    {
        var principal = handler.ValidateToken(request.LicenseToken, validationParameters, out _);
        var licenseKey = principal.FindFirstValue("license_key") ?? principal.FindFirstValue(JwtRegisteredClaimNames.Sub);
        if (licenseKey == null)
        {
            return Results.Problem("License token missing license key", statusCode: StatusCodes.Status400BadRequest);
        }

        if (!registry.TryGetValue(licenseKey, out var definition))
        {
            return Results.Problem("License key invalid or not found", statusCode: StatusCodes.Status400BadRequest);
        }

        if (revokedLicenses.Contains(definition.LicenseId))
        {
            return Results.Problem("License revoked", statusCode: StatusCodes.Status403Forbidden);
        }

        if (DateTime.UtcNow > definition.ValidUntilUtc)
        {
            return Results.Problem("License expired", statusCode: StatusCodes.Status403Forbidden);
        }

        var lastCheckIn = DateTime.UtcNow;
        var token = CreateLicenseToken(licenseKey, definition, lastCheckIn, handler, signingCredentials);
        var response = new LicenseResponse(
            token,
            definition.LicenseId,
            definition.TenantId,
            definition.LicenseType,
            definition.Entitlements,
            definition.ValidUntilUtc,
            definition.GraceDays,
            definition.CheckIntervalDays,
            lastCheckIn);
        return Results.Ok(response);
    }
    catch (SecurityTokenExpiredException)
    {
        return Results.Problem("License token expired", statusCode: StatusCodes.Status403Forbidden);
    }
    catch (SecurityTokenException ex)
    {
        return Results.Problem($"License token invalid: {ex.Message}", statusCode: StatusCodes.Status400BadRequest);
    }
    catch (Exception ex)
    {
        return Results.Problem($"Unexpected error validating license: {ex.Message}", statusCode: StatusCodes.Status400BadRequest);
    }
}

static object? EnsureLicense(
    HttpContext context,
    string tenantId,
    string entitlement,
    TokenValidationParameters validationParameters,
    JwtSecurityTokenHandler handler,
    IReadOnlyDictionary<string, LicenseDefinition> registry,
    ISet<string> revokedLicenses)
{
    if (!context.Request.Headers.TryGetValue("X-License-Token", out var tokenHeader))
    {
        return Results.Problem("License token header missing", statusCode: StatusCodes.Status401Unauthorized);
    }

    var licenseToken = tokenHeader.ToString();
    try
    {
        var principal = handler.ValidateToken(licenseToken, validationParameters, out _);
        var licenseKey = principal.FindFirstValue("license_key") ?? principal.FindFirstValue(JwtRegisteredClaimNames.Sub);
        if (licenseKey == null)
        {
            return Results.Problem("License token missing license key", statusCode: StatusCodes.Status400BadRequest);
        }

        if (!registry.TryGetValue(licenseKey, out var definition))
        {
            return Results.Problem("License key invalid or not found", statusCode: StatusCodes.Status403Forbidden);
        }

        if (revokedLicenses.Contains(definition.LicenseId))
        {
            return Results.Problem("License revoked", statusCode: StatusCodes.Status403Forbidden);
        }

        if (DateTime.UtcNow > definition.ValidUntilUtc)
        {
            return Results.Problem("License expired", statusCode: StatusCodes.Status403Forbidden);
        }

        var entitlementsClaim = principal.FindFirstValue("entitlements");
        var entitlements = entitlementsClaim != null
            ? JsonSerializer.Deserialize<string[]>(entitlementsClaim) ?? Array.Empty<string>()
            : definition.Entitlements;

        var hasEntitlement =
            entitlements.Any(e => string.Equals(e, entitlement, StringComparison.OrdinalIgnoreCase)) ||
            definition.Entitlements.Any(e => string.Equals(e, entitlement, StringComparison.OrdinalIgnoreCase));

        if (!hasEntitlement)
        {
            return Results.Problem("License does not include the required entitlement", statusCode: StatusCodes.Status403Forbidden);
        }

        if (!string.Equals(definition.TenantId, tenantId, StringComparison.OrdinalIgnoreCase))
        {
            return Results.Problem("Tenant mismatch for license", statusCode: StatusCodes.Status403Forbidden);
        }

        var lastCheckInClaim = principal.FindFirstValue("last_check_in");
        if (lastCheckInClaim != null)
        {
            var lastCheckIn = DateTime.Parse(lastCheckInClaim, null, DateTimeStyles.RoundtripKind);
            if (lastCheckIn.AddDays(definition.GraceDays) < DateTime.UtcNow)
            {
                return Results.Problem("License grace period exceeded", statusCode: StatusCodes.Status403Forbidden);
            }
        }

        return null;
    }
    catch (SecurityTokenExpiredException)
    {
        return Results.Problem("License token expired", statusCode: StatusCodes.Status403Forbidden);
    }
    catch (Exception ex)
    {
        return Results.Problem($"License validation failed: {ex.Message}", statusCode: StatusCodes.Status401Unauthorized);
    }
}

static object? EnsureUser(
    HttpContext context,
    string tenantId,
    string requiredPermission,
    JsonSerializerOptions serializerOptions)
{
    if (!context.Request.Headers.TryGetValue("Authorization", out var headerValues))
    {
        return Results.Problem("Authorization header missing", statusCode: StatusCodes.Status401Unauthorized);
    }

    var header = headerValues.ToString();
    var token = header.StartsWith("Bearer ", StringComparison.OrdinalIgnoreCase)
        ? header.Substring("Bearer ".Length).Trim()
        : header.Trim();

    if (string.IsNullOrWhiteSpace(token))
    {
        return Results.Problem("Token de usuario requerido", statusCode: StatusCodes.Status401Unauthorized);
    }

    var claims = DecodeUserToken(token, serializerOptions);
    if (claims == null)
    {
        return Results.Problem("Token de usuario invalido", statusCode: StatusCodes.Status401Unauthorized);
    }

    if (!string.Equals(claims.TenantId, tenantId, StringComparison.OrdinalIgnoreCase))
    {
        return Results.Problem("Tenant del usuario no coincide", statusCode: StatusCodes.Status403Forbidden);
    }

    if (claims.ExpiresAtUtc < DateTime.UtcNow)
    {
        return Results.Problem("Token de usuario expirado", statusCode: StatusCodes.Status401Unauthorized);
    }

    if (!HasPermission(claims, requiredPermission))
    {
        return Results.Problem("Usuario sin permiso para la operacion solicitada", statusCode: StatusCodes.Status403Forbidden);
    }

    return null;
}

static bool HasPermission(UserTokenClaims claims, string permission)
{
    var permissions = claims.Permissions ?? Array.Empty<string>();
    if (permissions.Any(p => p == "*" || string.Equals(p, permission, StringComparison.OrdinalIgnoreCase)))
    {
        return true;
    }

    if (string.Equals(claims.Role, "admin", StringComparison.OrdinalIgnoreCase))
    {
        return true;
    }

    return false;
}

static string CreateLicenseToken(
    string licenseKey,
    LicenseDefinition definition,
    DateTime lastCheckInUtc,
    JwtSecurityTokenHandler handler,
    SigningCredentials signingCredentials)
{
    var claims = new List<Claim>
    {
        new(JwtRegisteredClaimNames.Sub, definition.LicenseId),
        new("license_key", licenseKey),
        new("license_id", definition.LicenseId),
        new("tenant_id", definition.TenantId),
        new("license_type", definition.LicenseType),
        new("entitlements", JsonSerializer.Serialize(definition.Entitlements)),
        new("check_interval_days", definition.CheckIntervalDays.ToString(CultureInfo.InvariantCulture)),
        new("grace_days", definition.GraceDays.ToString(CultureInfo.InvariantCulture)),
        new("last_check_in", lastCheckInUtc.ToString("O", CultureInfo.InvariantCulture)),
        new(JwtRegisteredClaimNames.Iat, ((DateTimeOffset)lastCheckInUtc).ToUnixTimeSeconds().ToString(CultureInfo.InvariantCulture), ClaimValueTypes.Integer64),
    };

    var token = handler.CreateJwtSecurityToken(
        issuer: "saint-licensing",
        audience: "saint-app",
        subject: new ClaimsIdentity(claims),
        notBefore: lastCheckInUtc,
        expires: definition.ValidUntilUtc,
        signingCredentials: signingCredentials);

    return handler.WriteToken(token);
}

static string EncodeUserToken(UserTokenPayload payload, JsonSerializerOptions options)
{
    var json = JsonSerializer.Serialize(payload, options);
    var bytes = Encoding.UTF8.GetBytes(json);
    return Convert.ToBase64String(bytes);
}

static UserTokenClaims? DecodeUserToken(string token, JsonSerializerOptions options)
{
    try
    {
        var bytes = Convert.FromBase64String(token);
        var json = Encoding.UTF8.GetString(bytes);
        return JsonSerializer.Deserialize<UserTokenClaims>(json, options);
    }
    catch
    {
        return null;
    }
}

record HealthResponse(string Status, DateTime Timestamp);

record PublicKeyResponse(string Key);

record ActivateLicenseRequest(string LicenseKey, string? DeviceFingerprint);

record CheckInRequest(string LicenseToken, string? DeviceFingerprint);

record LicenseResponse(
    string LicenseToken,
    string LicenseId,
    string TenantId,
    string LicenseType,
    string[] Entitlements,
    DateTime ExpiresAtUtc,
    int GraceDays,
    int CheckIntervalDays,
    DateTime LastCheckInUtc);

record LicenseDefinition(
    string LicenseId,
    string TenantId,
    string LicenseType,
    string[] Entitlements,
    DateTime ValidUntilUtc,
    int CheckIntervalDays,
    int GraceDays);

record InvoiceRequest(
    string TenantId,
    string DocumentId,
    string Format = "pdf",
    string? Locale = "es-MX"
);

record SalesPeriodRequest(
    string TenantId,
    DateTime From,
    DateTime To,
    string Format = "pdf",
    string? Locale = "es-MX"
);

record LoginRequest(string Email, string Password);

record LoginResponse(
    string UserName,
    string Role,
    string TenantId,
    string[] Permissions,
    DateTime ExpiresAt,
    string Token);

record UserRecord(
    string Email,
    string Password,
    string UserName,
    string TenantId,
    string Role,
    string[] Permissions);

record UserTokenPayload(
    string UserName,
    string Role,
    string TenantId,
    string[] Permissions,
    DateTime ExpiresAtUtc);

record UserTokenClaims(
    string UserName,
    string Role,
    string TenantId,
    string[] Permissions,
    DateTime ExpiresAtUtc);

static class PdfGenerator
{
    public static byte[] CreateDocument(string title, string body)
    {
        var escapedTitle = title.Replace("(", "\\(").Replace(")", "\\)");
        var escapedBody = body.Replace("(", "\\(").Replace(")", "\\)");
        escapedBody = escapedBody.Replace("\n", ") Tj \n72 660 Td (");

        var content = $"BT /F1 24 Tf 72 720 Td ({escapedTitle}) Tj ET\nBT /F1 14 Tf 72 680 Td ({escapedBody}) Tj ET\n";
        var contentBytes = Encoding.ASCII.GetBytes(content);

        var objects = new[]
        {
            "1 0 obj\n<< /Type /Catalog /Pages 2 0 R >>\nendobj\n",
            "2 0 obj\n<< /Type /Pages /Kids [3 0 R] /Count 1 >>\nendobj\n",
            "3 0 obj\n<< /Type /Page /Parent 2 0 R /MediaBox [0 0 612 792] /Contents 4 0 R /Resources << /Font << /F1 5 0 R >> >> >>\nendobj\n",
            $"4 0 obj\n<< /Length {contentBytes.Length} >>\nstream\n{content}endstream\nendobj\n",
            "5 0 obj\n<< /Type /Font /Subtype /Type1 /BaseFont /Helvetica >>\nendobj\n"
        };

        using var ms = new MemoryStream();
        Write(ms, "%PDF-1.4\n");
        var offsets = new List<long>();

        foreach (var obj in objects)
        {
            offsets.Add(ms.Position);
            Write(ms, obj);
        }

        var xrefOffset = ms.Position;
        Write(ms, $"xref\n0 {objects.Length + 1}\n");
        Write(ms, "0000000000 65535 f \n");
        foreach (var offset in offsets)
        {
            Write(ms, offset.ToString("0000000000"));
            Write(ms, " 00000 n \n");
        }

        Write(ms, "trailer\n<< /Size ");
        Write(ms, (objects.Length + 1).ToString(CultureInfo.InvariantCulture));
        Write(ms, " /Root 1 0 R >>\nstartxref\n");
        Write(ms, xrefOffset.ToString(CultureInfo.InvariantCulture));
        Write(ms, "\n%%EOF\n");

        return ms.ToArray();

        static void Write(MemoryStream stream, string value)
        {
            var bytes = Encoding.ASCII.GetBytes(value);
            stream.Write(bytes, 0, bytes.Length);
        }
    }
}
