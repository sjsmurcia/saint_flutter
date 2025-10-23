using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Saint.Auth.Application.Interfaces;
using Saint.Auth.Infrastructure.Repositories;
using Saint.Auth.Infrastructure.Security;

namespace Saint.Auth.Infrastructure;

public static class DependencyInjection
{
    public static IServiceCollection AddAuthInfrastructure(this IServiceCollection services, IConfiguration configuration)
    {
        services.AddDbContext<AuthDbContext>(options =>
            options.UseSqlServer(configuration.GetConnectionString("Default")));

        services.AddSingleton<JwtTokenFactory>();
        services.AddScoped<IUserRepository, UserRepository>();
        return services;
    }
}
