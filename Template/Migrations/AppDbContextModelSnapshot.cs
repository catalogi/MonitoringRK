﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using Ririn.Data;

#nullable disable

namespace ASK_Core.Migrations
{
    [DbContext(typeof(AppDbContext))]
    partial class AppDbContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "6.0.9")
                .HasAnnotation("Relational:MaxIdentifierLength", 128);

            SqlServerModelBuilderExtensions.UseIdentityColumns(modelBuilder, 1L, 1);

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityRole", b =>
                {
                    b.Property<string>("Id")
                        .HasColumnType("nvarchar(450)");

                    b.Property<string>("ConcurrencyStamp")
                        .IsConcurrencyToken()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Name")
                        .HasMaxLength(256)
                        .HasColumnType("nvarchar(256)");

                    b.Property<string>("NormalizedName")
                        .HasMaxLength(256)
                        .HasColumnType("nvarchar(256)");

                    b.HasKey("Id");

                    b.HasIndex("NormalizedName")
                        .IsUnique()
                        .HasDatabaseName("RoleNameIndex")
                        .HasFilter("[NormalizedName] IS NOT NULL");

                    b.ToTable("AspNetRoles", (string)null);
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityRoleClaim<string>", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"), 1L, 1);

                    b.Property<string>("ClaimType")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("ClaimValue")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("RoleId")
                        .IsRequired()
                        .HasColumnType("nvarchar(450)");

                    b.HasKey("Id");

                    b.HasIndex("RoleId");

                    b.ToTable("AspNetRoleClaims", (string)null);
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUser", b =>
                {
                    b.Property<string>("Id")
                        .HasColumnType("nvarchar(450)");

                    b.Property<int>("AccessFailedCount")
                        .HasColumnType("int");

                    b.Property<string>("ConcurrencyStamp")
                        .IsConcurrencyToken()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Discriminator")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Email")
                        .HasMaxLength(256)
                        .HasColumnType("nvarchar(256)");

                    b.Property<bool>("EmailConfirmed")
                        .HasColumnType("bit");

                    b.Property<bool>("LockoutEnabled")
                        .HasColumnType("bit");

                    b.Property<DateTimeOffset?>("LockoutEnd")
                        .HasColumnType("datetimeoffset");

                    b.Property<string>("NormalizedEmail")
                        .HasMaxLength(256)
                        .HasColumnType("nvarchar(256)");

                    b.Property<string>("NormalizedUserName")
                        .HasMaxLength(256)
                        .HasColumnType("nvarchar(256)");

                    b.Property<string>("PasswordHash")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("PhoneNumber")
                        .HasColumnType("nvarchar(max)");

                    b.Property<bool>("PhoneNumberConfirmed")
                        .HasColumnType("bit");

                    b.Property<string>("SecurityStamp")
                        .HasColumnType("nvarchar(max)");

                    b.Property<bool>("TwoFactorEnabled")
                        .HasColumnType("bit");

                    b.Property<string>("UserName")
                        .HasMaxLength(256)
                        .HasColumnType("nvarchar(256)");

                    b.HasKey("Id");

                    b.HasIndex("NormalizedEmail")
                        .HasDatabaseName("EmailIndex");

                    b.HasIndex("NormalizedUserName")
                        .IsUnique()
                        .HasDatabaseName("UserNameIndex")
                        .HasFilter("[NormalizedUserName] IS NOT NULL");

                    b.ToTable("AspNetUsers", (string)null);

                    b.HasDiscriminator<string>("Discriminator").HasValue("IdentityUser");
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserClaim<string>", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"), 1L, 1);

                    b.Property<string>("ClaimType")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("ClaimValue")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("UserId")
                        .IsRequired()
                        .HasColumnType("nvarchar(450)");

                    b.HasKey("Id");

                    b.HasIndex("UserId");

                    b.ToTable("AspNetUserClaims", (string)null);
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserLogin<string>", b =>
                {
                    b.Property<string>("LoginProvider")
                        .HasColumnType("nvarchar(450)");

                    b.Property<string>("ProviderKey")
                        .HasColumnType("nvarchar(450)");

                    b.Property<string>("ProviderDisplayName")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("UserId")
                        .IsRequired()
                        .HasColumnType("nvarchar(450)");

                    b.HasKey("LoginProvider", "ProviderKey");

                    b.HasIndex("UserId");

                    b.ToTable("AspNetUserLogins", (string)null);
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserRole<string>", b =>
                {
                    b.Property<string>("UserId")
                        .HasColumnType("nvarchar(450)");

                    b.Property<string>("RoleId")
                        .HasColumnType("nvarchar(450)");

                    b.HasKey("UserId", "RoleId");

                    b.HasIndex("RoleId");

                    b.ToTable("AspNetUserRoles", (string)null);
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserToken<string>", b =>
                {
                    b.Property<string>("UserId")
                        .HasColumnType("nvarchar(450)");

                    b.Property<string>("LoginProvider")
                        .HasColumnType("nvarchar(450)");

                    b.Property<string>("Name")
                        .HasColumnType("nvarchar(450)");

                    b.Property<string>("Value")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("UserId", "LoginProvider", "Name");

                    b.ToTable("AspNetUserTokens", (string)null);
                });

            modelBuilder.Entity("Ririn.Models.Master.Alasan", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"), 1L, 1);

                    b.Property<string>("Nama")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("Alasan");
                });

            modelBuilder.Entity("Ririn.Models.Master.Bank", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"), 1L, 1);

                    b.Property<bool?>("IsDeleted")
                        .HasColumnType("bit");

                    b.Property<string>("KodeBIC")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("KodeKliring")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Nama")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("Bank");
                });

            modelBuilder.Entity("Ririn.Models.Master.Cabang", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"), 1L, 1);

                    b.Property<string>("KodeCabang")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Nama")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Sandi")
                        .HasColumnType("nvarchar(max)");

                    b.Property<bool?>("isDeleted")
                        .HasColumnType("bit");

                    b.HasKey("Id");

                    b.ToTable("Cabang");
                });

            modelBuilder.Entity("Ririn.Models.Master.DataToken", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"), 1L, 1);

                    b.Property<decimal?>("ApprovalLimit")
                        .HasColumnType("decimal(18,2)");

                    b.Property<DateTime?>("CreateDate")
                        .HasColumnType("datetime2");

                    b.Property<string>("Group")
                        .HasColumnType("nvarchar(max)");

                    b.Property<bool?>("IsDeleted")
                        .HasColumnType("bit");

                    b.Property<int>("KelompokId")
                        .HasColumnType("int");

                    b.Property<string>("Keterangan")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("ModulId")
                        .HasColumnType("int");

                    b.Property<string>("NPP")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Nama")
                        .HasColumnType("nvarchar(max)");

                    b.Property<DateTime>("TokenExpired")
                        .HasColumnType("datetime2");

                    b.Property<DateTime?>("UpdateDate")
                        .HasColumnType("datetime2");

                    b.Property<string>("UserId")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("UserIdToken")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.HasIndex("KelompokId");

                    b.HasIndex("ModulId");

                    b.ToTable("DataToken");
                });

            modelBuilder.Entity("Ririn.Models.Master.JenisSurat", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"), 1L, 1);

                    b.Property<string>("Nama")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<int?>("TypeId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("TypeId");

                    b.ToTable("JenisSurat");
                });

            modelBuilder.Entity("Ririn.Models.Master.Kelompok", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"), 1L, 1);

                    b.Property<DateTime?>("CreateDate")
                        .HasColumnType("datetime2");

                    b.Property<bool?>("IsDeleted")
                        .HasColumnType("bit");

                    b.Property<string>("Nama")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Singkatan")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<DateTime?>("UpdateDate")
                        .HasColumnType("datetime2");

                    b.HasKey("Id");

                    b.ToTable("Kelompok");
                });

            modelBuilder.Entity("Ririn.Models.Master.Keterangan", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"), 1L, 1);

                    b.Property<string>("Nama")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("Keterangan");
                });

            modelBuilder.Entity("Ririn.Models.Master.Libur", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"), 1L, 1);

                    b.Property<string>("Hari")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Keterangan")
                        .HasColumnType("nvarchar(max)");

                    b.Property<DateTime>("TanggalLibur")
                        .HasColumnType("datetime2");

                    b.HasKey("Id");

                    b.ToTable("Libur");
                });

            modelBuilder.Entity("Ririn.Models.Master.Modul", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"), 1L, 1);

                    b.Property<string>("Nama")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("Modul");
                });

            modelBuilder.Entity("Ririn.Models.Master.Status", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"), 1L, 1);

                    b.Property<string>("Nama")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Warna")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("Status");
                });

            modelBuilder.Entity("Ririn.Models.Master.Surat", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"), 1L, 1);

                    b.Property<string>("AsalSurat")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int?>("JenisSuratId")
                        .HasColumnType("int");

                    b.Property<string>("Lampiran")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("NomorSurat")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Perihal")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("TujuanSurat")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.HasIndex("JenisSuratId");

                    b.ToTable("Surat");
                });

            modelBuilder.Entity("Ririn.Models.Master.TypeTrans", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"), 1L, 1);

                    b.Property<string>("Nama")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int?>("UnitId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("UnitId");

                    b.ToTable("TypeTrans");
                });

            modelBuilder.Entity("Ririn.Models.Master.Unit", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"), 1L, 1);

                    b.Property<DateTime?>("CreateDate")
                        .HasColumnType("datetime2");

                    b.Property<bool?>("IsDeleted")
                        .HasColumnType("bit");

                    b.Property<int?>("KelompokId")
                        .HasColumnType("int");

                    b.Property<string>("Nama")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<DateTime?>("UpdateDate")
                        .HasColumnType("datetime2");

                    b.HasKey("Id");

                    b.HasIndex("KelompokId");

                    b.ToTable("Unit");
                });

            modelBuilder.Entity("Ririn.Models.Transaksi.T_Kliring", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"), 1L, 1);

                    b.Property<string>("AcceptorId")
                        .HasColumnType("nvarchar(450)");

                    b.Property<int?>("AlasanId")
                        .HasColumnType("int");

                    b.Property<int>("BankId")
                        .HasColumnType("int");

                    b.Property<int?>("CabangId")
                        .HasColumnType("int");

                    b.Property<DateTime?>("CreateDate")
                        .HasColumnType("datetime2");

                    b.Property<string>("CreaterId")
                        .HasColumnType("nvarchar(450)");

                    b.Property<int>("Durasi")
                        .HasColumnType("int");

                    b.Property<bool?>("IsDeleted")
                        .HasColumnType("bit");

                    b.Property<int?>("KeteranganId")
                        .HasColumnType("int");

                    b.Property<string>("NamaPenerima")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("NoReferensi")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<decimal>("Nominal")
                        .HasColumnType("decimal(18,2)");

                    b.Property<decimal?>("NominalSeharusnya")
                        .HasColumnType("decimal(18,2)");

                    b.Property<string>("NomorRekening")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("NomorSurat")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("NomorTestkey")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Path")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int?>("StatusId")
                        .HasColumnType("int");

                    b.Property<int?>("SuratId")
                        .HasColumnType("int");

                    b.Property<DateTime?>("TanggalDone")
                        .HasColumnType("datetime2");

                    b.Property<DateTime>("TanggalSurat")
                        .HasColumnType("datetime2");

                    b.Property<DateTime>("TanggalTRX")
                        .HasColumnType("datetime2");

                    b.Property<DateTime>("TanggalTestkey")
                        .HasColumnType("datetime2");

                    b.Property<int?>("TypeId")
                        .HasColumnType("int");

                    b.Property<DateTime?>("UpdateDate")
                        .HasColumnType("datetime2");

                    b.HasKey("Id");

                    b.HasIndex("AcceptorId");

                    b.HasIndex("AlasanId");

                    b.HasIndex("BankId");

                    b.HasIndex("CabangId");

                    b.HasIndex("CreaterId");

                    b.HasIndex("KeteranganId");

                    b.HasIndex("StatusId");

                    b.HasIndex("SuratId");

                    b.HasIndex("TypeId");

                    b.ToTable("T_Kliring");
                });

            modelBuilder.Entity("Ririn.Models.Transaksi.T_RTGS", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"), 1L, 1);

                    b.Property<string>("AcceptorId")
                        .HasColumnType("nvarchar(450)");

                    b.Property<int?>("BankId")
                        .HasColumnType("int");

                    b.Property<int?>("CabangId")
                        .HasColumnType("int");

                    b.Property<DateTime?>("CreateDate")
                        .HasColumnType("datetime2");

                    b.Property<string>("CreaterId")
                        .HasColumnType("nvarchar(450)");

                    b.Property<string>("CreatorId")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int?>("Durasi")
                        .HasColumnType("int");

                    b.Property<string>("FollowUp")
                        .HasColumnType("nvarchar(max)");

                    b.Property<bool?>("IsDeleted")
                        .HasColumnType("bit");

                    b.Property<int?>("KeteranganId")
                        .HasColumnType("int");

                    b.Property<decimal>("Nominal")
                        .HasColumnType("decimal(18,2)");

                    b.Property<string>("NomorSurat")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("NomorTestkey")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Path")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("RelTRN")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<int?>("StatusId")
                        .HasColumnType("int");

                    b.Property<string>("TRN")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<DateTime?>("TanggalDone")
                        .HasColumnType("datetime2");

                    b.Property<DateTime>("TanggalProses")
                        .HasColumnType("datetime2");

                    b.Property<int?>("TypeId")
                        .HasColumnType("int");

                    b.Property<DateTime?>("UpdateDate")
                        .HasColumnType("datetime2");

                    b.HasKey("Id");

                    b.HasIndex("AcceptorId");

                    b.HasIndex("BankId");

                    b.HasIndex("CabangId");

                    b.HasIndex("CreaterId");

                    b.HasIndex("KeteranganId");

                    b.HasIndex("StatusId");

                    b.HasIndex("TypeId");

                    b.ToTable("T_RTGS");
                });

            modelBuilder.Entity("Ririn.Models.Master.User", b =>
                {
                    b.HasBaseType("Microsoft.AspNetCore.Identity.IdentityUser");

                    b.Property<int>("KelompokId")
                        .HasColumnType("int");

                    b.Property<string>("NPP")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Nama")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("UnitId")
                        .HasColumnType("int");

                    b.HasIndex("KelompokId");

                    b.HasIndex("UnitId");

                    b.HasDiscriminator().HasValue("User");
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityRoleClaim<string>", b =>
                {
                    b.HasOne("Microsoft.AspNetCore.Identity.IdentityRole", null)
                        .WithMany()
                        .HasForeignKey("RoleId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserClaim<string>", b =>
                {
                    b.HasOne("Microsoft.AspNetCore.Identity.IdentityUser", null)
                        .WithMany()
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserLogin<string>", b =>
                {
                    b.HasOne("Microsoft.AspNetCore.Identity.IdentityUser", null)
                        .WithMany()
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserRole<string>", b =>
                {
                    b.HasOne("Microsoft.AspNetCore.Identity.IdentityRole", null)
                        .WithMany()
                        .HasForeignKey("RoleId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Microsoft.AspNetCore.Identity.IdentityUser", null)
                        .WithMany()
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("Microsoft.AspNetCore.Identity.IdentityUserToken<string>", b =>
                {
                    b.HasOne("Microsoft.AspNetCore.Identity.IdentityUser", null)
                        .WithMany()
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("Ririn.Models.Master.DataToken", b =>
                {
                    b.HasOne("Ririn.Models.Master.Kelompok", "Kelompok")
                        .WithMany()
                        .HasForeignKey("KelompokId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Ririn.Models.Master.Modul", "Modul")
                        .WithMany()
                        .HasForeignKey("ModulId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Kelompok");

                    b.Navigation("Modul");
                });

            modelBuilder.Entity("Ririn.Models.Master.JenisSurat", b =>
                {
                    b.HasOne("Ririn.Models.Master.TypeTrans", "Type")
                        .WithMany()
                        .HasForeignKey("TypeId");

                    b.Navigation("Type");
                });

            modelBuilder.Entity("Ririn.Models.Master.Surat", b =>
                {
                    b.HasOne("Ririn.Models.Master.JenisSurat", "JenisSurat")
                        .WithMany()
                        .HasForeignKey("JenisSuratId");

                    b.Navigation("JenisSurat");
                });

            modelBuilder.Entity("Ririn.Models.Master.TypeTrans", b =>
                {
                    b.HasOne("Ririn.Models.Master.Unit", "Unit")
                        .WithMany()
                        .HasForeignKey("UnitId");

                    b.Navigation("Unit");
                });

            modelBuilder.Entity("Ririn.Models.Master.Unit", b =>
                {
                    b.HasOne("Ririn.Models.Master.Kelompok", "Kelompok")
                        .WithMany()
                        .HasForeignKey("KelompokId");

                    b.Navigation("Kelompok");
                });

            modelBuilder.Entity("Ririn.Models.Transaksi.T_Kliring", b =>
                {
                    b.HasOne("Ririn.Models.Master.User", "Acceptor")
                        .WithMany()
                        .HasForeignKey("AcceptorId");

                    b.HasOne("Ririn.Models.Master.Alasan", "Alasan")
                        .WithMany()
                        .HasForeignKey("AlasanId");

                    b.HasOne("Ririn.Models.Master.Bank", "Bank")
                        .WithMany()
                        .HasForeignKey("BankId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Ririn.Models.Master.Cabang", "Cabang")
                        .WithMany()
                        .HasForeignKey("CabangId");

                    b.HasOne("Ririn.Models.Master.User", "Creater")
                        .WithMany()
                        .HasForeignKey("CreaterId");

                    b.HasOne("Ririn.Models.Master.Keterangan", "Keterangan")
                        .WithMany()
                        .HasForeignKey("KeteranganId");

                    b.HasOne("Ririn.Models.Master.Status", "Status")
                        .WithMany()
                        .HasForeignKey("StatusId");

                    b.HasOne("Ririn.Models.Master.Surat", "Surat")
                        .WithMany()
                        .HasForeignKey("SuratId");

                    b.HasOne("Ririn.Models.Master.TypeTrans", "Type")
                        .WithMany()
                        .HasForeignKey("TypeId");

                    b.Navigation("Acceptor");

                    b.Navigation("Alasan");

                    b.Navigation("Bank");

                    b.Navigation("Cabang");

                    b.Navigation("Creater");

                    b.Navigation("Keterangan");

                    b.Navigation("Status");

                    b.Navigation("Surat");

                    b.Navigation("Type");
                });

            modelBuilder.Entity("Ririn.Models.Transaksi.T_RTGS", b =>
                {
                    b.HasOne("Ririn.Models.Master.User", "Acceptor")
                        .WithMany()
                        .HasForeignKey("AcceptorId");

                    b.HasOne("Ririn.Models.Master.Bank", "Bank")
                        .WithMany()
                        .HasForeignKey("BankId");

                    b.HasOne("Ririn.Models.Master.Cabang", "Cabang")
                        .WithMany()
                        .HasForeignKey("CabangId");

                    b.HasOne("Ririn.Models.Master.User", "Creater")
                        .WithMany()
                        .HasForeignKey("CreaterId");

                    b.HasOne("Ririn.Models.Master.Keterangan", "Keterangan")
                        .WithMany()
                        .HasForeignKey("KeteranganId");

                    b.HasOne("Ririn.Models.Master.Status", "Status")
                        .WithMany()
                        .HasForeignKey("StatusId");

                    b.HasOne("Ririn.Models.Master.TypeTrans", "Type")
                        .WithMany()
                        .HasForeignKey("TypeId");

                    b.Navigation("Acceptor");

                    b.Navigation("Bank");

                    b.Navigation("Cabang");

                    b.Navigation("Creater");

                    b.Navigation("Keterangan");

                    b.Navigation("Status");

                    b.Navigation("Type");
                });

            modelBuilder.Entity("Ririn.Models.Master.User", b =>
                {
                    b.HasOne("Ririn.Models.Master.Kelompok", "Kelompok")
                        .WithMany()
                        .HasForeignKey("KelompokId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Ririn.Models.Master.Unit", "Unit")
                        .WithMany()
                        .HasForeignKey("UnitId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Kelompok");

                    b.Navigation("Unit");
                });
#pragma warning restore 612, 618
        }
    }
}
