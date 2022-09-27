using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ASK_Core.Migrations
{
    public partial class InitialRtg : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "path",
                table: "T_RTGS",
                newName: "Path");

            migrationBuilder.RenameColumn(
                name: "Tanggal",
                table: "T_RTGS",
                newName: "TanggalTestkey");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Path",
                table: "T_RTGS",
                newName: "path");

            migrationBuilder.RenameColumn(
                name: "TanggalTestkey",
                table: "T_RTGS",
                newName: "Tanggal");
        }
    }
}
