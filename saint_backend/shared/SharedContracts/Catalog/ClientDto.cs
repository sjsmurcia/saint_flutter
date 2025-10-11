namespace Saint.SharedContracts.Catalog;

public class ClientDto
{
    public string Id { get; set; } = null!;
    public string Type { get; set; } = null!; // "customer" o "supplier"
    public string Name { get; set; } = null!;
    public string? Email { get; set; }
    public string? Phone { get; set; }
    public string? Address { get; set; }
    public string? TaxId { get; set; }
    public DateTime UpdatedAt { get; set; }
}
