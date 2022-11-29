using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ASK_Core.Migrations
{
    public partial class dataSOR : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Bor",
                table: "T_RTGS",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "SOR",
                table: "T_Kliring",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "SORLain",
                table: "T_Kliring",
                type: "nvarchar(max)",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Bor",
                table: "T_RTGS");

            migrationBuilder.DropColumn(
                name: "SOR",
                table: "T_Kliring");

            migrationBuilder.DropColumn(
                name: "SORLain",
                table: "T_Kliring");
        }
    }
}
