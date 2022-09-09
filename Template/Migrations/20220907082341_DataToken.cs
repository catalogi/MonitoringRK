using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ASK_Core.Migrations
{
    public partial class DataToken : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Deletedate",
                table: "Unit");

            migrationBuilder.DropColumn(
                name: "Deletedate",
                table: "Testkey");

            migrationBuilder.DropColumn(
                name: "Deletedate",
                table: "T_RTGS");

            migrationBuilder.DropColumn(
                name: "Deletedate",
                table: "T_Kliring");

            migrationBuilder.DropColumn(
                name: "Deletedate",
                table: "Kelompok");

            migrationBuilder.AddColumn<int>(
                name: "kategori",
                table: "Kelompok",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateTable(
                name: "Modul",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nama = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Modul", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "DataToken",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    KelompokId = table.Column<int>(type: "int", nullable: false),
                    ModulId = table.Column<int>(type: "int", nullable: false),
                    NPP = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    UserId = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Nama = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Group = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ApprovalLimit = table.Column<decimal>(type: "decimal(18,2)", nullable: true),
                    UserIdToken = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    TokenExpired = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Keterangan = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Createdate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    Updatedate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_DataToken", x => x.Id);
                    table.ForeignKey(
                        name: "FK_DataToken_Kelompok_KelompokId",
                        column: x => x.KelompokId,
                        principalTable: "Kelompok",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_DataToken_Modul_ModulId",
                        column: x => x.ModulId,
                        principalTable: "Modul",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_DataToken_KelompokId",
                table: "DataToken",
                column: "KelompokId");

            migrationBuilder.CreateIndex(
                name: "IX_DataToken_ModulId",
                table: "DataToken",
                column: "ModulId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "DataToken");

            migrationBuilder.DropTable(
                name: "Modul");

            migrationBuilder.DropColumn(
                name: "kategori",
                table: "Kelompok");

            migrationBuilder.AddColumn<DateTime>(
                name: "Deletedate",
                table: "Unit",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "Deletedate",
                table: "Testkey",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "Deletedate",
                table: "T_RTGS",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "Deletedate",
                table: "T_Kliring",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "Deletedate",
                table: "Kelompok",
                type: "datetime2",
                nullable: true);
        }
    }
}
