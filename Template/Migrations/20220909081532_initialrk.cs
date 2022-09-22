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

            
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
           

            migrationBuilder.RenameColumn(
                name: "TanggalTestkey",
                table: "Testkey",
                newName: "TanggalTestKey");
        }
    }
}
