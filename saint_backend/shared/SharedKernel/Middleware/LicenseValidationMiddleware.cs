using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.IO;
using System.Security.Cryptography;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Primitives;
using Microsoft.IdentityModel.Tokens;

namespace Saint.SharedKernel.Middleware;

public class LicenseValidationMiddleware
{
    private readonly RequestDelegate _next;
    private readonly JwtSecurityTokenHandler _handler = new();
    private readonly TokenValidationParameters _parameters;

    public LicenseValidationMiddleware(
        RequestDelegate next,
        IConfiguration configuration,
        IHostEnvironment environment)
    {
        _next = next;

        var section = configuration.GetSection("LicenseJwt");
        var issuer = section["Issuer"] ?? "saint-licensing";
        var audience = section["Audience"] ?? "saint-backend";
        var publicKeyPath = section["PublicKeyPath"] ?? "shared/Secrets/license_public.pem";
        var fullPath = ResolvePath(environment.ContentRootPath, publicKeyPath);

        if (!File.Exists(fullPath))
            throw new FileNotFoundException($"License public key not found: {fullPath}");

        var pem = File.ReadAllText(fullPath);
        var rsa = RSA.Create();
        rsa.ImportFromPem(pem);

        _parameters = new TokenValidationParameters
        {
            ValidateIssuer = true,
            ValidateAudience = true,
            ValidateLifetime = true,
            ValidIssuer = issuer,
            ValidAudience = audience,
            IssuerSigningKey = new RsaSecurityKey(rsa)
        };
    }

    public async Task InvokeAsync(HttpContext context)
    {
        if (context.Request.Path.StartsWithSegments("/swagger", StringComparison.OrdinalIgnoreCase) ||
            HttpMethods.IsOptions(context.Request.Method))
        {
            await _next(context);
            return;
        }

        if (!context.Request.Headers.TryGetValue("Authorization", out var authorization) ||
            StringValues.IsNullOrEmpty(authorization))
        {
            await WriteUnauthorizedAsync(context, "Missing Authorization header.");
            return;
        }

        if (!context.Request.Headers.TryGetValue("X-License-Token", out var licenseToken) ||
            StringValues.IsNullOrEmpty(licenseToken))
        {
            await WriteUnauthorizedAsync(context, "Missing X-License-Token header.");
            return;
        }

        try
        {
            var token = licenseToken.ToString();
            _handler.ValidateToken(token, _parameters, out _);
        }
        catch (Exception)
        {
            await WriteUnauthorizedAsync(context, "Invalid license token.");
            return;
        }

        await _next(context);
    }

    private static Task WriteUnauthorizedAsync(HttpContext context, string message)
    {
        context.Response.StatusCode = StatusCodes.Status401Unauthorized;
        context.Response.ContentType = "text/plain";
        return context.Response.WriteAsync(message);
    }

    private static string ResolvePath(string basePath, string configuredPath)
    {
        if (string.IsNullOrWhiteSpace(configuredPath))
            throw new InvalidOperationException("LicenseJwt public key path not configured.");

        if (Path.IsPathRooted(configuredPath))
            return configuredPath;

        var segments = configuredPath
            .Split(new[] { '/', '\\' }, StringSplitOptions.RemoveEmptyEntries);

        var parts = new List<string> { basePath, "..", "..", ".." };
        parts.AddRange(segments);

        return Path.GetFullPath(Path.Combine(parts.ToArray()));
    }
}
