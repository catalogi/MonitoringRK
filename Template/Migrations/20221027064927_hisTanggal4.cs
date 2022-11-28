using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ASK_Core.Migrations
{
    public partial class hisTanggal4 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Keterangan",
                table: "his_tgltoken",
                newName: "Keterangant");

            migrationBuilder.AlterColumn<DateTime>(
                name: "UpdateDate",
                table: "his_tgltoken",
                type: "datetime2",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "datetime2");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Keterangant",
                table: "his_tgltoken",
                newName: "Keterangan");

            migrationBuilder.AlterColumn<DateTime>(
                name: "UpdateDate",
                table: "his_tgltoken",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldNullable: true);
        }
    }
}
