using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ASK_Core.Migrations
{
    public partial class typeDep : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            

            migrationBuilder.AddColumn<int>(
                name: "Type_DeptId",
                table: "Cabang",
                type: "int",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "Type_Dept",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nama = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Type_Dept", x => x.Id);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Cabang_Type_DeptId",
                table: "Cabang",
                column: "Type_DeptId");

            migrationBuilder.AddForeignKey(
                name: "FK_Cabang_Type_Dept_Type_DeptId",
                table: "Cabang",
                column: "Type_DeptId",
                principalTable: "Type_Dept",
                principalColumn: "Id");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Cabang_Type_Dept_Type_DeptId",
                table: "Cabang");

            migrationBuilder.DropTable(
                name: "Type_Dept");

            migrationBuilder.DropIndex(
                name: "IX_Cabang_Type_DeptId",
                table: "Cabang");

            migrationBuilder.DropColumn(
                name: "Type_DeptId",
                table: "Cabang");

            
        }
    }
}
