using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ASK_Core.Migrations
{
    public partial class createrID : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "AcceptedId",
                table: "T_Kliring",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "AcceptedId1",
                table: "T_Kliring",
                type: "nvarchar(450)",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "CreaterId",
                table: "T_Kliring",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "CreaterId1",
                table: "T_Kliring",
                type: "nvarchar(450)",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_T_Kliring_AcceptedId1",
                table: "T_Kliring",
                column: "AcceptedId1");

            migrationBuilder.CreateIndex(
                name: "IX_T_Kliring_CreaterId1",
                table: "T_Kliring",
                column: "CreaterId1");

            migrationBuilder.AddForeignKey(
                name: "FK_T_Kliring_AspNetUsers_AcceptedId1",
                table: "T_Kliring",
                column: "AcceptedId1",
                principalTable: "AspNetUsers",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_T_Kliring_AspNetUsers_CreaterId1",
                table: "T_Kliring",
                column: "CreaterId1",
                principalTable: "AspNetUsers",
                principalColumn: "Id");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_T_Kliring_AspNetUsers_AcceptedId1",
                table: "T_Kliring");

            migrationBuilder.DropForeignKey(
                name: "FK_T_Kliring_AspNetUsers_CreaterId1",
                table: "T_Kliring");

            migrationBuilder.DropIndex(
                name: "IX_T_Kliring_AcceptedId1",
                table: "T_Kliring");

            migrationBuilder.DropIndex(
                name: "IX_T_Kliring_CreaterId1",
                table: "T_Kliring");

            migrationBuilder.DropColumn(
                name: "AcceptedId",
                table: "T_Kliring");

            migrationBuilder.DropColumn(
                name: "AcceptedId1",
                table: "T_Kliring");

            migrationBuilder.DropColumn(
                name: "CreaterId",
                table: "T_Kliring");

            migrationBuilder.DropColumn(
                name: "CreaterId1",
                table: "T_Kliring");
        }
    }
}
