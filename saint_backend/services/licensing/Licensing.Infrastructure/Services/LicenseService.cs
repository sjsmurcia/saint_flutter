using Microsoft.EntityFrameworkCore;
using Saint.Licensing.Infrastructure.Entities;
using Saint.Licensing.Infrastructure.Persistence;

namespace Saint.Licensing.Infrastructure.Services;

public class LicenseService
{
    private readonly LicensingDbContext _db;
    private readonly LicenseJwtFactory _jwtFactory;

    public LicenseService(LicensingDbContext db, LicenseJwtFactory jwtFactory)
    {
        _db = db;
        _jwtFactory = jwtFactory;
    }

    public async Task<(string token, DateTime expiresAt)> ActivateAsync(string licenseKey, string fingerprint)
    {
        var license = await _db.Licenses.FirstOrDefaultAsync(x => x.LicenseKey == licenseKey)
                      ?? throw new InvalidOperationException("License not found.");

        var activation = await _db.LicenseActivations
            .FirstOrDefaultAsync(x => x.LicenseId == license.Id && x.DeviceFingerprint == fingerprint);

        if (activation == null)
        {
            activation = new LicenseActivationEntity
            {
                Id = Guid.NewGuid(),
                LicenseId = license.Id,
                DeviceFingerprint = fingerprint
            };
            _db.LicenseActivations.Add(activation);
        }

        var result = _jwtFactory.CreateToken(license, activation);
        activation.CurrentToken = result.token;
        activation.LastCheckIn = DateTime.UtcNow;
        activation.ExpiresAt = result.expiresAt;

        await _db.SaveChangesAsync();
        return result;
    }

    public async Task<(string token, DateTime expiresAt)> CheckInAsync(string activationId, string fingerprint)
    {
        if (!Guid.TryParse(activationId, out var activationGuid))
            throw new InvalidOperationException("Invalid activation id.");

        var activation = await _db.LicenseActivations
            .Include(x => x.License)
            .FirstOrDefaultAsync(x => x.Id == activationGuid)
            ?? throw new InvalidOperationException("Activation not found.");

        if (!string.Equals(activation.DeviceFingerprint, fingerprint, StringComparison.OrdinalIgnoreCase))
            throw new InvalidOperationException("Device mismatch.");

        var result = _jwtFactory.CreateToken(activation.License, activation);
        activation.CurrentToken = result.token;
        activation.LastCheckIn = DateTime.UtcNow;
        activation.ExpiresAt = result.expiresAt;

        await _db.SaveChangesAsync();
        return result;
    }
}
