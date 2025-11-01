using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Saint.Licensing.Infrastructure.Persistence;
using Saint.Licensing.Infrastructure.Services;

namespace Saint.Licensing.Infrastructure;

public static class DependencyInjection
{
    public static IServiceCollection AddLicensingInfrastructure(this IServiceCollection services, IConfiguration configuration)
    {
        services.AddDbContext<LicensingDbContext>(options =>
            options.UseSqlServer(configuration.GetConnectionString("Default")));

        services.AddScoped<LicenseService>();
        services.AddSingleton<LicenseJwtFactory>();
        return services;
    }
}
