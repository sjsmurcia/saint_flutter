using System.Collections.Generic;
using System.IO;
using System.Security.Cryptography;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using Saint.Catalog.Infrastructure;
using Saint.SharedKernel.Middleware;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(options =>
{
    options.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
    {
        Type = SecuritySchemeType.Http,
        Scheme = "bearer",
        BearerFormat = "JWT",
        In = ParameterLocation.Header,
        Name = "Authorization",
        Description = "Bearer token del usuario"
    });

    options.AddSecurityDefinition("LicenseToken", new OpenApiSecurityScheme
    {
        Type = SecuritySchemeType.ApiKey,
        In = ParameterLocation.Header,
        Name = "X-License-Token",
        Description = "Token de licencia vigente"
    });

    options.AddSecurityRequirement(new OpenApiSecurityRequirement
    {
        {
            new OpenApiSecurityScheme
            {
                Reference = new OpenApiReference
                {
                    Type = ReferenceType.SecurityScheme,
                    Id = "Bearer"
                }
            },
            Array.Empty<string>()
        },
        {
            new OpenApiSecurityScheme
            {
                Reference = new OpenApiReference
                {
                    Type = ReferenceType.SecurityScheme,
                    Id = "LicenseToken"
                }
            },
            Array.Empty<string>()
        }
    });
});

builder.Services.AddCatalogInfrastructure(builder.Configuration);

var authValidationParameters = BuildTokenValidationParameters(
    builder.Environment.ContentRootPath,
    builder.Configuration,
    sectionName: "AuthJwt",
    defaultPublicKeyPath: "shared/Secrets/auth_public.pem",
    defaultIssuer: "saint-auth",
    defaultAudience: "saint-app");

builder.Services
    .AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
    .AddJwtBearer(options =>
    {
        options.TokenValidationParameters = authValidationParameters;
    });

builder.Services.AddAuthorization();

var app = builder.Build();

app.UseMiddleware<LicenseValidationMiddleware>();

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

static TokenValidationParameters BuildTokenValidationParameters(
    string basePath,
    IConfiguration configuration,
    string sectionName,
    string defaultPublicKeyPath,
    string defaultIssuer,
    string defaultAudience)
{
    var section = configuration.GetSection(sectionName);
    var issuer = section["Issuer"] ?? defaultIssuer;
    var audience = section["Audience"] ?? defaultAudience;
    var publicKeyPath = section["PublicKeyPath"] ?? defaultPublicKeyPath;
    var fullPath = ResolvePath(basePath, publicKeyPath);

    if (!File.Exists(fullPath))
        throw new FileNotFoundException($"Public key not found for {sectionName}: {fullPath}");

    var pem = File.ReadAllText(fullPath);
    var rsa = RSA.Create();
    rsa.ImportFromPem(pem);

    return new TokenValidationParameters
    {
        ValidateIssuer = true,
        ValidateAudience = true,
        ValidateLifetime = true,
        ValidIssuer = issuer,
        ValidAudience = audience,
        IssuerSigningKey = new RsaSecurityKey(rsa)
    };
}

static string ResolvePath(string basePath, string configuredPath)
{
    if (string.IsNullOrWhiteSpace(configuredPath))
        throw new InvalidOperationException("JWT public key path not configured.");

    if (Path.IsPathRooted(configuredPath))
        return configuredPath;

    var segments = configuredPath
        .Split(new[] { '/', '\\' }, StringSplitOptions.RemoveEmptyEntries);

    var parts = new List<string> { basePath, "..", "..", ".." };
    parts.AddRange(segments);

    return Path.GetFullPath(Path.Combine(parts.ToArray()));
}
