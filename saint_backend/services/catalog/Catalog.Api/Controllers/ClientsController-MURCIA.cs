using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Saint.Catalog.Application.Interfaces;
using Saint.SharedContracts.Catalog;

namespace Saint.Catalog.Api.Controllers;

[ApiController]
[Route("catalog/clients")]
[Authorize]
public class ClientsController : ControllerBase
{
    private readonly IClientRepository _repository;

    public ClientsController(IClientRepository repository) =>
        _repository = repository;

    [HttpGet]
    public async Task<ActionResult<IEnumerable<ClientDto>>> Get(
        [FromQuery] DateTime? updatedAfter,
        [FromQuery] int page = 1,
        [FromQuery] int pageSize = 50)
    {
        var items = await _repository.GetClientsAsync(updatedAfter, page, pageSize);
        return Ok(items);
    }

    [HttpGet("{code}")]
    public async Task<ActionResult<ClientDto>> GetByCode(string code)
    {
        var dto = await _repository.GetByCodeAsync(code);
        return dto is null ? NotFound() : Ok(dto);
    }

    [HttpPost]
    public async Task<IActionResult> Upsert([FromBody] ClientDto dto)
    {
        await _repository.UpsertAsync(dto);
        return NoContent();
    }
}
