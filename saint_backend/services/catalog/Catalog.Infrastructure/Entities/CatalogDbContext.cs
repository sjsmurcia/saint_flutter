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
    public DbSet<ProductEntity> Products => Set<ProductEntity>();

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        // Índice por código para acceso rápido desde móvil/backend
        modelBuilder.Entity<ClientEntity>()
            .HasIndex(c => c.Code)
            .IsUnique();

        modelBuilder.Entity<ProductEntity>()
            .HasIndex(p => p.Code)
            .IsUnique();
    }
}
