using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ASK_Core.Migrations
{
    public partial class histori_datatoken : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_DataToken_Modul_ModulId",
                table: "DataToken");

            migrationBuilder.DropForeignKey(
                name: "FK_T_Kliring_Surat_SuratId",
                table: "T_Kliring");

            migrationBuilder.DropIndex(
                name: "IX_T_Kliring_SuratId",
                table: "T_Kliring");

            migrationBuilder.DropColumn(
                name: "SuratId",
                table: "T_Kliring");

            migrationBuilder.AlterColumn<int>(
                name: "ModulId",
                table: "DataToken",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AddForeignKey(
                name: "FK_DataToken_Modul_ModulId",
                table: "DataToken",
                column: "ModulId",
                principalTable: "Modul",
                principalColumn: "Id");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_DataToken_Modul_ModulId",
                table: "DataToken");

            migrationBuilder.AddColumn<int>(
                name: "SuratId",
                table: "T_Kliring",
                type: "int",
                nullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "ModulId",
                table: "DataToken",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_T_Kliring_SuratId",
                table: "T_Kliring",
                column: "SuratId");

            migrationBuilder.AddForeignKey(
                name: "FK_DataToken_Modul_ModulId",
                table: "DataToken",
                column: "ModulId",
                principalTable: "Modul",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_T_Kliring_Surat_SuratId",
                table: "T_Kliring",
                column: "SuratId",
                principalTable: "Surat",
                principalColumn: "Id");
        }
    }
}
