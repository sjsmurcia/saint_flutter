namespace Saint.Licensing.Api.Models;

public record CheckInRequest(string ActivationId, string DeviceFingerprint);