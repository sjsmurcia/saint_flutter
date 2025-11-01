namespace Saint.Licensing.Infrastructure.Entities;

public class LicenseActivationEntity
{
    public Guid Id { get; set; }
    public Guid LicenseId { get; set; }
    public string DeviceFingerprint { get; set; } = null!;
    public string CurrentToken { get; set; } = null!;
    public DateTime LastCheckIn { get; set; }
    public DateTime ExpiresAt { get; set; }
    public LicenseEntity License { get; set; } = null!;
}