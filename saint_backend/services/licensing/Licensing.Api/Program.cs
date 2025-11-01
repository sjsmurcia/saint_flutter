using System.Security.Cryptography;
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
var fullPublicPath = ResolvePath(builder.Environment.ContentRootPath, publicKeyPath);

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

static string ResolvePath(string basePath, string configuredPath)
{
    if (string.IsNullOrWhiteSpace(configuredPath))
        throw new InvalidOperationException("LicenseJwt path configuration is missing.");

    if (Path.IsPathRooted(configuredPath))
        return configuredPath;

    var segments = configuredPath
        .Split(new[] { '/', '\\' }, StringSplitOptions.RemoveEmptyEntries);

    var parts = new List<string> { basePath, "..", "..", ".." };
    parts.AddRange(segments);

    return Path.GetFullPath(Path.Combine(parts.ToArray()));
}
