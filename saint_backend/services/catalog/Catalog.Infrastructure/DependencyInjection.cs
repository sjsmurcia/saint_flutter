using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Saint.Catalog.Application.Interfaces;
using Saint.Catalog.Infrastructure.Repositories;

namespace Saint.Catalog.Infrastructure;

public static class DependencyInjection
{
    public static IServiceCollection AddCatalogInfrastructure(
        this IServiceCollection services,
        IConfiguration configuration)
    {
        services.AddDbContext<CatalogDbContext>(options =>
            options.UseSqlServer(configuration.GetConnectionString("Default")));

        services.AddScoped<IClientRepository, ClientRepository>();

        return services;
    }
}
