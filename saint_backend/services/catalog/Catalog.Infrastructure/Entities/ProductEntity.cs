using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Saint.Catalog.Infrastructure.Entities;

[Table("SAPROD")]
public class ProductEntity
{
    [Key]
    public int Id { get; set; }

    [Column("CodProd")]
    [MaxLength(15)]
    public string Code { get; set; } = null!;

    [Column("Descrip")]
    [MaxLength(40)]
    public string? Name { get; set; }

    [Column("Descrip2")]
    [MaxLength(40)]
    public string? Description2 { get; set; }

    [Column("Refere")]
    [MaxLength(15)]
    public string? Reference { get; set; }

    [Column("Unidad")]
    [MaxLength(3)]
    public string? Unit { get; set; }

    [Column("Precio1")]
    public decimal Price1 { get; set; }

    [Column("CostAct")]
    public decimal Cost { get; set; }

    [Column("Activo")]
    public short ActiveFlag { get; set; }

    [Column("UpdatedAt")]
    public DateTime? UpdatedAt { get; set; }
}
