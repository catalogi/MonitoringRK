using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ASK_Core.Migrations
{
    public partial class initialrk2 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "TanggalTestkey",
                table: "Testkey",
                newName: "Tanggal");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Tanggal",
                table: "Testkey",
                newName: "TanggalTestkey");
        }
    }
}
