using Saint.SharedContracts.Catalog;

namespace Saint.Catalog.Application.Interfaces;

public interface IClientRepository
{
    Task<IReadOnlyList<ClientDto>> GetClientsAsync(DateTime? updatedAfter, int page, int pageSize);
    Task<ClientDto?> GetByCodeAsync(string code);
    Task UpsertAsync(ClientDto dto);
}
