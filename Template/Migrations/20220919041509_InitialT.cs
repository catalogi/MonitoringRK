using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ASK_Core.Migrations
{
    public partial class InitialT : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_T_Kliring_Testkey_TestkeyId",
                table: "T_Kliring");

            migrationBuilder.DropForeignKey(
                name: "FK_T_RTGS_Testkey_TestkeyId",
                table: "T_RTGS");

            migrationBuilder.DropTable(
                name: "Testkey");

            migrationBuilder.DropIndex(
                name: "IX_T_RTGS_TestkeyId",
                table: "T_RTGS");

            migrationBuilder.DropIndex(
                name: "IX_T_Kliring_TestkeyId",
                table: "T_Kliring");

            migrationBuilder.DropColumn(
                name: "TestkeyId",
                table: "T_Kliring");

            

            migrationBuilder.RenameColumn(
                name: "path",
                table: "T_RTGS",
                newName: "Path");

            

            migrationBuilder.AddColumn<string>(
                name: "NomorTestkey",
                table: "T_RTGS",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "Tanggal",
                table: "T_RTGS",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.AddColumn<string>(
                name: "NomorTestkey",
                table: "T_Kliring",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<DateTime>(
                name: "TanggalTestkey",
                table: "T_Kliring",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.CreateTable(
                name: "Libur",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Hari = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    TanggalLibur = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Keterangan = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Libur", x => x.Id);
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Libur");

            migrationBuilder.DropColumn(
                name: "NomorTestkey",
                table: "T_RTGS");

            migrationBuilder.DropColumn(
                name: "Tanggal",
                table: "T_RTGS");

            migrationBuilder.DropColumn(
                name: "NomorTestkey",
                table: "T_Kliring");

            migrationBuilder.DropColumn(
                name: "TanggalTestkey",
                table: "T_Kliring");

            

            migrationBuilder.RenameColumn(
                name: "Path",
                table: "T_RTGS",
                newName: "path");

           

            migrationBuilder.AddColumn<int>(
                name: "TestkeyId",
                table: "T_Kliring",
                type: "int",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "Testkey",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreateDate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: true),
                    NomorTestkey = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Tanggal = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdateDate = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Testkey", x => x.Id);
                });

            migrationBuilder.CreateIndex(
                name: "IX_T_RTGS_TestkeyId",
                table: "T_RTGS",
                column: "TestkeyId");

            migrationBuilder.CreateIndex(
                name: "IX_T_Kliring_TestkeyId",
                table: "T_Kliring",
                column: "TestkeyId");

            migrationBuilder.AddForeignKey(
                name: "FK_T_Kliring_Testkey_TestkeyId",
                table: "T_Kliring",
                column: "TestkeyId",
                principalTable: "Testkey",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_T_RTGS_Testkey_TestkeyId",
                table: "T_RTGS",
                column: "TestkeyId",
                principalTable: "Testkey",
                principalColumn: "Id");
        }
    }
}
