using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ASK_Core.Migrations
{
    public partial class hisTanggal3 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "TokenExpired",
                table: "DataToken");

            migrationBuilder.RenameColumn(
                name: "DateTime",
                table: "his_tgltoken",
                newName: "DateToken");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "DateToken",
                table: "his_tgltoken",
                newName: "DateTime");

            migrationBuilder.AddColumn<DateTime>(
                name: "TokenExpired",
                table: "DataToken",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));
        }
    }
}
