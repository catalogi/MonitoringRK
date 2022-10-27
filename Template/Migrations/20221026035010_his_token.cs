using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ASK_Core.Migrations
{
    public partial class his_token : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "his_tgltoken",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    DateTime = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Keterangan = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    datatokenId = table.Column<int>(type: "int", nullable: false),
                    datokId = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_his_tgltoken", x => x.Id);
                    table.ForeignKey(
                        name: "FK_his_tgltoken_DataToken_datatokenId",
                        column: x => x.datatokenId,
                        principalTable: "DataToken",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Trans_Surat",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    suratId = table.Column<int>(type: "int", nullable: true),
                    kliringId = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Trans_Surat", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Trans_Surat_Surat_suratId",
                        column: x => x.suratId,
                        principalTable: "Surat",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_Trans_Surat_T_Kliring_kliringId",
                        column: x => x.kliringId,
                        principalTable: "T_Kliring",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateIndex(
                name: "IX_his_tgltoken_datatokenId",
                table: "his_tgltoken",
                column: "datatokenId");

            migrationBuilder.CreateIndex(
                name: "IX_Trans_Surat_kliringId",
                table: "Trans_Surat",
                column: "kliringId");

            migrationBuilder.CreateIndex(
                name: "IX_Trans_Surat_suratId",
                table: "Trans_Surat",
                column: "suratId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "his_tgltoken");

            migrationBuilder.DropTable(
                name: "Trans_Surat");
        }
    }
}
