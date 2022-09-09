using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ASK_Core.Migrations
{
    public partial class UpdateModelCabang2 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "sandi",
                table: "Cabang",
                newName: "Sandi");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Sandi",
                table: "Cabang",
                newName: "sandi");
        }
    }
}
