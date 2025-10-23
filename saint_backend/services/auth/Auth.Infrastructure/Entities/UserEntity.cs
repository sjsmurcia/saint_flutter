using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Saint.Auth.Infrastructure.Entities;

[Table("SSUSRS")]
public class UserEntity
{
    [Key]
    public int Id { get; set; }

    [Column("CodUsua"), MaxLength(10)]
    public string UserName { get; set; } = null!;

    [Column("Descrip"), MaxLength(50)]
    public string FullName { get; set; } = null!;

    [Column("Email"), MaxLength(50)]
    public string? Email { get; set; }

    [Column("Movil"), MaxLength(15)]
    public string? Mobile { get; set; }

    [Column("Level")]
    public int Level { get; set; }

    [Column("Activo")]
    public short Active { get; set; }

    [Column("Password"), MaxLength(100)]
    public string? Password { get; set; }

    [Column("IdUserNot")]
    public int NotificationUserId { get; set; }

    [Column("Profile"), MaxLength(50)]
    public string? Profile { get; set; }

    [Column("CodVend"), MaxLength(15)]
    public string? VendorCode { get; set; }

    [Column("SData1"), MaxLength(250)]
    public string SData1 { get; set; } = string.Empty;

    [Column("SData2"), MaxLength(250)]
    public string SData2 { get; set; } = string.Empty;

    [Column("SData3"), MaxLength(250)]
    public string SData3 { get; set; } = string.Empty;

    [Column("CreatedAt")]
    public DateTime? CreatedAt { get; set; }

    [Column("UpdatedAt")]
    public DateTime? UpdatedAt { get; set; }
}
