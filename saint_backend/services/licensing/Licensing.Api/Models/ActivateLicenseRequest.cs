namespace Saint.Licensing.Api.Models;

public record ActivateLicenseRequest(string LicenseKey, string DeviceFingerprint);