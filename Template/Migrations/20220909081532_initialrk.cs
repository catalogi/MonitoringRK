using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ASK_Core.Migrations
{
    public partial class initialrk : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "TanggalTestKey",
                table: "Testkey",
                newName: "TanggalTestkey");

            migrationBuilder.AddColumn<string>(
                name: "path",
                table: "T_RTGS",
                type: "nvarchar(max)",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "path",
                table: "T_RTGS");

            migrationBuilder.RenameColumn(
                name: "TanggalTestkey",
                table: "Testkey",
                newName: "TanggalTestKey");
        }
    }
}
