using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ASK_Core.Migrations
{
    public partial class kliringRTGS : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "MonitoringRK");

            migrationBuilder.DropTable(
                name: "MonitoringRTGS");

            migrationBuilder.CreateTable(
                name: "T_Kliring",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    NomorSurat = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    TanggalSurat = table.Column<DateTime>(type: "datetime2", nullable: false),
                    NoReferensi = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    NamaPenerima = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    BankId = table.Column<int>(type: "int", nullable: true),
                    NomorRekening = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Nominal = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    CabangId = table.Column<int>(type: "int", nullable: true),
                    TanggalTRX = table.Column<DateTime>(type: "datetime2", nullable: false),
                    TestkeyId = table.Column<int>(type: "int", nullable: true),
                    KeteranganId = table.Column<int>(type: "int", nullable: true),
                    AlasanId = table.Column<int>(type: "int", nullable: true),
                    NominalSeharusnya = table.Column<decimal>(type: "decimal(18,2)", nullable: true),
                    TypeId = table.Column<int>(type: "int", nullable: true),
                    StatusId = table.Column<int>(type: "int", nullable: true),
                    Durasi = table.Column<int>(type: "int", nullable: false),
                    path = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    TanggalDone = table.Column<DateTime>(type: "datetime2", nullable: true),
                    CreaterId = table.Column<string>(type: "nvarchar(450)", nullable: true),
                    CreateId = table.Column<int>(type: "int", nullable: true),
                    AcceptedId1 = table.Column<string>(type: "nvarchar(450)", nullable: true),
                    AcceptedId = table.Column<int>(type: "int", nullable: true),
                    Createdate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    Updatedate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    Deletedate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_T_Kliring", x => x.Id);
                    table.ForeignKey(
                        name: "FK_T_Kliring_Alasan_AlasanId",
                        column: x => x.AlasanId,
                        principalTable: "Alasan",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_T_Kliring_AspNetUsers_AcceptedId1",
                        column: x => x.AcceptedId1,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_T_Kliring_AspNetUsers_CreaterId",
                        column: x => x.CreaterId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_T_Kliring_Bank_BankId",
                        column: x => x.BankId,
                        principalTable: "Bank",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_T_Kliring_Cabang_CabangId",
                        column: x => x.CabangId,
                        principalTable: "Cabang",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_T_Kliring_Keterangan_KeteranganId",
                        column: x => x.KeteranganId,
                        principalTable: "Keterangan",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_T_Kliring_Status_StatusId",
                        column: x => x.StatusId,
                        principalTable: "Status",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_T_Kliring_Testkey_TestkeyId",
                        column: x => x.TestkeyId,
                        principalTable: "Testkey",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_T_Kliring_TypeTrans_TypeId",
                        column: x => x.TypeId,
                        principalTable: "TypeTrans",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "T_RTGS",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    NomorSurat = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    TanggalProses = table.Column<DateTime>(type: "datetime2", nullable: false),
                    RelTRN = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    TRN = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    CabangId = table.Column<int>(type: "int", nullable: true),
                    BankId = table.Column<int>(type: "int", nullable: true),
                    Nominal = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    TanggalDone = table.Column<DateTime>(type: "datetime2", nullable: true),
                    Followup = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    TestkeyId = table.Column<int>(type: "int", nullable: true),
                    TypeId = table.Column<int>(type: "int", nullable: true),
                    KeteranganId = table.Column<int>(type: "int", nullable: true),
                    StatusId = table.Column<int>(type: "int", nullable: true),
                    Createdate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    Updatedate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    Deletedate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_T_RTGS", x => x.Id);
                    table.ForeignKey(
                        name: "FK_T_RTGS_Bank_BankId",
                        column: x => x.BankId,
                        principalTable: "Bank",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_T_RTGS_Cabang_CabangId",
                        column: x => x.CabangId,
                        principalTable: "Cabang",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_T_RTGS_Keterangan_KeteranganId",
                        column: x => x.KeteranganId,
                        principalTable: "Keterangan",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_T_RTGS_Status_StatusId",
                        column: x => x.StatusId,
                        principalTable: "Status",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_T_RTGS_Testkey_TestkeyId",
                        column: x => x.TestkeyId,
                        principalTable: "Testkey",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_T_RTGS_TypeTrans_TypeId",
                        column: x => x.TypeId,
                        principalTable: "TypeTrans",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateIndex(
                name: "IX_T_Kliring_AcceptedId1",
                table: "T_Kliring",
                column: "AcceptedId1");

            migrationBuilder.CreateIndex(
                name: "IX_T_Kliring_AlasanId",
                table: "T_Kliring",
                column: "AlasanId");

            migrationBuilder.CreateIndex(
                name: "IX_T_Kliring_BankId",
                table: "T_Kliring",
                column: "BankId");

            migrationBuilder.CreateIndex(
                name: "IX_T_Kliring_CabangId",
                table: "T_Kliring",
                column: "CabangId");

            migrationBuilder.CreateIndex(
                name: "IX_T_Kliring_CreaterId",
                table: "T_Kliring",
                column: "CreaterId");

            migrationBuilder.CreateIndex(
                name: "IX_T_Kliring_KeteranganId",
                table: "T_Kliring",
                column: "KeteranganId");

            migrationBuilder.CreateIndex(
                name: "IX_T_Kliring_StatusId",
                table: "T_Kliring",
                column: "StatusId");

            migrationBuilder.CreateIndex(
                name: "IX_T_Kliring_TestkeyId",
                table: "T_Kliring",
                column: "TestkeyId");

            migrationBuilder.CreateIndex(
                name: "IX_T_Kliring_TypeId",
                table: "T_Kliring",
                column: "TypeId");

            migrationBuilder.CreateIndex(
                name: "IX_T_RTGS_BankId",
                table: "T_RTGS",
                column: "BankId");

            migrationBuilder.CreateIndex(
                name: "IX_T_RTGS_CabangId",
                table: "T_RTGS",
                column: "CabangId");

            migrationBuilder.CreateIndex(
                name: "IX_T_RTGS_KeteranganId",
                table: "T_RTGS",
                column: "KeteranganId");

            migrationBuilder.CreateIndex(
                name: "IX_T_RTGS_StatusId",
                table: "T_RTGS",
                column: "StatusId");

            migrationBuilder.CreateIndex(
                name: "IX_T_RTGS_TestkeyId",
                table: "T_RTGS",
                column: "TestkeyId");

            migrationBuilder.CreateIndex(
                name: "IX_T_RTGS_TypeId",
                table: "T_RTGS",
                column: "TypeId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "T_Kliring");

            migrationBuilder.DropTable(
                name: "T_RTGS");

            migrationBuilder.CreateTable(
                name: "MonitoringRK",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    AcceptedId1 = table.Column<string>(type: "nvarchar(450)", nullable: true),
                    AlasanId = table.Column<int>(type: "int", nullable: true),
                    BankId = table.Column<int>(type: "int", nullable: true),
                    CabangId = table.Column<int>(type: "int", nullable: true),
                    CreaterId = table.Column<string>(type: "nvarchar(450)", nullable: true),
                    KeteranganId = table.Column<int>(type: "int", nullable: true),
                    StatusId = table.Column<int>(type: "int", nullable: true),
                    TestkeyId = table.Column<int>(type: "int", nullable: true),
                    TypeId = table.Column<int>(type: "int", nullable: true),
                    AcceptedId = table.Column<int>(type: "int", nullable: true),
                    CreateId = table.Column<int>(type: "int", nullable: true),
                    Createdate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    Deletedate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    Durasi = table.Column<int>(type: "int", nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: true),
                    NamaPenerima = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    NoReferensi = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Nominal = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    NominalSeharusnya = table.Column<decimal>(type: "decimal(18,2)", nullable: true),
                    NomorRekening = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    NomorSurat = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    TanggalDone = table.Column<DateTime>(type: "datetime2", nullable: true),
                    TanggalSurat = table.Column<DateTime>(type: "datetime2", nullable: false),
                    TanggalTRX = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Updatedate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    path = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_MonitoringRK", x => x.Id);
                    table.ForeignKey(
                        name: "FK_MonitoringRK_Alasan_AlasanId",
                        column: x => x.AlasanId,
                        principalTable: "Alasan",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_MonitoringRK_AspNetUsers_AcceptedId1",
                        column: x => x.AcceptedId1,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_MonitoringRK_AspNetUsers_CreaterId",
                        column: x => x.CreaterId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_MonitoringRK_Bank_BankId",
                        column: x => x.BankId,
                        principalTable: "Bank",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_MonitoringRK_Cabang_CabangId",
                        column: x => x.CabangId,
                        principalTable: "Cabang",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_MonitoringRK_Keterangan_KeteranganId",
                        column: x => x.KeteranganId,
                        principalTable: "Keterangan",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_MonitoringRK_Status_StatusId",
                        column: x => x.StatusId,
                        principalTable: "Status",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_MonitoringRK_Testkey_TestkeyId",
                        column: x => x.TestkeyId,
                        principalTable: "Testkey",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_MonitoringRK_TypeTrans_TypeId",
                        column: x => x.TypeId,
                        principalTable: "TypeTrans",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "MonitoringRTGS",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    BankId = table.Column<int>(type: "int", nullable: true),
                    CabangId = table.Column<int>(type: "int", nullable: true),
                    KeteranganId = table.Column<int>(type: "int", nullable: true),
                    StatusId = table.Column<int>(type: "int", nullable: true),
                    TestkeyId = table.Column<int>(type: "int", nullable: true),
                    TypeId = table.Column<int>(type: "int", nullable: true),
                    Createdate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    Deletedate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    Followup = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: true),
                    Nominal = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    NomorSurat = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    RelTRN = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    TRN = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    TanggalDone = table.Column<DateTime>(type: "datetime2", nullable: true),
                    TanggalProses = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Updatedate = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_MonitoringRTGS", x => x.Id);
                    table.ForeignKey(
                        name: "FK_MonitoringRTGS_Bank_BankId",
                        column: x => x.BankId,
                        principalTable: "Bank",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_MonitoringRTGS_Cabang_CabangId",
                        column: x => x.CabangId,
                        principalTable: "Cabang",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_MonitoringRTGS_Keterangan_KeteranganId",
                        column: x => x.KeteranganId,
                        principalTable: "Keterangan",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_MonitoringRTGS_Status_StatusId",
                        column: x => x.StatusId,
                        principalTable: "Status",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_MonitoringRTGS_Testkey_TestkeyId",
                        column: x => x.TestkeyId,
                        principalTable: "Testkey",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_MonitoringRTGS_TypeTrans_TypeId",
                        column: x => x.TypeId,
                        principalTable: "TypeTrans",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateIndex(
                name: "IX_MonitoringRK_AcceptedId1",
                table: "MonitoringRK",
                column: "AcceptedId1");

            migrationBuilder.CreateIndex(
                name: "IX_MonitoringRK_AlasanId",
                table: "MonitoringRK",
                column: "AlasanId");

            migrationBuilder.CreateIndex(
                name: "IX_MonitoringRK_BankId",
                table: "MonitoringRK",
                column: "BankId");

            migrationBuilder.CreateIndex(
                name: "IX_MonitoringRK_CabangId",
                table: "MonitoringRK",
                column: "CabangId");

            migrationBuilder.CreateIndex(
                name: "IX_MonitoringRK_CreaterId",
                table: "MonitoringRK",
                column: "CreaterId");

            migrationBuilder.CreateIndex(
                name: "IX_MonitoringRK_KeteranganId",
                table: "MonitoringRK",
                column: "KeteranganId");

            migrationBuilder.CreateIndex(
                name: "IX_MonitoringRK_StatusId",
                table: "MonitoringRK",
                column: "StatusId");

            migrationBuilder.CreateIndex(
                name: "IX_MonitoringRK_TestkeyId",
                table: "MonitoringRK",
                column: "TestkeyId");

            migrationBuilder.CreateIndex(
                name: "IX_MonitoringRK_TypeId",
                table: "MonitoringRK",
                column: "TypeId");

            migrationBuilder.CreateIndex(
                name: "IX_MonitoringRTGS_BankId",
                table: "MonitoringRTGS",
                column: "BankId");

            migrationBuilder.CreateIndex(
                name: "IX_MonitoringRTGS_CabangId",
                table: "MonitoringRTGS",
                column: "CabangId");

            migrationBuilder.CreateIndex(
                name: "IX_MonitoringRTGS_KeteranganId",
                table: "MonitoringRTGS",
                column: "KeteranganId");

            migrationBuilder.CreateIndex(
                name: "IX_MonitoringRTGS_StatusId",
                table: "MonitoringRTGS",
                column: "StatusId");

            migrationBuilder.CreateIndex(
                name: "IX_MonitoringRTGS_TestkeyId",
                table: "MonitoringRTGS",
                column: "TestkeyId");

            migrationBuilder.CreateIndex(
                name: "IX_MonitoringRTGS_TypeId",
                table: "MonitoringRTGS",
                column: "TypeId");
        }
    }
}
