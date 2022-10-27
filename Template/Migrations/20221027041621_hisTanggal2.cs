using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ASK_Core.Migrations
{
    public partial class hisTanggal2 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_his_tgltoken_DataToken_datatokenId",
                table: "his_tgltoken");

            migrationBuilder.DropColumn(
                name: "datokId",
                table: "his_tgltoken");

            migrationBuilder.AlterColumn<int>(
                name: "datatokenId",
                table: "his_tgltoken",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AddForeignKey(
                name: "FK_his_tgltoken_DataToken_datatokenId",
                table: "his_tgltoken",
                column: "datatokenId",
                principalTable: "DataToken",
                principalColumn: "Id");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_his_tgltoken_DataToken_datatokenId",
                table: "his_tgltoken");

            migrationBuilder.AlterColumn<int>(
                name: "datatokenId",
                table: "his_tgltoken",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AddColumn<int>(
                name: "datokId",
                table: "his_tgltoken",
                type: "int",
                nullable: true);

            migrationBuilder.AddForeignKey(
                name: "FK_his_tgltoken_DataToken_datatokenId",
                table: "his_tgltoken",
                column: "datatokenId",
                principalTable: "DataToken",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
