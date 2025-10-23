using Saint.SharedContracts.Auth;

namespace Saint.Auth.Application.Interfaces;

public interface IUserRepository
{
    Task<UserSessionDto?> LoginAsync(LoginRequestDto request);
}