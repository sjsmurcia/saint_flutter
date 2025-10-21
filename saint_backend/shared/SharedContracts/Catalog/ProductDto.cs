using System;

namespace Saint.SharedContracts.Catalog;

public class ProductDto
{
    public string Id { get; set; } = null!;
    public string? Sku { get; set; }
    public string Name { get; set; } = null!;
    public string? Description { get; set; }
    public string? Unit { get; set; }
    public decimal Price { get; set; }
    public decimal Cost { get; set; }
    public bool IsActive { get; set; }
    public DateTime UpdatedAt { get; set; }
}
