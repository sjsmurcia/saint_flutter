namespace Saint.SharedContracts.Auth;

public class UserSessionDto
{
    public string Token { get; set; } = null!;
    public DateTime ExpiresAt { get; set; }
    public string UserName { get; set; } = null!;
    public string FullName { get; set; } = null!;
    public string Profile { get; set; } = string.Empty; // usa Profile o Level
    public bool Active { get; set; }
    public IReadOnlyList<string> Permissions { get; set; } = Array.Empty<string>();
}