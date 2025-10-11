using System;
using Microsoft.OpenApi.Models;
using Saint.Catalog.Infrastructure;
using Saint.SharedKernel.Middleware;



var builder = WebApplication.CreateBuilder(args);

// 2. Registrar los servicios necesarios para controladores y Swagger
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
// 3. Registrar la infraestructura personalizada
builder.Services.AddCatalogInfrastructure(builder.Configuration);

var app = builder.Build();
app.UseMiddleware<LicenseValidationMiddleware>();
// 4. Configurar el middleware de la aplicación
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}
// 5. Agrega el middleare de autorizacion y mapea los controladores
app.UseAuthentication();
app.MapControllers();
app.Run();
