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
        var privatePath = ResolvePath(environment.ContentRootPath, relativePath);

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

    private static string ResolvePath(string basePath, string configuredPath)
    {
        if (Path.IsPathRooted(configuredPath))
            return configuredPath;

        var segments = configuredPath
            .Split(new[] { '/', '\\' }, StringSplitOptions.RemoveEmptyEntries);

        var parts = new List<string> { basePath, "..", "..", ".." };
        parts.AddRange(segments);

        return Path.GetFullPath(Path.Combine(parts.ToArray()));
    }
}
