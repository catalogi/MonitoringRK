using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ASK_Core.Migrations
{
    public partial class InitialDivisi : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "DivisiId",
                table: "T_Kliring",
                type: "int",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "Divisi",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nama = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    KodeDivisi = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    isDelete = table.Column<bool>(type: "bit", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Divisi", x => x.Id);
                });

            migrationBuilder.CreateIndex(
                name: "IX_T_Kliring_DivisiId",
                table: "T_Kliring",
                column: "DivisiId");

            migrationBuilder.AddForeignKey(
                name: "FK_T_Kliring_Divisi_DivisiId",
                table: "T_Kliring",
                column: "DivisiId",
                principalTable: "Divisi",
                principalColumn: "Id");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_T_Kliring_Divisi_DivisiId",
                table: "T_Kliring");

            migrationBuilder.DropTable(
                name: "Divisi");

            migrationBuilder.DropIndex(
                name: "IX_T_Kliring_DivisiId",
                table: "T_Kliring");

            migrationBuilder.DropColumn(
                name: "DivisiId",
                table: "T_Kliring");
        }
    }
}
