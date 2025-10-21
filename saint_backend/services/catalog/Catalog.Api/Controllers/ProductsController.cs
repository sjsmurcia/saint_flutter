using Microsoft.AspNetCore.Mvc;
using Saint.Catalog.Application.Interfaces;
using Saint.SharedContracts.Catalog;

namespace Saint.Catalog.Api.Controllers;

[ApiController]
[Route("catalog/products")]
public class ProductsController : ControllerBase
{
    private readonly IProductRepository _repository;

    public ProductsController(IProductRepository repository) => _repository = repository;

    [HttpGet]
    public async Task<ActionResult<IEnumerable<ProductDto>>> Get(
        [FromQuery] DateTime? updatedAfter,
        [FromQuery] int page = 1,
        [FromQuery] int pageSize = 50)
    {
        var items = await _repository.GetProductsAsync(updatedAfter, page, pageSize);
        return Ok(items);
    }

    [HttpGet("{code}")]
    public async Task<ActionResult<ProductDto>> GetByCode(string code)
    {
        var dto = await _repository.GetByCodeAsync(code);
        return dto is null ? NotFound() : Ok(dto);
    }

    [HttpPost]
    public async Task<IActionResult> Upsert([FromBody] ProductDto dto)
    {
        await _repository.UpsertAsync(dto);
        return NoContent();
    }
}
