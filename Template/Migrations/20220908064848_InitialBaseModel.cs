using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ASK_Core.Migrations
{
    public partial class InitialBaseModel : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Updatedate",
                table: "Unit",
                newName: "UpdateDate");

            migrationBuilder.RenameColumn(
                name: "Createdate",
                table: "Unit",
                newName: "CreateDate");

            migrationBuilder.RenameColumn(
                name: "Updatedate",
                table: "Testkey",
                newName: "UpdateDate");

            migrationBuilder.RenameColumn(
                name: "Createdate",
                table: "Testkey",
                newName: "CreateDate");

            migrationBuilder.RenameColumn(
                name: "Updatedate",
                table: "T_RTGS",
                newName: "UpdateDate");

            migrationBuilder.RenameColumn(
                name: "Createdate",
                table: "T_RTGS",
                newName: "CreateDate");

            migrationBuilder.RenameColumn(
                name: "Updatedate",
                table: "T_Kliring",
                newName: "UpdateDate");

            migrationBuilder.RenameColumn(
                name: "Createdate",
                table: "T_Kliring",
                newName: "CreateDate");

            migrationBuilder.RenameColumn(
                name: "Updatedate",
                table: "Kelompok",
                newName: "UpdateDate");

            migrationBuilder.RenameColumn(
                name: "Createdate",
                table: "Kelompok",
                newName: "CreateDate");

            migrationBuilder.RenameColumn(
                name: "Updatedate",
                table: "DataToken",
                newName: "UpdateDate");

            migrationBuilder.RenameColumn(
                name: "Createdate",
                table: "DataToken",
                newName: "CreateDate");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "UpdateDate",
                table: "Unit",
                newName: "Updatedate");

            migrationBuilder.RenameColumn(
                name: "CreateDate",
                table: "Unit",
                newName: "Createdate");

            migrationBuilder.RenameColumn(
                name: "UpdateDate",
                table: "Testkey",
                newName: "Updatedate");

            migrationBuilder.RenameColumn(
                name: "CreateDate",
                table: "Testkey",
                newName: "Createdate");

            migrationBuilder.RenameColumn(
                name: "UpdateDate",
                table: "T_RTGS",
                newName: "Updatedate");

            migrationBuilder.RenameColumn(
                name: "CreateDate",
                table: "T_RTGS",
                newName: "Createdate");

            migrationBuilder.RenameColumn(
                name: "UpdateDate",
                table: "T_Kliring",
                newName: "Updatedate");

            migrationBuilder.RenameColumn(
                name: "CreateDate",
                table: "T_Kliring",
                newName: "Createdate");

            migrationBuilder.RenameColumn(
                name: "UpdateDate",
                table: "Kelompok",
                newName: "Updatedate");

            migrationBuilder.RenameColumn(
                name: "CreateDate",
                table: "Kelompok",
                newName: "Createdate");

            migrationBuilder.RenameColumn(
                name: "UpdateDate",
                table: "DataToken",
                newName: "Updatedate");

            migrationBuilder.RenameColumn(
                name: "CreateDate",
                table: "DataToken",
                newName: "Createdate");
        }
    }
}
