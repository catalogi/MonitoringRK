using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ASK_Core.Migrations
{
    public partial class UpdateModelCabang : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Createdate",
                table: "Cabang");

            migrationBuilder.DropColumn(
                name: "Deletedate",
                table: "Cabang");

            migrationBuilder.DropColumn(
                name: "Updatedate",
                table: "Cabang");

            migrationBuilder.RenameColumn(
                name: "IsDeleted",
                table: "Cabang",
                newName: "isDeleted");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "isDeleted",
                table: "Cabang",
                newName: "IsDeleted");

            migrationBuilder.AddColumn<DateTime>(
                name: "Createdate",
                table: "Cabang",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "Deletedate",
                table: "Cabang",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "Updatedate",
                table: "Cabang",
                type: "datetime2",
                nullable: true);
        }
    }
}
