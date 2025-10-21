using Microsoft.EntityFrameworkCore;
using Saint.Catalog.Application.Interfaces;
using Saint.Catalog.Infrastructure.Entities;
using Saint.SharedContracts.Catalog;

namespace Saint.Catalog.Infrastructure.Repositories;

public class ProductRepository : IProductRepository
{
    private readonly CatalogDbContext _db;

    public ProductRepository(CatalogDbContext db) => _db = db;

    public async Task<IReadOnlyList<ProductDto>> GetProductsAsync(DateTime? updatedAfter, int page, int pageSize)
    {
        var query = _db.Products.AsNoTracking();

        if (updatedAfter.HasValue)
        {
            var timestamp = updatedAfter.Value;
            query = query.Where(p => p.UpdatedAt >= timestamp);
        }

        var skip = (page - 1) * pageSize;

        return await query
            .OrderBy(p => p.Code)
            .Skip(skip)
            .Take(pageSize)
            .Select(p => new ProductDto
            {
                Id = p.Code,
                Sku = p.Reference,
                Name = p.Name ?? string.Empty,
                Description = p.Description2,
                Unit = p.Unit,
                Price = p.Price1,
                Cost = p.Cost,
                IsActive = p.ActiveFlag != 0,
                UpdatedAt = p.UpdatedAt ?? DateTime.UtcNow
            })
            .ToListAsync();
    }

    public async Task<ProductDto?> GetByCodeAsync(string code) =>
        await _db.Products.AsNoTracking()
            .Where(p => p.Code == code)
            .Select(p => new ProductDto
            {
                Id = p.Code,
                Sku = p.Reference,
                Name = p.Name ?? string.Empty,
                Description = p.Description2,
                Unit = p.Unit,
                Price = p.Price1,
                Cost = p.Cost,
                IsActive = p.ActiveFlag != 0,
                UpdatedAt = p.UpdatedAt ?? DateTime.UtcNow
            })
            .FirstOrDefaultAsync();

    public async Task UpsertAsync(ProductDto dto)
    {
        var entity = await _db.Products.FirstOrDefaultAsync(p => p.Code == dto.Id);

        if (entity == null)
        {
            entity = new ProductEntity
            {
                Code = dto.Id
            };
            _db.Products.Add(entity);
        }

        entity.Name = dto.Name;
        entity.Description2 = dto.Description;
        entity.Reference = dto.Sku;
        entity.Unit = dto.Unit;
        entity.Price1 = dto.Price;
        entity.Cost = dto.Cost;
        entity.ActiveFlag = dto.IsActive ? (short)1 : (short)0;
        entity.UpdatedAt = DateTime.UtcNow;

        await _db.SaveChangesAsync();
    }
}
