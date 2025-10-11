using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Saint.Catalog.Infrastructure.Entities;
[Table("SACLIE")]
public class ClientEntity
{
    [Key]
    [Column("CodClie")]
    [MaxLength(15)]
    public string Code { get; set; } = null!;

    [Column("Descrip")]
    [MaxLength(60)]
    public string? Name { get; set; }

    [Column("Email")]
    [MaxLength(60)]
    public string? Email { get; set; }

    [Column("Telef")]
    [MaxLength(30)]
    public string? Phone { get; set; }

    [Column("Direc1")]
    [MaxLength(60)]
    public string? Address1 { get; set; }

    [Column("Direc2")]
    [MaxLength(60)]
    public string? Address2 { get; set; }

    [Column("ID3")]
    [MaxLength(25)]
    public string? TaxId { get; set; }

    [Column("TipoCli")]
    public short Type { get; set; }  // 0 = cliente, 1 = proveedor

    [Column("UpdatedAt")]
    public DateTime? UpdatedAt { get; set; }
}
