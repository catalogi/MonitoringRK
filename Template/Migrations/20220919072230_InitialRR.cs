using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ASK_Core.Migrations
{
    public partial class InitialRR : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_T_RTGS_TypeTrans_TypeId",
                table: "T_RTGS");

            migrationBuilder.AlterColumn<int>(
                name: "TypeId",
                table: "T_RTGS",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AddForeignKey(
                name: "FK_T_RTGS_TypeTrans_TypeId",
                table: "T_RTGS",
                column: "TypeId",
                principalTable: "TypeTrans",
                principalColumn: "Id");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_T_RTGS_TypeTrans_TypeId",
                table: "T_RTGS");

            migrationBuilder.AlterColumn<int>(
                name: "TypeId",
                table: "T_RTGS",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AddForeignKey(
                name: "FK_T_RTGS_TypeTrans_TypeId",
                table: "T_RTGS",
                column: "TypeId",
                principalTable: "TypeTrans",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
