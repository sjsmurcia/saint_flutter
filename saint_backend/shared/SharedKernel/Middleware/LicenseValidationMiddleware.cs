using System;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Primitives;

namespace Saint.SharedKernel.Middleware;

public class LicenseValidationMiddleware
{
    private readonly RequestDelegate _next;

    public LicenseValidationMiddleware(RequestDelegate next) => _next = next;

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
            context.Response.StatusCode = StatusCodes.Status401Unauthorized;
            context.Response.ContentType = "text/plain";
            await context.Response.WriteAsync("Missing Authorization header.");
            return;
        }

        if (!context.Request.Headers.TryGetValue("X-License-Token", out var licenseToken) ||
            StringValues.IsNullOrEmpty(licenseToken))
        {
            context.Response.StatusCode = StatusCodes.Status401Unauthorized;
            context.Response.ContentType = "text/plain";
            await context.Response.WriteAsync("Missing X-License-Token header.");
            return;
        }

        await _next(context);
    }
}
