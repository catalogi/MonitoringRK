using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ASK_Core.Migrations
{
    public partial class InitialCreate : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Alasan",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nama = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Alasan", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "AspNetRoles",
                columns: table => new
                {
                    Id = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    Name = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    NormalizedName = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    ConcurrencyStamp = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetRoles", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Bank",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nama = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    KodeBIC = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    KodeKliring = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Createdate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    Updatedate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    Deletedate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Bank", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Cabang",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nama = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    KodeCabang = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    sandi = table.Column<int>(type: "int", nullable: false),
                    Createdate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    Updatedate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    Deletedate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Cabang", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Kelompok",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nama = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Singkatan = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Createdate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    Updatedate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    Deletedate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Kelompok", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Keterangan",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nama = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Keterangan", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Status",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nama = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Warna = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Status", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "AspNetRoleClaims",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    RoleId = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    ClaimType = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ClaimValue = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetRoleClaims", x => x.Id);
                    table.ForeignKey(
                        name: "FK_AspNetRoleClaims_AspNetRoles_RoleId",
                        column: x => x.RoleId,
                        principalTable: "AspNetRoles",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Unit",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nama = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    KelompokId = table.Column<int>(type: "int", nullable: true),
                    Createdate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    Updatedate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    Deletedate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Unit", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Unit_Kelompok_KelompokId",
                        column: x => x.KelompokId,
                        principalTable: "Kelompok",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "AspNetUsers",
                columns: table => new
                {
                    Id = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    Discriminator = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Nama = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    NPP = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    KelompokId = table.Column<int>(type: "int", nullable: true),
                    UnitId = table.Column<int>(type: "int", nullable: true),
                    UserName = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    NormalizedUserName = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    Email = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    NormalizedEmail = table.Column<string>(type: "nvarchar(256)", maxLength: 256, nullable: true),
                    EmailConfirmed = table.Column<bool>(type: "bit", nullable: false),
                    PasswordHash = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    SecurityStamp = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ConcurrencyStamp = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    PhoneNumber = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    PhoneNumberConfirmed = table.Column<bool>(type: "bit", nullable: false),
                    TwoFactorEnabled = table.Column<bool>(type: "bit", nullable: false),
                    LockoutEnd = table.Column<DateTimeOffset>(type: "datetimeoffset", nullable: true),
                    LockoutEnabled = table.Column<bool>(type: "bit", nullable: false),
                    AccessFailedCount = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUsers", x => x.Id);
                    table.ForeignKey(
                        name: "FK_AspNetUsers_Kelompok_KelompokId",
                        column: x => x.KelompokId,
                        principalTable: "Kelompok",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_AspNetUsers_Unit_UnitId",
                        column: x => x.UnitId,
                        principalTable: "Unit",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "Testkey",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Tanggal = table.Column<DateTime>(type: "datetime2", nullable: false),
                    NomorTestkey = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    KeteranganId = table.Column<int>(type: "int", nullable: true),
                    UnitId = table.Column<int>(type: "int", nullable: true),
                    Createdate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    Updatedate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    Deletedate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Testkey", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Testkey_Keterangan_KeteranganId",
                        column: x => x.KeteranganId,
                        principalTable: "Keterangan",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_Testkey_Unit_UnitId",
                        column: x => x.UnitId,
                        principalTable: "Unit",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "TypeTrans",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Type = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    UnitId = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TypeTrans", x => x.Id);
                    table.ForeignKey(
                        name: "FK_TypeTrans_Unit_UnitId",
                        column: x => x.UnitId,
                        principalTable: "Unit",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserClaims",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserId = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    ClaimType = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ClaimValue = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserClaims", x => x.Id);
                    table.ForeignKey(
                        name: "FK_AspNetUserClaims_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserLogins",
                columns: table => new
                {
                    LoginProvider = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    ProviderKey = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    ProviderDisplayName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    UserId = table.Column<string>(type: "nvarchar(450)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserLogins", x => new { x.LoginProvider, x.ProviderKey });
                    table.ForeignKey(
                        name: "FK_AspNetUserLogins_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserRoles",
                columns: table => new
                {
                    UserId = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    RoleId = table.Column<string>(type: "nvarchar(450)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserRoles", x => new { x.UserId, x.RoleId });
                    table.ForeignKey(
                        name: "FK_AspNetUserRoles_AspNetRoles_RoleId",
                        column: x => x.RoleId,
                        principalTable: "AspNetRoles",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_AspNetUserRoles_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserTokens",
                columns: table => new
                {
                    UserId = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    LoginProvider = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    Name = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    Value = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserTokens", x => new { x.UserId, x.LoginProvider, x.Name });
                    table.ForeignKey(
                        name: "FK_AspNetUserTokens_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "MonitoringRK",
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
                name: "IX_AspNetRoleClaims_RoleId",
                table: "AspNetRoleClaims",
                column: "RoleId");

            migrationBuilder.CreateIndex(
                name: "RoleNameIndex",
                table: "AspNetRoles",
                column: "NormalizedName",
                unique: true,
                filter: "[NormalizedName] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUserClaims_UserId",
                table: "AspNetUserClaims",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUserLogins_UserId",
                table: "AspNetUserLogins",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUserRoles_RoleId",
                table: "AspNetUserRoles",
                column: "RoleId");

            migrationBuilder.CreateIndex(
                name: "EmailIndex",
                table: "AspNetUsers",
                column: "NormalizedEmail");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUsers_KelompokId",
                table: "AspNetUsers",
                column: "KelompokId");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUsers_UnitId",
                table: "AspNetUsers",
                column: "UnitId");

            migrationBuilder.CreateIndex(
                name: "UserNameIndex",
                table: "AspNetUsers",
                column: "NormalizedUserName",
                unique: true,
                filter: "[NormalizedUserName] IS NOT NULL");

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

            migrationBuilder.CreateIndex(
                name: "IX_Testkey_KeteranganId",
                table: "Testkey",
                column: "KeteranganId");

            migrationBuilder.CreateIndex(
                name: "IX_Testkey_UnitId",
                table: "Testkey",
                column: "UnitId");

            migrationBuilder.CreateIndex(
                name: "IX_TypeTrans_UnitId",
                table: "TypeTrans",
                column: "UnitId");

            migrationBuilder.CreateIndex(
                name: "IX_Unit_KelompokId",
                table: "Unit",
                column: "KelompokId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "AspNetRoleClaims");

            migrationBuilder.DropTable(
                name: "AspNetUserClaims");

            migrationBuilder.DropTable(
                name: "AspNetUserLogins");

            migrationBuilder.DropTable(
                name: "AspNetUserRoles");

            migrationBuilder.DropTable(
                name: "AspNetUserTokens");

            migrationBuilder.DropTable(
                name: "MonitoringRK");

            migrationBuilder.DropTable(
                name: "MonitoringRTGS");

            migrationBuilder.DropTable(
                name: "AspNetRoles");

            migrationBuilder.DropTable(
                name: "Alasan");

            migrationBuilder.DropTable(
                name: "AspNetUsers");

            migrationBuilder.DropTable(
                name: "Bank");

            migrationBuilder.DropTable(
                name: "Cabang");

            migrationBuilder.DropTable(
                name: "Status");

            migrationBuilder.DropTable(
                name: "Testkey");

            migrationBuilder.DropTable(
                name: "TypeTrans");

            migrationBuilder.DropTable(
                name: "Keterangan");

            migrationBuilder.DropTable(
                name: "Unit");

            migrationBuilder.DropTable(
                name: "Kelompok");
        }
    }
}
