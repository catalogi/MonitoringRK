using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ASK_Core.Migrations
{
    public partial class initialrk3 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Testkey_Keterangan_KeteranganId",
                table: "Testkey");

            migrationBuilder.DropForeignKey(
                name: "FK_Testkey_Unit_UnitId",
                table: "Testkey");

            migrationBuilder.DropIndex(
                name: "IX_Testkey_KeteranganId",
                table: "Testkey");

            migrationBuilder.DropIndex(
                name: "IX_Testkey_UnitId",
                table: "Testkey");

            migrationBuilder.DropColumn(
                name: "KeteranganId",
                table: "Testkey");

            migrationBuilder.DropColumn(
                name: "UnitId",
                table: "Testkey");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "KeteranganId",
                table: "Testkey",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "UnitId",
                table: "Testkey",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Testkey_KeteranganId",
                table: "Testkey",
                column: "KeteranganId");

            migrationBuilder.CreateIndex(
                name: "IX_Testkey_UnitId",
                table: "Testkey",
                column: "UnitId");

            migrationBuilder.AddForeignKey(
                name: "FK_Testkey_Keterangan_KeteranganId",
                table: "Testkey",
                column: "KeteranganId",
                principalTable: "Keterangan",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Testkey_Unit_UnitId",
                table: "Testkey",
                column: "UnitId",
                principalTable: "Unit",
                principalColumn: "Id");
        }
    }
}
