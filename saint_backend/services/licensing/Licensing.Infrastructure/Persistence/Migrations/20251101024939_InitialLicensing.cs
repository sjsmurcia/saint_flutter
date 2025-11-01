using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Saint.Licensing.Infrastructure.Persistence.Migrations
{
    /// <inheritdoc />
    public partial class InitialLicensing : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Licenses",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    LicenseKey = table.Column<string>(type: "nvarchar(64)", maxLength: 64, nullable: false),
                    Plan = table.Column<string>(type: "nvarchar(32)", maxLength: 32, nullable: false),
                    Entitlements = table.Column<string>(type: "nvarchar(512)", maxLength: 512, nullable: true),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    ExpiresAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Licenses", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "LicenseActivations",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    LicenseId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    DeviceFingerprint = table.Column<string>(type: "nvarchar(128)", maxLength: 128, nullable: false),
                    CurrentToken = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    LastCheckIn = table.Column<DateTime>(type: "datetime2", nullable: false),
                    ExpiresAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_LicenseActivations", x => x.Id);
                    table.ForeignKey(
                        name: "FK_LicenseActivations_Licenses_LicenseId",
                        column: x => x.LicenseId,
                        principalTable: "Licenses",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_LicenseActivations_LicenseId_DeviceFingerprint",
                table: "LicenseActivations",
                columns: new[] { "LicenseId", "DeviceFingerprint" },
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Licenses_LicenseKey",
                table: "Licenses",
                column: "LicenseKey",
                unique: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "LicenseActivations");

            migrationBuilder.DropTable(
                name: "Licenses");
        }
    }
}
