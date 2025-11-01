namespace Saint.Licensing.Infrastructure.Entities;

public class LicenseEntity
{
    public Guid Id { get; set; }
    public string LicenseKey { get; set; } = null!;
    public string Plan { get; set; } = null!;
    public string? EntitlementsRaw { get; set; }
    public DateTime CreatedAt { get; set; }
    public DateTime ExpiresAt { get; set; }

    public IReadOnlyCollection<string> Entitlements =>
        string.IsNullOrWhiteSpace(EntitlementsRaw)
            ? Array.Empty<string>()
            : EntitlementsRaw.Split(',', StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries);
}