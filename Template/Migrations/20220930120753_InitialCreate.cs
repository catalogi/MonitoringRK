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
                    KodeCabang = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Sandi = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    isDeleted = table.Column<bool>(type: "bit", nullable: true)
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
                    CreateDate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    UpdateDate = table.Column<DateTime>(type: "datetime2", nullable: true),
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
                name: "Libur",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Hari = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    TanggalLibur = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Keterangan = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Libur", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Modul",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nama = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Modul", x => x.Id);
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
                    CreateDate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    UpdateDate = table.Column<DateTime>(type: "datetime2", nullable: true),
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
                name: "DataToken",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    KelompokId = table.Column<int>(type: "int", nullable: false),
                    ModulId = table.Column<int>(type: "int", nullable: false),
                    NPP = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    UserId = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Nama = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Group = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ApprovalLimit = table.Column<decimal>(type: "decimal(18,2)", nullable: true),
                    UserIdToken = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    TokenExpired = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Keterangan = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CreateDate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    UpdateDate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_DataToken", x => x.Id);
                    table.ForeignKey(
                        name: "FK_DataToken_Kelompok_KelompokId",
                        column: x => x.KelompokId,
                        principalTable: "Kelompok",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_DataToken_Modul_ModulId",
                        column: x => x.ModulId,
                        principalTable: "Modul",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
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
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_AspNetUsers_Unit_UnitId",
                        column: x => x.UnitId,
                        principalTable: "Unit",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "JenisSurat",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nama = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    UnitId = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_JenisSurat", x => x.Id);
                    table.ForeignKey(
                        name: "FK_JenisSurat_Unit_UnitId",
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
                    Nama = table.Column<string>(type: "nvarchar(max)", nullable: true),
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
                name: "Surat",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    TujuanSurat = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    AsalSurat = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    perihal = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    lampiran = table.Column<int>(type: "int", nullable: true),
                    nomorSurat = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    JenisSuratId = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Surat", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Surat_JenisSurat_JenisSuratId",
                        column: x => x.JenisSuratId,
                        principalTable: "JenisSurat",
                        principalColumn: "Id");
                });

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
                    BankId = table.Column<int>(type: "int", nullable: false),
                    NomorRekening = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Nominal = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    CabangId = table.Column<int>(type: "int", nullable: true),
                    TanggalTRX = table.Column<DateTime>(type: "datetime2", nullable: false),
                    TanggalTestkey = table.Column<DateTime>(type: "datetime2", nullable: false),
                    NomorTestkey = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    KeteranganId = table.Column<int>(type: "int", nullable: true),
                    AlasanId = table.Column<int>(type: "int", nullable: true),
                    NominalSeharusnya = table.Column<decimal>(type: "decimal(18,2)", nullable: true),
                    TypeId = table.Column<int>(type: "int", nullable: true),
                    StatusId = table.Column<int>(type: "int", nullable: true),
                    Durasi = table.Column<int>(type: "int", nullable: false),
                    Path = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    TanggalDone = table.Column<DateTime>(type: "datetime2", nullable: true),
                    CreaterId = table.Column<string>(type: "nvarchar(450)", nullable: true),
                    AcceptorId = table.Column<string>(type: "nvarchar(450)", nullable: true),
                    CreateDate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    UpdateDate = table.Column<DateTime>(type: "datetime2", nullable: true),
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
                        name: "FK_T_Kliring_AspNetUsers_AcceptorId",
                        column: x => x.AcceptorId,
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
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
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
                    FollowUp = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Tanggal = table.Column<DateTime>(type: "datetime2", nullable: false),
                    NomorTestkey = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    TypeId = table.Column<int>(type: "int", nullable: true),
                    KeteranganId = table.Column<int>(type: "int", nullable: true),
                    StatusId = table.Column<int>(type: "int", nullable: true),
                    Path = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Durasi = table.Column<int>(type: "int", nullable: true),
                    CreaterId = table.Column<string>(type: "nvarchar(450)", nullable: true),
                    CreatorId = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    AcceptorId = table.Column<string>(type: "nvarchar(450)", nullable: true),
                    CreateDate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    UpdateDate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_T_RTGS", x => x.Id);
                    table.ForeignKey(
                        name: "FK_T_RTGS_AspNetUsers_AcceptorId",
                        column: x => x.AcceptorId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_T_RTGS_AspNetUsers_CreaterId",
                        column: x => x.CreaterId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id");
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
                        name: "FK_T_RTGS_TypeTrans_TypeId",
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
                name: "IX_DataToken_KelompokId",
                table: "DataToken",
                column: "KelompokId");

            migrationBuilder.CreateIndex(
                name: "IX_DataToken_ModulId",
                table: "DataToken",
                column: "ModulId");

            migrationBuilder.CreateIndex(
                name: "IX_JenisSurat_UnitId",
                table: "JenisSurat",
                column: "UnitId");

            migrationBuilder.CreateIndex(
                name: "IX_Surat_JenisSuratId",
                table: "Surat",
                column: "JenisSuratId");

            migrationBuilder.CreateIndex(
                name: "IX_T_Kliring_AcceptorId",
                table: "T_Kliring",
                column: "AcceptorId");

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
                name: "IX_T_Kliring_TypeId",
                table: "T_Kliring",
                column: "TypeId");

            migrationBuilder.CreateIndex(
                name: "IX_T_RTGS_AcceptorId",
                table: "T_RTGS",
                column: "AcceptorId");

            migrationBuilder.CreateIndex(
                name: "IX_T_RTGS_BankId",
                table: "T_RTGS",
                column: "BankId");

            migrationBuilder.CreateIndex(
                name: "IX_T_RTGS_CabangId",
                table: "T_RTGS",
                column: "CabangId");

            migrationBuilder.CreateIndex(
                name: "IX_T_RTGS_CreaterId",
                table: "T_RTGS",
                column: "CreaterId");

            migrationBuilder.CreateIndex(
                name: "IX_T_RTGS_KeteranganId",
                table: "T_RTGS",
                column: "KeteranganId");

            migrationBuilder.CreateIndex(
                name: "IX_T_RTGS_StatusId",
                table: "T_RTGS",
                column: "StatusId");

            migrationBuilder.CreateIndex(
                name: "IX_T_RTGS_TypeId",
                table: "T_RTGS",
                column: "TypeId");

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
                name: "DataToken");

            migrationBuilder.DropTable(
                name: "Libur");

            migrationBuilder.DropTable(
                name: "Surat");

            migrationBuilder.DropTable(
                name: "T_Kliring");

            migrationBuilder.DropTable(
                name: "T_RTGS");

            migrationBuilder.DropTable(
                name: "AspNetRoles");

            migrationBuilder.DropTable(
                name: "Modul");

            migrationBuilder.DropTable(
                name: "JenisSurat");

            migrationBuilder.DropTable(
                name: "Alasan");

            migrationBuilder.DropTable(
                name: "AspNetUsers");

            migrationBuilder.DropTable(
                name: "Bank");

            migrationBuilder.DropTable(
                name: "Cabang");

            migrationBuilder.DropTable(
                name: "Keterangan");

            migrationBuilder.DropTable(
                name: "Status");

            migrationBuilder.DropTable(
                name: "TypeTrans");

            migrationBuilder.DropTable(
                name: "Unit");

            migrationBuilder.DropTable(
                name: "Kelompok");
        }
    }
}
