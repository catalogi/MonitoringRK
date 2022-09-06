using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ASK_Core.Migrations
{
    public partial class accep : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "AcceptorId",
                table: "T_Kliring",
                type: "nvarchar(450)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "CreaterId",
                table: "T_Kliring",
                type: "nvarchar(450)",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_T_Kliring_AcceptorId",
                table: "T_Kliring",
                column: "AcceptorId");

            migrationBuilder.CreateIndex(
                name: "IX_T_Kliring_CreaterId",
                table: "T_Kliring",
                column: "CreaterId");

            migrationBuilder.AddForeignKey(
                name: "FK_T_Kliring_AspNetUsers_AcceptorId",
                table: "T_Kliring",
                column: "AcceptorId",
                principalTable: "AspNetUsers",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_T_Kliring_AspNetUsers_CreaterId",
                table: "T_Kliring",
                column: "CreaterId",
                principalTable: "AspNetUsers",
                principalColumn: "Id");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_T_Kliring_AspNetUsers_AcceptorId",
                table: "T_Kliring");

            migrationBuilder.DropForeignKey(
                name: "FK_T_Kliring_AspNetUsers_CreaterId",
                table: "T_Kliring");

            migrationBuilder.DropIndex(
                name: "IX_T_Kliring_AcceptorId",
                table: "T_Kliring");

            migrationBuilder.DropIndex(
                name: "IX_T_Kliring_CreaterId",
                table: "T_Kliring");

            migrationBuilder.DropColumn(
                name: "AcceptorId",
                table: "T_Kliring");

            migrationBuilder.DropColumn(
                name: "CreaterId",
                table: "T_Kliring");
        }
    }
}
