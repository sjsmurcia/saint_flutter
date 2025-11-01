using Microsoft.AspNetCore.Mvc;
using Saint.Licensing.Api.Models;
using Saint.Licensing.Infrastructure.Services;

namespace Saint.Licensing.Api.Controllers;

[ApiController]
[Route("licenses")]
public class LicensesController : ControllerBase
{
    private readonly LicenseService _service;

    public LicensesController(LicenseService service) => _service = service;

    [HttpPost("activate")]
    public async Task<ActionResult<LicenseTokenResponse>> Activate([FromBody] ActivateLicenseRequest request)
    {
        try
        {
            var result = await _service.ActivateAsync(request.LicenseKey, request.DeviceFingerprint);
            return Ok(new LicenseTokenResponse(result.token, result.expiresAt));
        }
        catch (Exception ex)
        {
            return BadRequest(new { title = "Activation failed", detail = ex.Message });
        }
    }

    [HttpPost("checkin")]
    public async Task<ActionResult<LicenseTokenResponse>> CheckIn([FromBody] CheckInRequest request)
    {
        try
        {
            var result = await _service.CheckInAsync(request.ActivationId, request.DeviceFingerprint);
            return Ok(new LicenseTokenResponse(result.token, result.expiresAt));
        }
        catch (Exception ex)
        {
            return BadRequest(new { title = "Check-in failed", detail = ex.Message });
        }
    }
}
