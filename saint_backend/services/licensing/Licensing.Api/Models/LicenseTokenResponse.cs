namespace Saint.Licensing.Api.Models;

public record LicenseTokenResponse(string Token, DateTime ExpiresAt);