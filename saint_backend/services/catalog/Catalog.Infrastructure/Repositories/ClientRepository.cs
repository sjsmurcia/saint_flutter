using System;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using Saint.Catalog.Application.Interfaces;
using Saint.Catalog.Infrastructure.Entities;
using Saint.SharedContracts.Catalog;

namespace Saint.Catalog.Infrastructure.Repositories;

public class ClientRepository : IClientRepository
{
    private readonly CatalogDbContext _db;

    public ClientRepository(CatalogDbContext db) => _db = db;

    public async Task<IReadOnlyList<ClientDto>> GetClientsAsync(DateTime? updatedAfter, int page, int pageSize)
    {
        var query = _db.Clients.AsNoTracking();

        if (updatedAfter.HasValue)
        {
            var timestamp = updatedAfter.Value;
            query = query.Where(c => c.UpdatedAt >= timestamp);
        }

        var skip = (page - 1) * pageSize;

        var paged = query
            .OrderBy(c => c.Code)
            .Skip(skip)
            .Take(pageSize);

        var sql = paged.ToQueryString();
        Console.WriteLine(sql);

        var entities = await paged.ToListAsync();

        return entities.Select(c => new ClientDto
        {
            Id = c.Code,
            Type = c.Type == 1 ? "supplier" : "customer",
            Name = c.Name ?? string.Empty,
            Email = c.Email,
            Phone = c.Phone,
            Address = string.Join(" ", new[] { c.Address1, c.Address2 }.Where(s => !string.IsNullOrWhiteSpace(s))),
            TaxId = c.TaxId,
            UpdatedAt = c.UpdatedAt ?? DateTime.UtcNow
        }).ToList();
    }

    public async Task<ClientDto?> GetByCodeAsync(string code)
    {
        var entity = await _db.Clients.AsNoTracking()
        .FirstOrDefaultAsync(c => c.Code == code);
        if (entity == null) { return null; }
        return new ClientDto
        {
            Id = entity.Code,
            Type = entity.Type == 1 ? "supplier" : "customer",
            Name = entity.Name ?? string.Empty,
            Email = entity.Email,
            Phone = entity.Phone,
            Address = string.Join(" ", new[] { entity.Address1, entity.Address2 }.Where(s => !string.IsNullOrWhiteSpace(s))),
            TaxId = entity.TaxId,
            UpdatedAt = entity.UpdatedAt ?? DateTime.UtcNow
        };

    }
    public async Task UpsertAsync(ClientDto dto)
    {
        var entity = await _db.Clients.FirstOrDefaultAsync(c => c.Code == dto.Id);

        if (entity == null)
        {
            entity = new ClientEntity { Code = dto.Id };
            _db.Clients.Add(entity);
        }

        entity.Name = dto.Name;
        entity.Email = dto.Email;
        entity.Phone = dto.Phone;
        entity.Address1 = dto.Address;
        entity.Address2 = null;
        entity.TaxId = dto.TaxId;
        entity.Type = dto.Type == "supplier" ? (short)1 : (short)0;
        entity.UpdatedAt = DateTime.UtcNow;

        await _db.SaveChangesAsync();
    }
}
