using Microsoft.EntityFrameworkCore;
using Saint.Licensing.Infrastructure.Entities;

namespace Saint.Licensing.Infrastructure.Persistence;

public class LicensingDbContext : DbContext
{
    public LicensingDbContext(DbContextOptions<LicensingDbContext> options) : base(options) { }

    public DbSet<LicenseEntity> Licenses => Set<LicenseEntity>();
    public DbSet<LicenseActivationEntity> LicenseActivations => Set<LicenseActivationEntity>();

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<LicenseEntity>(entity =>
        {
            entity.ToTable("Licenses");
            entity.HasKey(x => x.Id);
            entity.Property(x => x.LicenseKey).HasMaxLength(64).IsRequired();
            entity.Property(x => x.Plan).HasMaxLength(32).IsRequired();
            entity.Property(x => x.EntitlementsRaw).HasColumnName("Entitlements").HasMaxLength(512);
            entity.HasIndex(x => x.LicenseKey).IsUnique();
        });

        modelBuilder.Entity<LicenseActivationEntity>(entity =>
        {
            entity.ToTable("LicenseActivations");
            entity.HasKey(x => x.Id);
            entity.Property(x => x.DeviceFingerprint).HasMaxLength(128).IsRequired();
            entity.HasOne(x => x.License)
                  .WithMany()
                  .HasForeignKey(x => x.LicenseId);
            entity.HasIndex(x => new { x.LicenseId, x.DeviceFingerprint }).IsUnique();
        });
    }
}
