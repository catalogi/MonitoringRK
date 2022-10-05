using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ASK_Core.Migrations
{
    public partial class suratId : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            

            migrationBuilder.RenameColumn(
                name: "perihal",
                table: "Surat",
                newName: "Perihal");

            migrationBuilder.RenameColumn(
                name: "nomorSurat",
                table: "Surat",
                newName: "NomorSurat");

            migrationBuilder.RenameColumn(
                name: "lampiran",
                table: "Surat",
                newName: "Lampiran");

            

           

            migrationBuilder.AddColumn<int>(
                name: "SuratId",
                table: "T_Kliring",
                type: "int",
                nullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "Lampiran",
                table: "Surat",
                type: "nvarchar(max)",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_T_Kliring_SuratId",
                table: "T_Kliring",
                column: "SuratId");

            migrationBuilder.AddForeignKey(
                name: "FK_JenisSurat_TypeTrans_TypeId",
                table: "JenisSurat",
                column: "TypeId",
                principalTable: "TypeTrans",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_T_Kliring_Surat_SuratId",
                table: "T_Kliring",
                column: "SuratId",
                principalTable: "Surat",
                principalColumn: "Id");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_JenisSurat_TypeTrans_TypeId",
                table: "JenisSurat");

            migrationBuilder.DropForeignKey(
                name: "FK_T_Kliring_Surat_SuratId",
                table: "T_Kliring");

            migrationBuilder.DropIndex(
                name: "IX_T_Kliring_SuratId",
                table: "T_Kliring");

            migrationBuilder.DropColumn(
                name: "SuratId",
                table: "T_Kliring");

            migrationBuilder.RenameColumn(
                name: "Perihal",
                table: "Surat",
                newName: "perihal");

            migrationBuilder.RenameColumn(
                name: "NomorSurat",
                table: "Surat",
                newName: "nomorSurat");

            migrationBuilder.RenameColumn(
                name: "Lampiran",
                table: "Surat",
                newName: "lampiran");

            migrationBuilder.RenameColumn(
                name: "TypeId",
                table: "JenisSurat",
                newName: "UnitId");

            migrationBuilder.RenameIndex(
                name: "IX_JenisSurat_TypeId",
                table: "JenisSurat",
                newName: "IX_JenisSurat_UnitId");

            migrationBuilder.AlterColumn<int>(
                name: "lampiran",
                table: "Surat",
                type: "int",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)",
                oldNullable: true);

            
        }
    }
}
