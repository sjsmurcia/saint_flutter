using Microsoft.EntityFrameworkCore;
using Saint.Catalog.Infrastructure.Entities;

namespace Saint.Catalog.Infrastructure;

public class CatalogDbContext : DbContext
{
    public CatalogDbContext(DbContextOptions<CatalogDbContext> options)
        : base(options)
    {
    }

    public DbSet<ClientEntity> Clients => Set<ClientEntity>();

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        // Índice por código para acceso rápido desde móvil/backend
        modelBuilder.Entity<ClientEntity>()
            .HasIndex(c => c.Code)
            .IsUnique();
    }
}
