using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ASK_Core.Migrations
{
    public partial class histori_data : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "createDate",
                table: "his_tgltoken",
                newName: "CreateDate");

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreateDate",
                table: "Trans_Surat",
                type: "datetime2",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "datetime2");

            migrationBuilder.AddColumn<bool>(
                name: "IsDeleted",
                table: "Trans_Surat",
                type: "bit",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "UpdateDate",
                table: "Trans_Surat",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreateDate",
                table: "his_tgltoken",
                type: "datetime2",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "datetime2");

            migrationBuilder.AddColumn<bool>(
                name: "IsDeleted",
                table: "his_tgltoken",
                type: "bit",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "UpdateDate",
                table: "his_tgltoken",
                type: "datetime2",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "IsDeleted",
                table: "Trans_Surat");

            migrationBuilder.DropColumn(
                name: "UpdateDate",
                table: "Trans_Surat");

            migrationBuilder.DropColumn(
                name: "IsDeleted",
                table: "his_tgltoken");

            migrationBuilder.DropColumn(
                name: "UpdateDate",
                table: "his_tgltoken");

            migrationBuilder.RenameColumn(
                name: "CreateDate",
                table: "his_tgltoken",
                newName: "createDate");

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreateDate",
                table: "Trans_Surat",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "createDate",
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
