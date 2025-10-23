using Microsoft.AspNetCore.Mvc;
using Saint.Auth.Application.Interfaces;
using Saint.SharedContracts.Auth;

namespace Saint.Auth.Api.Controllers;

[ApiController]
[Route("auth")]
public class AuthController : ControllerBase
{
    private readonly IUserRepository _repository;

    public AuthController(IUserRepository repository) => _repository = repository;

    [HttpPost("login")]
    public async Task<ActionResult<UserSessionDto>> Login([FromBody] LoginRequestDto request)
    {
        var session = await _repository.LoginAsync(request);
        if (session == null)
            return Unauthorized(new { title = "Credenciales inválidas" });

        return Ok(session);
    }
}
