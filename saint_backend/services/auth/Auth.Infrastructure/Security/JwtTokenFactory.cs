using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Cryptography;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using Saint.Auth.Infrastructure.Entities;
using Saint.SharedContracts.Auth;

namespace Saint.Auth.Infrastructure.Security;

public class JwtTokenFactory
{
    private readonly string _issuer;
    private readonly string _audience;
    private readonly TimeSpan _expires;
    private readonly SigningCredentials _signingCredentials;

    public JwtTokenFactory(IConfiguration configuration, IWebHostEnvironment environment)
    {
        _issuer   = configuration["Jwt:Issuer"]   ?? "saint-auth";
        _audience = configuration["Jwt:Audience"] ?? "saint-app";
        var hours = double.TryParse(configuration["Jwt:ExpiresHours"], out var h) ? h : 8;
        _expires = TimeSpan.FromHours(hours);
        var privateRelative = configuration["Jwt:PrivateKeyPath"]
            ?? throw new InvalidOperationException("Jwt:PrivateKeyPath not configured.");

        string privatePath;
        if (Path.IsPathRooted(privateRelative))
        {
            privatePath = privateRelative;
        }
        else
        {
            privatePath = Path.GetFullPath(Path.Combine(environment.ContentRootPath, "..", "..", "..", privateRelative));
        }

        if (!File.Exists(privatePath))
            throw new FileNotFoundException($"Private key not found: {privatePath}");

        var privatePem = File.ReadAllText(privatePath);

        var rsa = RSA.Create();
        rsa.ImportFromPem(privatePem);

        _signingCredentials = new SigningCredentials(new RsaSecurityKey(rsa), SecurityAlgorithms.RsaSha256);
    }

    public UserSessionDto Create(UserEntity user, IReadOnlyList<string> permissions)
    {
        var now = DateTime.UtcNow;
        var expires = now.Add(_expires);

        var claims = new List<Claim>
        {
            new Claim(JwtRegisteredClaimNames.Sub, user.UserName),
            new Claim(JwtRegisteredClaimNames.Name, user.FullName ?? user.UserName),
            new Claim("active", (user.Active == 1).ToString().ToLowerInvariant()),
            new Claim("profile", user.Profile ?? string.Empty),
            new Claim("permissions", string.Join(",", permissions))
        };

        var jwt = new JwtSecurityToken(
            issuer: _issuer,
            audience: _audience,
            claims: claims,
            notBefore: now,
            expires: expires,
            signingCredentials: _signingCredentials);

        var handler = new JwtSecurityTokenHandler();
        var token = handler.WriteToken(jwt);

        return new UserSessionDto
        {
            Token = token,
            ExpiresAt = expires,
            UserName = user.UserName,
            FullName = user.FullName ?? string.Empty,
            Profile = user.Profile ?? string.Empty,
            Active = user.Active == 1,
            Permissions = permissions
        };
    }
}
