using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ASK_Core.Migrations
{
    public partial class Kliring : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_T_Kliring_AspNetUsers_CreaterId",
                table: "T_Kliring");

            migrationBuilder.DropForeignKey(
                name: "FK_T_Kliring_Bank_BankId",
                table: "T_Kliring");

            migrationBuilder.DropIndex(
                name: "IX_T_Kliring_CreaterId",
                table: "T_Kliring");

            migrationBuilder.DropColumn(
                name: "CreateId",
                table: "T_Kliring");

            migrationBuilder.AlterColumn<int>(
                name: "CreaterId",
                table: "T_Kliring",
                type: "int",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(450)",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "BankId",
                table: "T_Kliring",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AddColumn<string>(
                name: "CreaterId1",
                table: "T_Kliring",
                type: "nvarchar(450)",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_T_Kliring_CreaterId1",
                table: "T_Kliring",
                column: "CreaterId1");

            migrationBuilder.AddForeignKey(
                name: "FK_T_Kliring_AspNetUsers_CreaterId1",
                table: "T_Kliring",
                column: "CreaterId1",
                principalTable: "AspNetUsers",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_T_Kliring_Bank_BankId",
                table: "T_Kliring",
                column: "BankId",
                principalTable: "Bank",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_T_Kliring_AspNetUsers_CreaterId1",
                table: "T_Kliring");

            migrationBuilder.DropForeignKey(
                name: "FK_T_Kliring_Bank_BankId",
                table: "T_Kliring");

            migrationBuilder.DropIndex(
                name: "IX_T_Kliring_CreaterId1",
                table: "T_Kliring");

            migrationBuilder.DropColumn(
                name: "CreaterId1",
                table: "T_Kliring");

            migrationBuilder.AlterColumn<string>(
                name: "CreaterId",
                table: "T_Kliring",
                type: "nvarchar(450)",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "BankId",
                table: "T_Kliring",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AddColumn<int>(
                name: "CreateId",
                table: "T_Kliring",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_T_Kliring_CreaterId",
                table: "T_Kliring",
                column: "CreaterId");

            migrationBuilder.AddForeignKey(
                name: "FK_T_Kliring_AspNetUsers_CreaterId",
                table: "T_Kliring",
                column: "CreaterId",
                principalTable: "AspNetUsers",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_T_Kliring_Bank_BankId",
                table: "T_Kliring",
                column: "BankId",
                principalTable: "Bank",
                principalColumn: "Id");
        }
    }
}
