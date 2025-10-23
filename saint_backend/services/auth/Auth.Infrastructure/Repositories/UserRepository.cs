using Microsoft.EntityFrameworkCore;
using Saint.Auth.Application.Interfaces;
using Saint.Auth.Infrastructure.Entities;
using Saint.Auth.Infrastructure.Security;
using Saint.SharedContracts.Auth;
using System.Security.Cryptography;
using System.Text;

namespace Saint.Auth.Infrastructure.Repositories;

public class UserRepository : IUserRepository
{
    private readonly AuthDbContext _db;
    private readonly JwtTokenFactory _tokenFactory;

    public UserRepository(AuthDbContext db, JwtTokenFactory tokenFactory)
    {
        _db = db;
        _tokenFactory = tokenFactory;
    }


    public async Task<UserSessionDto?> LoginAsync(LoginRequestDto request)
    {
        var user = await _db.Users.AsNoTracking()
            .FirstOrDefaultAsync(u => u.UserName == request.UserName);

        if (user is null || !VerifyPassword(request.Password, user.Password))
        {
            return null;
        }

        var permissions = ParsePermissions(user.SData1, user.SData2, user.SData3);
        return _tokenFactory.Create(user, permissions);

    }

    private static bool VerifyPassword(string plain, string? stored)
    {
        if (string.IsNullOrEmpty(plain) || string.IsNullOrEmpty(stored))
            return false;

        using var sha = SHA256.Create();
        var bytes = Encoding.UTF8.GetBytes(plain);
        var hash = sha.ComputeHash(bytes);
        var hex = Convert.ToHexString(hash).ToLowerInvariant();
        return string.Equals(hex, stored.ToLowerInvariant(), StringComparison.Ordinal);
    }

    private static IReadOnlyList<string> ParsePermissions(string data1, string data2, string data3)
    {
        var values = new List<string>();
        if (!string.IsNullOrWhiteSpace(data1)) values.Add(data1);
        if (!string.IsNullOrWhiteSpace(data2)) values.Add(data2);
        if (!string.IsNullOrWhiteSpace(data3)) values.Add(data3);
        return values;
    }
}
