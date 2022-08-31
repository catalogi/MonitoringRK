using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ASK_Core.Migrations
{
    public partial class UpdateModelBank : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Createdate",
                table: "Bank");

            migrationBuilder.DropColumn(
                name: "Deletedate",
                table: "Bank");

            migrationBuilder.DropColumn(
                name: "Updatedate",
                table: "Bank");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<DateTime>(
                name: "Createdate",
                table: "Bank",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "Deletedate",
                table: "Bank",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "Updatedate",
                table: "Bank",
                type: "datetime2",
                nullable: true);
        }
    }
}
