using Saint.SharedContracts.Catalog;

namespace Saint.Catalog.Application.Interfaces;

public interface IProductRepository
{
    Task<IReadOnlyList<ProductDto>> GetProductsAsync(DateTime? updatedAfter, int page, int pageSize);
    Task<ProductDto?> GetByCodeAsync(string code);
    Task UpsertAsync(ProductDto dto);
}
