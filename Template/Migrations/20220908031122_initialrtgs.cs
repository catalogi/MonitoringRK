using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ASK_Core.Migrations
{
    public partial class initialrtgs : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_T_RTGS_TypeTrans_TypeId",
                table: "T_RTGS");

            migrationBuilder.RenameColumn(
                name: "Followup",
                table: "T_RTGS",
                newName: "FollowUp");

            migrationBuilder.AlterColumn<int>(
                name: "TypeId",
                table: "T_RTGS",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AddColumn<string>(
                name: "AcceptorId",
                table: "T_RTGS",
                type: "nvarchar(450)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "CreaterId",
                table: "T_RTGS",
                type: "nvarchar(450)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "CreatorId",
                table: "T_RTGS",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_T_RTGS_AcceptorId",
                table: "T_RTGS",
                column: "AcceptorId");

            migrationBuilder.CreateIndex(
                name: "IX_T_RTGS_CreaterId",
                table: "T_RTGS",
                column: "CreaterId");

            migrationBuilder.AddForeignKey(
                name: "FK_T_RTGS_AspNetUsers_AcceptorId",
                table: "T_RTGS",
                column: "AcceptorId",
                principalTable: "AspNetUsers",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_T_RTGS_AspNetUsers_CreaterId",
                table: "T_RTGS",
                column: "CreaterId",
                principalTable: "AspNetUsers",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_T_RTGS_TypeTrans_TypeId",
                table: "T_RTGS",
                column: "TypeId",
                principalTable: "TypeTrans",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_T_RTGS_AspNetUsers_AcceptorId",
                table: "T_RTGS");

            migrationBuilder.DropForeignKey(
                name: "FK_T_RTGS_AspNetUsers_CreaterId",
                table: "T_RTGS");

            migrationBuilder.DropForeignKey(
                name: "FK_T_RTGS_TypeTrans_TypeId",
                table: "T_RTGS");

            migrationBuilder.DropIndex(
                name: "IX_T_RTGS_AcceptorId",
                table: "T_RTGS");

            migrationBuilder.DropIndex(
                name: "IX_T_RTGS_CreaterId",
                table: "T_RTGS");

            migrationBuilder.DropColumn(
                name: "AcceptorId",
                table: "T_RTGS");

            migrationBuilder.DropColumn(
                name: "CreaterId",
                table: "T_RTGS");

            migrationBuilder.DropColumn(
                name: "CreatorId",
                table: "T_RTGS");

            migrationBuilder.RenameColumn(
                name: "FollowUp",
                table: "T_RTGS",
                newName: "Followup");

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
    }
}
