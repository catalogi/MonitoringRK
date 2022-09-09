USE [master]
GO
/****** Object:  Database [MonitoringRK]    Script Date: 07/09/2022 16:34:14 ******/
CREATE DATABASE [MonitoringRK]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MonitoringRK', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MonitoringRK.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MonitoringRK_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MonitoringRK_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MonitoringRK].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MonitoringRK] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MonitoringRK] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MonitoringRK] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MonitoringRK] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MonitoringRK] SET ARITHABORT OFF 
GO
ALTER DATABASE [MonitoringRK] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MonitoringRK] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MonitoringRK] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MonitoringRK] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MonitoringRK] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MonitoringRK] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MonitoringRK] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MonitoringRK] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MonitoringRK] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MonitoringRK] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MonitoringRK] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MonitoringRK] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MonitoringRK] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MonitoringRK] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MonitoringRK] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MonitoringRK] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MonitoringRK] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MonitoringRK] SET RECOVERY FULL 
GO
ALTER DATABASE [MonitoringRK] SET  MULTI_USER 
GO
ALTER DATABASE [MonitoringRK] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MonitoringRK] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MonitoringRK] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MonitoringRK] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MonitoringRK', N'ON'
GO
USE [MonitoringRK]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 07/09/2022 16:34:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Alasan]    Script Date: 07/09/2022 16:34:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alasan](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nama] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Alasan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 07/09/2022 16:34:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 07/09/2022 16:34:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 07/09/2022 16:34:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 07/09/2022 16:34:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 07/09/2022 16:34:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 07/09/2022 16:34:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[Discriminator] [nvarchar](max) NOT NULL,
	[Nama] [nvarchar](max) NULL,
	[NPP] [nvarchar](max) NULL,
	[KelompokId] [int] NULL,
	[UnitId] [int] NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 07/09/2022 16:34:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bank]    Script Date: 07/09/2022 16:34:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bank](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nama] [nvarchar](max) NOT NULL,
	[KodeBIC] [nvarchar](max) NOT NULL,
	[KodeKliring] [nvarchar](max) NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Bank] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cabang]    Script Date: 07/09/2022 16:34:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cabang](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nama] [nvarchar](max) NOT NULL,
	[KodeCabang] [nvarchar](max) NULL,
	[Sandi] [nvarchar](max) NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_Cabang] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DataToken]    Script Date: 07/09/2022 16:34:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataToken](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[KelompokId] [int] NOT NULL,
	[ModulId] [int] NOT NULL,
	[NPP] [nvarchar](max) NULL,
	[UserId] [nvarchar](max) NULL,
	[Nama] [nvarchar](max) NULL,
	[Group] [nvarchar](max) NULL,
	[ApprovalLimit] [decimal](18, 2) NULL,
	[UserIdToken] [nvarchar](max) NOT NULL,
	[TokenExpired] [datetime2](7) NOT NULL,
	[Keterangan] [nvarchar](max) NULL,
	[Createdate] [datetime2](7) NULL,
	[Updatedate] [datetime2](7) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_DataToken] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kelompok]    Script Date: 07/09/2022 16:34:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kelompok](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nama] [nvarchar](max) NOT NULL,
	[Singkatan] [nvarchar](max) NOT NULL,
	[Createdate] [datetime2](7) NULL,
	[Updatedate] [datetime2](7) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Kelompok] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Keterangan]    Script Date: 07/09/2022 16:34:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Keterangan](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nama] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Keterangan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Modul]    Script Date: 07/09/2022 16:34:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modul](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nama] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Modul] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 07/09/2022 16:34:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nama] [nvarchar](max) NOT NULL,
	[Warna] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Kliring]    Script Date: 07/09/2022 16:34:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Kliring](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NomorSurat] [nvarchar](max) NOT NULL,
	[TanggalSurat] [datetime2](7) NOT NULL,
	[NoReferensi] [nvarchar](max) NOT NULL,
	[NamaPenerima] [nvarchar](max) NOT NULL,
	[BankId] [int] NOT NULL,
	[NomorRekening] [nvarchar](max) NOT NULL,
	[Nominal] [decimal](18, 2) NOT NULL,
	[CabangId] [int] NULL,
	[TanggalTRX] [datetime2](7) NOT NULL,
	[TestkeyId] [int] NULL,
	[KeteranganId] [int] NULL,
	[AlasanId] [int] NULL,
	[NominalSeharusnya] [decimal](18, 2) NULL,
	[TypeId] [int] NULL,
	[StatusId] [int] NULL,
	[Durasi] [int] NOT NULL,
	[path] [nvarchar](max) NOT NULL,
	[TanggalDone] [datetime2](7) NULL,
	[Createdate] [datetime2](7) NULL,
	[Updatedate] [datetime2](7) NULL,
	[IsDeleted] [bit] NULL,
	[AcceptorId] [nvarchar](450) NULL,
	[CreaterId] [nvarchar](450) NULL,
 CONSTRAINT [PK_T_Kliring] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_RTGS]    Script Date: 07/09/2022 16:34:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_RTGS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NomorSurat] [nvarchar](max) NOT NULL,
	[TanggalProses] [datetime2](7) NOT NULL,
	[RelTRN] [nvarchar](max) NOT NULL,
	[TRN] [nvarchar](max) NOT NULL,
	[CabangId] [int] NULL,
	[BankId] [int] NULL,
	[Nominal] [decimal](18, 2) NOT NULL,
	[TanggalDone] [datetime2](7) NULL,
	[Followup] [nvarchar](max) NULL,
	[TestkeyId] [int] NULL,
	[TypeId] [int] NULL,
	[KeteranganId] [int] NULL,
	[StatusId] [int] NULL,
	[Createdate] [datetime2](7) NULL,
	[Updatedate] [datetime2](7) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_T_RTGS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Testkey]    Script Date: 07/09/2022 16:34:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Testkey](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Tanggal] [datetime2](7) NOT NULL,
	[NomorTestkey] [nvarchar](max) NOT NULL,
	[KeteranganId] [int] NULL,
	[UnitId] [int] NULL,
	[Createdate] [datetime2](7) NULL,
	[Updatedate] [datetime2](7) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Testkey] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeTrans]    Script Date: 07/09/2022 16:34:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeTrans](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](max) NOT NULL,
	[UnitId] [int] NULL,
 CONSTRAINT [PK_TypeTrans] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unit]    Script Date: 07/09/2022 16:34:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nama] [nvarchar](max) NOT NULL,
	[KelompokId] [int] NULL,
	[Createdate] [datetime2](7) NULL,
	[Updatedate] [datetime2](7) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Unit] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220831082310_InitialCreate', N'6.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220831083611_UpdateModelBank', N'6.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220831085102_UpdateModelCabang', N'6.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220831085411_UpdateModelCabang2', N'6.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220831140713_UpdateModelCabang3', N'6.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220901083750_kliringRTGS', N'6.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220902031921_Kliring', N'6.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220902032543_creater', N'6.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220902032659_createrID', N'6.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220902033030_acc', N'6.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220902034457_accep', N'6.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220907082341_DataToken', N'6.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220907083316_DataTokenRev', N'6.0.8')
GO
SET IDENTITY_INSERT [dbo].[Bank] ON 

INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (1, N'PT. BPD BALI', N'ABALIDBS', N'1290013', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (2, N'THE ROYAL BANK OF SCOTLAND N.V.', N'ABNAIDJA', N'520302', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (3, N'PT. BANK AGRIS berubah menjadi PT. BANK IBK INDONESIA, efektif 24 Sep 2019', N'IBKOIDJA', N'9450305', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (4, N'PT. BRI AGRONIAGA, TBK', N'AGTBIDJA', N'4940014', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (5, N'PT. BANK ANTARDAERAH', N'ANTDIDJD', N'880055', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (6, N'PT. BANK ANZ INDONESIA', N'ANZBIDJX', N'610306', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (7, N'PT. BANK PANIN DUBAI SYARIAH', N'ARFAIDJ1', N'5170016', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (8, N'PT. BANK ARTHA GRAHA INTERNASIONAL, TBK', N'ARTGIDJA', N'370028', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (9, N'PT. ARTAJASA PEMBAYARAN ELEKTRONIK', N'ATJSIDJ2', N'0', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (10, N'PT. BANK ARTOS INDONESIA berubah nama menjadi PT. BANK JAGO Tbk', N'ATOSIDJ1', N'5420025', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (11, N'PT. BANK QNB INDONESIA, TBK', N'AWANIDJA', N'1670015', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (12, N'PT. BANK BUMI ARTA', N'BBAIIDJA', N'760010', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (13, N'PT. BANK PERMATA, TBK', N'BBBAIDJA', N'130475', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (14, N'PT. BANK UOB INDONESIA', N'BBIJIDJA', N'230016', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (15, N'TBK menjadi PT.BANK KB BUKOPIN, TBK', N'BBUKIDJA', N'4410010', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (16, N'PT. BANK CAPITAL INDONESIA', N'BCIAIDJA', N'540308', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (17, N'PT. BANK DANAMON INDONESIA, TBK', N'BDINIDJA', N'110042', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (18, N'PT. BANK SAHABAT SAMPOERNA', N'BDIPIDJ1', N'5230011', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (19, N'PT. BANK DKI', N'BDKIIDJ1', N'1110012', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (20, N'PT. BANK COMMONWEALTH', N'BICNIDJA', N'9500307', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (21, N'PT. BANK INDEX SELINDO', N'BIDXIDJA', N'5550018', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (22, N'KC BANK OF CHINA (HONGKONG) LIMITED', N'BKCHIDJA', N'690300', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (23, N'BANGKOK BANK PUBLIC, CO. LTD.', N'BKKBIDJA', N'400309', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (24, N'PT. BANK MANDIRI (PERSERO), TBK', N'BMRIIDJA', N'80017', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (25, N'PT. BANK MULTI ARTA SENTOSA', N'BMSEIDJA', N'5480010', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (26, N'PT. BANK CIMB NIAGA TBK', N'BNIAIDJA', N'220026', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (27, N'PT. BANK NEGARA INDONESIA (PERSERO), TBK', N'BNINIDJA', N'90010', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (28, N'PT. BANK BNP PARIBAS INDONESIA', N'BNPAIDJA', N'570307', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (29, N'BANK OF AMERICA, N.A.', N'BOFAID2X', N'330101', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (30, N'MUFG BANK, Ltd ', N'BOTKIDJX', N'420305', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (31, N'PT. BANK RESONA PERDANIA', N'BPIAIDJA', N'470300', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (32, N'PT. BANK RAKYAT INDONESIA (PERSERO), TBK', N'BRINIDJA', N'20307', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (33, N'PT BANK WOORI SDR.IND.1906,TBK', N'BSDRIDJA', N'2120027', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (34, N'PT. BANK SYARIAH MANDIRI', N'BSMDIDJA', N'4510017', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (35, N'PT. BPD SUMSEL DAN BABEL', N'BSSPIDSP', N'1200016', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (36, N'PT. BANK TABUNGAN NEGARA (PERSERO), TBK', N'BTANIDJA', N'2000024', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (37, N'PT. BANK TABUNGAN PENSIUNAN NASIONAL (BTPN)', N'SUNIIDJA', N'2130101', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (38, N'PT. BANK MNC INTERNASIONAL TBK', N'BUMIIDJA', N'4850010', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (39, N'PT. BANK BISNIS INTERNASIONAL', N'BUSTIDJ1', N'4590011', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (40, N'PT. BANK MEGA SYARIAH', N'BUTGIDJ1', N'5060016', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (41, N'PT. BANK CENTRAL ASIA, TBK', N'CENAIDJA', N'140397', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (42, N'KC JPMORGAN CHASE BANK, N.A.', N'CHASIDJX', N'320308', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (43, N'PT. BANK JTRUST INDONESIA, TBK', N'CICTIDJA', N'950011', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (44, N'CITIBANK, N.A.', N'CITIIDJX', N'310305', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (45, N'PT. BANK CTBC INDONESIA', N'CTCBIDJA', N'9490307', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (46, N'PT. BANK DBS INDONESIA', N'DBSBIDJA', N'460307', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (47, N'DEUTSCHE BANK, A.G.', N'DEUTIDJA', N'670304', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (48, N'PT. BANK SYARIAH INDONESIA (22 Feb 2021)', N'DJARIDJ1', N'4220051', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (49, N'PT. BANK PEMBANGUNAN DAERAH BANTEN, TBK', N'PDBBIDJ1', N'1370014', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (50, N'PT. BANK FAMA INTERNASIONAL', N'FAMAIDJ1', N'5620029', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (51, N'PT. FINNET INDONESIA', N'FINTIDJ1', N'0', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (52, N'PT. BANK GANESHA', N'GNESIDJA', N'1610017', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (53, N'PT. BANK KEB HANA INDONESIA', N'HNBNIDJA', N'4840017', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (54, N'PT. BANK HARDA INTERNASIONAL', N'HRDAIDJ1', N'5670011', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (55, N'PT. BANK HSBC INDONESIA', N'HSBCIDJA', N'870010', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (56, N'THE HONGKONG AND SHANGHAI BANK ', N'HSHKIDJ1', N'0', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (57, N'PT. BANK MAYBANK INDONESIA, TBK', N'IBBKIDJA', N'160131', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (58, N'PT. BANK ICBC INDONESIA', N'ICBKIDJA', N'1640032', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (59, N'PT. BANK SBI INDONESIA', N'IDMOIDJ1', N'4980016', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (60, N'BANK INDONESIA', N'INDOIDJA', N'0', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (61, N'BANK INDONESIA - PENYELENGGARA RTGS', N'INDOIDJP', N'0', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (62, N'PT. BANK INA PERDANA', N'IAPTIDJA', N'5130014', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (63, N'PT. JALIN PEMBAYARAN NUSANTARA', N'JPNAIDJ1', N'551000012', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (64, N'PT. BANK JASA JAKARTA', N'JSABIDJ1', N'4720014', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (65, N'PT. BANK SEABANK INDONESIA (EFEKTIF 15 Maret 2021)', N'KSEBIDJ1', N'5350014', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (66, N'PT. KUSTODIAN SENTRAL EFEK INDONESIA', N'KSEIIDJ1', N'0', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (67, N'PT. RINTIS SEJAHTERA (PT. RINTIS)', N'RISJIDJ1', N'0', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (68, N'PT. ALTO NETWORK', N'ALTOIDJ1', N'0', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (69, N'LEMBAGA PENJAMIN SIMPANAN', N'BLPSIDJ1', N'0', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (70, N'PT. BANK NATIONALNOBU', N'LFIBIDJ1', N'5030017', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (71, N'PT. BANK DINAR INDONESIA menjadi PT. BANK OKE INDONESIA ', N'LMANIDJ1', N'5260010', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (72, N'PT. BANK AMAR INDONESIA', N'LOMAIDJ1', N'5310012', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (73, N'INDONESIA EXIMBANK', N'LPEIIDJ1', N'0', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (74, N'PT. BANK MASPION INDONESIA', N'MASDIDJ1', N'1570018', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (75, N'PT. BANK MAYAPADA INTERNASIONAL, TBK', N'MAYAIDJA', N'970017', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (76, N'PT. BANK MAYORA', N'MAYOIDJA', N'5530012', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (77, N'PT. BANK MAYBANK SYARIAH INDONESIA', N'MBBEIDJA', N'9470301', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (78, N'PT. BANK CHINA CONSTRUCTION BANK INDONESIA, TBK.', N'MCORIDJA', N'360300', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (79, N'PT. BANK MESTIKA DHARMA', N'MEDHIDS1', N'1510010', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (80, N'PT. BANK SHINHAN INDONESIA', N'MEEKIDJ1', N'1520013', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (81, N'PT. BANK MEGA, TBK', N'MEGAIDJA', N'4260121', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (82, N'PT. BANK MITRA NIAGA', N'MGABIDJ1', N'4910015', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (83, N'PT. BANK MIZUHO INDONESIA', N'MHCCIDJA', N'480303', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (84, N'PT. BANK MUAMALAT INDONESIA, TBK', N'MUABIDJA', N'1470011', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (85, N'PT. BANK OCBC NISP, TBK', N'NISPIDJA', N'280024', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (87, N'PT. BPD ACEH', N'PDACIDJ1', N'0', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (88, N'PT. BPD BENGKULU', N'PDBKIDJ1', N'1330012', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (89, N'PT. BPD PAPUA', N'PDIJIDJ1', N'1320019', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (90, N'PT. BANK JABAR BANTEN, TBK', N'PDJBIDJA', N'1100019', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (91, N'PT. BPD JAWA TENGAH', N'PDJGIDJ1', N'1130348', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (92, N'PT. BPD JAMBI', N'PDJMIDJ1', N'1150014', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (93, N'PT. BPD JAWA TIMUR', N'PDJTIDJ1', N'1140011', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (94, N'PT. BPD KALIMANTAN BARAT', N'PDKBIDJ1', N'1230015', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (95, N'PT. BPD KALIMANTAN TENGAH', N'PDKGIDJ1', N'1250011', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (96, N'PT. BPD KALIMANTAN SELATAN', N'PDKSIDJ1', N'1220012', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (97, N'PT. BPD KALIMANTAN TIMUR dan KALIMANTAN UTARA', N'PDKTIDJ1', N'1240018', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (98, N'PT. BPD LAMPUNG', N'PDLPIDJ1', N'1210051', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (99, N'PT. BPD MALUKU', N'PDMLIDJ1', N'1310016', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (100, N'PT. BPD NUSA TENGGARA BARAT SYARIAH', N'PDNBIDJ1', N'1280010', 0)
GO
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (101, N'PT. BPD NUSA TENGGARA TIMUR', N'PDNTIDJ1', N'1300013', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (102, N'PT. BPD RIAU KEPRI', N'PDRIIDJA', N'1190016', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (103, N'PT. BPD SUMATERA BARAT', N'PDSBIDJ1', N'1180013', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (104, N'PT. BANK SUMUT (BPD SUMUT)', N'PDSUIDJ1', N'1170010', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (105, N'PT. BPD SULAWESI TENGAH', N'PDWGIDJ1', N'1340015', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (106, N'PT. BPD SULAWESI TENGGARA', N'PDWRIDJ1', N'1350018', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (107, N'PT. BANK SULSELBAR', N'PDWSIDJA', N'1260027', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (108, N'PT. BANK SULUT', N'PDWUIDJ1', N'1270017', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (109, N'PT. BPD YOGYAKARTA', N'PDYKIDJ1', N'1120015', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (110, N'PT. PAN INDONESIA BANK', N'PINBIDJA', N'190017', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (111, N'PT. BANK PRIMA MASTER', N'PMASIDJ1', N'5200025', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (112, N'PT. BANK TABUNGAN PENSIUNAN NASIONAL SYARIAH', N'PUBAIDJ1', N'5470017', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (113, N'', N'RABOIDJA', N'890016', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (114, N'PT. BANK OKE INDONESIA (Bank ANDARA 02 Okt 2017)', N'RIPAIDJ1', N'4660019', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (115, N'PT. BANK DIGITAL BCA', N'ROYBIDJ1', N'5010011', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (116, N'PT. BANK SINARMAS, TBK', N'SBJKIDJA', N'1530016', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (117, N'STANDARD CHARTERED BANK', N'SCBLIDJX', N'500306', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (118, N'PT. BANK SYARIAH BUKOPIN', N'SDOBIDJ1', N'5210031', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (119, N'PT. BANK MANDIRI TASPEN ', N'SIHBIDJ1', N'5640012', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (120, N'SKNBI', N'SKNAIDJ1', N'0', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (121, N'PT. BANK SUMITOMO MITSUI INDONESIA ', N'SUNIIDJA', N'450304', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (122, N'PT. BANK VICTORIA SYARIAH', N'SWAGIDJ1', N'4050043', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (123, N'PT. BANK OF INDIA INDONESIA, TBK', N'SWBAIDJ1', N'1460047', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (124, N'PT.BANK ACEH SYARIAH', N'SYACIDJ1', N'1169924', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (125, N'PT. BANK PERMATA, TBK UNIT USAHA SYARIAH', N'SYBBIDJ1', N'139926', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (126, N'PT. BANK DANAMON INDONESIA UNIT USAHA SYARIAH', N'SYBDIDJ1', N'119920', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (127, N'PT. BANK NET INDONESIA SYARIAH', N'SYBKIDJ1', N'9470301', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (128, N'PT. BANK TABUNGAN NEGARA (PERSERO) UNIT USAHA SYARIAH', N'SYBTIDJ1', N'2009928', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (129, N'PT. BANK BCA SYARIAH', N'SYCAIDJ1', N'5360017', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (130, N'PT. BANK DKI UNIT USAHA SYARIAH', N'SYDKIDJ1', N'1119916', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (131, N'PT. BANK JABAR BANTEN SYARIAH', N'SYJBIDJ1', N'4250018', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (132, N'PT. BPD JAWA TENGAH UNIT USAHA SYARIAH', N'SYJGIDJ1', N'1139925', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (133, N'PT. BPD JAMBI UNIT USAHA SYARIAH', N'SYJMIDJ1', N'0', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (134, N'BANK JATIM UNIT USAHA SYARIAH', N'SYJTIDJ1', N'1149928', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (135, N'PT. BPD KALIMANTAN BARAT UNIT USAHA SYARIAH', N'SYKBIDJ1', N'1239922', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (136, N'PT. BPD KALIMANTAN SELATAN UNIT USAHA SYARIAH', N'SYKSIDJ1', N'1229929', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (137, N'PT. BPD KALIMANTAN TIMUR dan KALIMANTAN UTARA UNIT USAHA SYARIAH', N'SYKTIDJ1', N'1249925', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (138, N'PT. BANK CIMB NIAGA, TBK UNIT USAHA SYARIAH', N'SYNAIDJ1', N'229920', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (139, N'PT. BPD NUSA TENGGARA BARAT UNIT USAHA SYARIAH', N'SYNBIDJ1', N'0', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (140, N'PT. BANK BNI SYARIAH', N'SYNIIDJ1', N'4270027', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (141, N'PT. BANK OCBC NISP, TBK UNIT USAHA SYARIAH', N'SYONIDJ1', N'289928', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (142, N'PT. BPD RIAU UNIT USAHA SYARIAH', N'SYRIIDJ1', N'0', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (143, N'PT. BPD SUMATERA BARAT UNIT USAHA SYARIAH', N'SYSBIDJ1', N'1189933', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (144, N'PT. BPD SUMATERA SELATAN DAN BANGKA BELITUNG UNIT USAHA SYARIAH', N'SYSSIDJ1', N'1209923', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (145, N'PT. BANK SUMUT (BPD SUMUT) UNIT USAHA SYARIAH', N'SYSUIDJ1', N'1179927', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (146, N'PT. BANK SINARMAS UNIT USAHA SYARIAH', N'SYTBIDJ1', N'1539923', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (147, N'PT. BPD SULAWESI SELATAN DAN SULAWESI BARAT UNIT USAHA SYARIAH', N'SYWSIDJ1', N'1269947', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (148, N'PT. BPD YOGYAKARTA UNIT USAHA SYARIAH', N'SYYKIDJ1', N'1129922', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (149, N'PT. BANK VICTORIA INTERNASIONAL', N'VICTIDJ1', N'5660018', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (150, N'PT. Bank Neo Commerce, Tbk', N'YUDBIDJ1', N'4900012', 0)
INSERT [dbo].[Bank] ([Id], [Nama], [KodeBIC], [KodeKliring], [IsDeleted]) VALUES (151, N'bank mama kau', N'321', N'123', 0)
SET IDENTITY_INSERT [dbo].[Bank] OFF
GO
SET IDENTITY_INSERT [dbo].[Cabang] ON 

INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1, N'PASAR SIANTAN', N'PASAR SIANTAN', N'02302', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2, N'SEI PINYUH', N'SEI PINYUH', N'02303', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (3, N'GAJAH MADA PONTIANAK', N'GAJAH MADA PONTIANAK', N'02306', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (4, N'SULTAN SYARIF ABDURRAHMAN', N'SULTAN SYARIF ABDURRAHMAN', N'02308', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (5, N'NGABANG', N'NGABANG', N'02309', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (6, N'KUBU RAYA', N'KUBU RAYA', N'02310', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (7, N'SEI JAWI', N'SEI JAWI', N'02360', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (8, N'MEGA MALL', N'MEGA MALL', N'02361', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (9, N'SULTAN MUHAMMAD', N'SULTAN MUHAMMAD', N'02362', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (10, N'PANGLIMA AIM', N'PANGLIMA AIM', N'02363', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (11, N'JERUJU', N'JERUJU', N'02364', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (12, N'MEMPAWAH', N'MEMPAWAH', N'02365', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (13, N'M. YAMIN', N'M. YAMIN', N'02366', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (14, N'KUALA DUA', N'KUALA DUA', N'02367', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (15, N'PALANGKARAYA', N'PALANGKARAYA', N'27800', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (16, N'JL ACHMAD YANI PALANGKARAYA / DARMOSUGONDO', N'JL ACHMAD YANI PALANGKARAYA / DARMOSUGONDO', N'27801', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (17, N'KASONGAN D/H KK. KERENG PANGI', N'KASONGAN D/H KK. KERENG PANGI', N'27804', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (18, N'GUNUNG MAS', N'GUNUNG MAS', N'27807', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (19, N'RAJAWALI PALANGKARAYA', N'RAJAWALI PALANGKARAYA', N'27860', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (20, N'SETH AJI', N'SETH AJI', N'27861', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (21, N'TJILIK RIWUT', N'TJILIK RIWUT', N'27862', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (22, N'RTA MILONO', N'RTA MILONO', N'27863', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (23, N'SINGKAWANG', N'SINGKAWANG', N'15100', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (24, N'BENGKAYANG', N'BENGKAYANG', N'15101', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (25, N'DIPONEGORO SINGKAWANG', N'DIPONEGORO SINGKAWANG', N'15160', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (26, N'ROBAN', N'ROBAN', N'15162', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (27, N'SAMARINDA', N'SAMARINDA', N'18400', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (28, N'TENGGARONG', N'TENGGARONG', N'18401', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (29, N'UNIV. MULAWARMAN', N'UNIV. MULAWARMAN', N'18402', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (30, N'AIR PUTIH', N'AIR PUTIH', N'18403', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (31, N'SUNGAI PINANG DALAM', N'SUNGAI PINANG DALAM', N'18404', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (32, N'SAMARINDA SEBERANG', N'SAMARINDA SEBERANG', N'18405', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (33, N'LOA JANAN', N'LOA JANAN', N'18406', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (34, N'SUTOMO', N'SUTOMO', N'18460', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (35, N'PASAR SEGIRI', N'PASAR SEGIRI', N'18461', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (36, N'A YANI SAMARINDA', N'A YANI SAMARINDA', N'18463', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (37, N'TEPIAN', N'TEPIAN', N'18464', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (38, N'PALARAN', N'PALARAN', N'18465', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (39, N'AW SYAHRANI', N'AW SYAHRANI', N'18466', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (40, N'SENDAWAR', N'SENDAWAR', N'18407', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (41, N'SINTANG ', N'SINTANG ', N'30800', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (42, N'SANGGAU', N'SANGGAU', N'30801', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (43, N'PUTUSSIBAU', N'PUTUSSIBAU', N'30802', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (44, N'NANGA PINOH', N'NANGA PINOH', N'30803', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (45, N'SEKADAU', N'SEKADAU', N'30804', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (46, N'PARINDU', N'PARINDU', N'30805', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (47, N'BALAI KARANGAN', N'BALAI KARANGAN', N'30806', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (48, N'PASAR INPRES SINTANG', N'PASAR INPRES SINTANG', N'30862', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (49, N'SOSOK', N'SOSOK', N'30865', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (50, N'SIMPANG PINOH', N'SIMPANG PINOH', N'30866', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (51, N'SUNGAI AYAK', N'SUNGAI AYAK', N'30867', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (52, N'SAMPIT', N'SAMPIT', N'03500', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (53, N'SAMUDA', N'SAMUDA', N'03501', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (54, N'KUALA PEMBUANG', N'KUALA PEMBUANG', N'03502', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (55, N'PARENGGEAN', N'PARENGGEAN', N'03503', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (56, N'HM ARSYAD', N'HM ARSYAD', N'03560', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (57, N'SAWAHAN', N'SAWAHAN', N'03563', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (58, N'SAMBAS', N'SAMBAS', N'31600', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (59, N'PEMANGKAT', N'PEMANGKAT', N'31601', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (60, N'TEBAS', N'TEBAS', N'31660', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (61, N'TANJUNG REDEB', N'TANJUNG REDEB', N'23400', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (62, N'PASAR ADJI DILAYAS', N'PASAR ADJI DILAYAS', N'23460', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (63, N'TARAKAN', N'TARAKAN', N'22500', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (64, N'PASAR BERINGIN', N'PASAR BERINGIN', N'22501', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (65, N'JUATA PERMAI', N'JUATA PERMAI', N'22560', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (66, N'KUSUMA BANGSA', N'KUSUMA BANGSA', N'22561', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (67, N'KUALA KAPUAS', N'KUALA KAPUAS', N'16600', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (68, N'PULANG PISAU', N'PULANG PISAU', N'16601', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (69, N'TANJUNG SELOR', N'TANJUNG SELOR', N'31800', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (70, N'MALINAU', N'MALINAU', N'31801', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (71, N'TANA TIDUNG', N'TANA TIDUNG', N'31802', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (72, N'WILAYAH  10 - JAKARTA SENAYAN', N'WILAYAH  10 - JAKARTA SENAYAN', N'610', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (73, N'MEGA KUNINGAN D/H DUKUH BAWAH', N'MEGA KUNINGAN D/H DUKUH BAWAH', N'06000', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (74, N'DEPLU RI', N'DEPLU RI', N'06001', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (75, N'WISMA BUMI PUTERA', N'WISMA BUMI PUTERA', N'06002', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (76, N'ALLIANZ TOWER D/H WISMA BUNGA MAS D/H.  KARTIKA PLAZA', N'ALLIANZ TOWER D/H WISMA BUNGA MAS D/H.  KARTIKA PLAZA', N'06003', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (77, N'KCP HUTAMA KARYA TOWER D/H MENARA IMPERIUM D/H ATRIUM MULIA D/H .GEDUNG STAKO', N'KCP HUTAMA KARYA TOWER D/H MENARA IMPERIUM D/H ATRIUM MULIA D/H .GEDUNG STAKO', N'06004', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (78, N'TEMPO SCAN TOWER DH/GRAHA. SURYA INTERNUSA', N'TEMPO SCAN TOWER DH/GRAHA. SURYA INTERNUSA', N'06005', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (79, N'MANGGARAI', N'MANGGARAI', N'06009', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (80, N'WISMA MULIA D/H.  ITC KUNINGAN', N'WISMA MULIA D/H.  ITC KUNINGAN', N'06010', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (81, N'PLAZA SUDIRMAN', N'PLAZA SUDIRMAN', N'06013', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (82, N'THE ENERGY', N'THE ENERGY', N'06014', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (83, N'THE EAST', N'THE EAST', N'06015', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (84, N'MALL AMBASADOR', N'MALL AMBASADOR', N'06016', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (85, N'TELKOM LANDMARK TOWER D/H. RS MRCC', N'TELKOM LANDMARK TOWER D/H. RS MRCC', N'06017', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (86, N'BURSA EFEK INDONESIA D/H. SEMANGGI', N'BURSA EFEK INDONESIA D/H. SEMANGGI', N'06018', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (87, N'SAMPOERNA STRATEGIC', N'SAMPOERNA STRATEGIC', N'06019', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (88, N'SETIA BUDI BUILDING', N'SETIA BUDI BUILDING', N'06022', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (89, N'CHASE PLAZA', N'CHASE PLAZA', N'06024', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (90, N'WTC', N'WTC', N'06060', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (91, N'STASIUN BNI CITY', N'STASIUN BNI CITY', N'06062', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (92, N'JAKARTA PUSAT', N'JAKARTA PUSAT', N'25900', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (93, N'THE SULTAN HOTEL DH HOTEL HILTON', N'THE SULTAN HOTEL DH HOTEL HILTON', N'25901', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (94, N'PASAR TANAH ABANG BLOK A', N'PASAR TANAH ABANG BLOK A', N'25902', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (95, N'PLAZA INDONESIA', N'PLAZA INDONESIA', N'25903', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (96, N'FX SUDIRMAN D/H PLAZA FX STYLE', N'FX SUDIRMAN D/H PLAZA FX STYLE', N'25904', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (97, N'SUDIRMAN PARK', N'SUDIRMAN PARK', N'25905', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (98, N'PASAR TANAH ABANG BLOK B', N'PASAR TANAH ABANG BLOK B', N'25906', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (99, N'WISMA 46', N'WISMA 46', N'25907', 0)
GO
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (100, N'GRAND INDONESIA D/H  ASCOTT ', N'', N'', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (101, N'TANAH ABANG', N'TANAH ABANG', N'25910', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (102, N'PASAR TANAH ABANG', N'PASAR TANAH ABANG', N'25911', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (103, N'THAMRIN CITY', N'THAMRIN CITY', N'25960', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (104, N'METRO TANAH ABANG DH. TANAH ABANG BLOK A1', N'METRO TANAH ABANG DH. TANAH ABANG BLOK A1', N'25961', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (105, N'TANAH ABANG BLOK B2', N'TANAH ABANG BLOK B2', N'25963', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (106, N'TANAH ABANG BLOK A2', N'TANAH ABANG BLOK A2', N'25964', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (107, N'PASAR BENHIL', N'PASAR BENHIL', N'25965', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (108, N'WAHID HASYIM', N'WAHID HASYIM', N'25966', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (109, N'THE CITY CENTRE', N'THE CITY CENTRE', N'25967', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (110, N'GAMA TOWER', N'GAMA TOWER', N'25968', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (111, N'THAMRIN RESIDENCE OFFICE PARK', N'THAMRIN RESIDENCE OFFICE PARK', N'25969', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (112, N'MELAWAI RAYA D/H  KEBAYORAN BARU', N'MELAWAI RAYA D/H  KEBAYORAN BARU', N'02200', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (113, N'KEMANG ', N'', N'', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (114, N'WIJAYA GRAND CENTER', N'WIJAYA GRAND CENTER', N'02204', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (115, N'BLOK M D/H. KALIBATA ', N'', N'', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (116, N'PLN PUSAT', N'PLN PUSAT', N'02206', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (117, N'INFOMEDIA D/H PANGLIMA POLIM', N'INFOMEDIA D/H PANGLIMA POLIM', N'02207', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (118, N'WARUNG BUNCIT', N'WARUNG BUNCIT', N'02208', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (119, N'AMPERA', N'AMPERA', N'02209', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (120, N'PEJATEN VILLAGE', N'PEJATEN VILLAGE', N'02210', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (121, N'BANGKA RAYA', N'BANGKA RAYA', N'02212', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (122, N'RADIO DALAM', N'RADIO DALAM', N'02214', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (123, N'DIGITAL BRANCH PACIFIC PLACE', N'DIGITAL BRANCH PACIFIC PLACE', N'02215', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (124, N'MELAWAI', N'MELAWAI', N'02217', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (125, N'MONGINSIDI D/H CIRANJANG D/H KELAPA GADING  ', N'', N'', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (126, N'MAMPANG', N'MAMPANG', N'02219', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (127, N'DUTA MAS FATMAWATI', N'DUTA MAS FATMAWATI', N'02220', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (128, N'KEMANG RAYA', N'KEMANG RAYA', N'02260', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (129, N'CIPETE', N'CIPETE', N'02261', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (130, N'DUREN TIGA', N'DUREN TIGA', N'02262', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (131, N'KEMENTRIAN PU', N'KEMENTRIAN PU', N'02263', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (132, N'FATMAWATI RAYA', N'FATMAWATI RAYA', N'02264', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (133, N'POLDA METRO JAYA', N'POLDA METRO JAYA', N'02266', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (134, N'MABES POLRI', N'MABES POLRI', N'02267', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (135, N'KEMENTERIAN AGRARIA DAN TATA RUANG/BPN', N'KEMENTERIAN AGRARIA DAN TATA RUANG/BPN', N'02268', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (136, N'MENTENG', N'MENTENG', N'09400', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (137, N'STASIUN K.A. GAMBIR', N'STASIUN K.A. GAMBIR', N'09401', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (138, N'DEPARTEMEN PERTAHANAN ', N'', N'', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (139, N'SABANG', N'SABANG', N'09403', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (140, N'PLAZA MENTENG', N'PLAZA MENTENG', N'09404', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (141, N'CIKINI', N'CIKINI', N'09405', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (142, N'PROKLAMASI', N'PROKLAMASI', N'09460', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (143, N'UNIVERSITAS BUNG KARNO D/H CIKINI GOLD CENTRE', N'UNIVERSITAS BUNG KARNO D/H CIKINI GOLD CENTRE', N'09461', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (144, N'PASAR MAYESTIK', N'PASAR MAYESTIK', N'07600', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (145, N'CIPULIR', N'CIPULIR', N'07602', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (146, N'GANDARIA D/H  RADIO DALAM', N'GANDARIA D/H  RADIO DALAM', N'07604', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (147, N'KEBAYORAN LAMA', N'KEBAYORAN LAMA', N'07605', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (148, N'JOGLO D/H. APARTEMEN PERMATA', N'JOGLO D/H. APARTEMEN PERMATA', N'07606', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (149, N'SENAYAN CITY', N'SENAYAN CITY', N'07609', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (150, N'ITC PERMATA HIJAU', N'ITC PERMATA HIJAU', N'07610', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (151, N'GANDARIA CITY', N'GANDARIA CITY', N'07611', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (152, N'PONDOK INDAH ARTERI', N'PONDOK INDAH ARTERI', N'07612', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (153, N'PONDOK PINANG', N'PONDOK PINANG', N'07613', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (154, N'VETERAN BINTARO D/H STP TRISAKTI ', N'', N'', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (155, N'RS PUSAT PERTAMINA ', N'RS PUSAT PERTAMINA ', N'07660', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (156, N'KREO', N'KREO', N'07661', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (157, N'SANTA', N'SANTA', N'07662', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (158, N'KEBAYORAN ICON D/H CIPADU', N'KEBAYORAN ICON D/H CIPADU', N'07663', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (159, N'PASAR MAYESTIK', N'', N'', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (160, N'DIGITAL BRANCH GANDARIA CITY', N'DIGITAL BRANCH GANDARIA CITY', N'07665', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (161, N'SENAYAN', N'SENAYAN', N'06300', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (162, N'RATU PLAZA', N'RATU PLAZA', N'06304', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (163, N'WISMA GKBI', N'WISMA GKBI', N'06306', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (164, N'KEMDIKBUD', N'KEMDIKBUD', N'06307', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (165, N'BENDUNGAN HILIR D/H GRANADA', N'BENDUNGAN HILIR D/H GRANADA', N'06309', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (166, N'SAMUDERA INDONESIA', N'SAMUDERA INDONESIA', N'06311', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (167, N'PALMERAH', N'PALMERAH', N'06312', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (168, N'MANGGALA WANABHAKTI', N'MANGGALA WANABHAKTI', N'06314', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (169, N'PATRAJASA', N'PATRAJASA', N'06316', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (170, N'PLAZA BP JAMSOSTEK D/H WISMA ARGO MANUNGGAL', N'PLAZA BP JAMSOSTEK D/H WISMA ARGO MANUNGGAL', N'06317', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (171, N'KEMANGGISAN UTAMA RAYA D/H RS GRAHA KEDOYA', N'KEMANGGISAN UTAMA RAYA D/H RS GRAHA KEDOYA', N'06360', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (172, N'RS PELNI D/H PETAMBURAN', N'RS PELNI D/H PETAMBURAN', N'06361', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (173, N'WISMA 77 D/H MENARA CITICON', N'WISMA 77 D/H MENARA CITICON', N'06362', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (174, N'BKPM D/H RS SILOAM KEBON JERUK', N'BKPM D/H RS SILOAM KEBON JERUK', N'06363', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (175, N'KEMANDORAN', N'KEMANDORAN', N'06364', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (176, N'MPR-DPR', N'MPR-DPR', N'06365', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (177, N'GRAND SLIPI TOWER DH GRAND SOHO', N'GRAND SLIPI TOWER DH GRAND SOHO', N'06367', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (178, N'HANG LEKIR D/H PAKUBUWONO', N'HANG LEKIR D/H PAKUBUWONO', N'06368', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (179, N'BNI DIGITAL BRANCH PEJOMPONGAN', N'BNI DIGITAL BRANCH PEJOMPONGAN', N'06369', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (180, N'TEBET', N'TEBET', N'12000', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (181, N'DEPARTEMEN TRANSMIGRASI', N'DEPARTEMEN TRANSMIGRASI', N'12001', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (182, N'BKKBN', N'BKKBN', N'12002', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (183, N'RASUNA SAID', N'RASUNA SAID', N'12003', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (184, N'DEPARTEMEN KESEHATAN', N'DEPARTEMEN KESEHATAN', N'12005', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (185, N'DEPARTEMEN TENAGA KERJA', N'DEPARTEMEN TENAGA KERJA', N'12008', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (186, N'MABES TNI CILANGKAP', N'MABES TNI CILANGKAP', N'12010', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (187, N'DEPARTEMEN KEHAKIMAN', N'DEPARTEMEN KEHAKIMAN', N'12011', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (188, N'ANGKASA HALIM PERDANA KUSUMA', N'ANGKASA HALIM PERDANA KUSUMA', N'12012', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (189, N'LAPANGAN ROS', N'LAPANGAN ROS', N'12013', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (190, N'TEBET BARAT', N'TEBET BARAT', N'12014', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (191, N'TEBET TIMUR', N'TEBET TIMUR', N'12015', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (192, N'MENARA BIDAKARA', N'MENARA BIDAKARA', N'12016', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (193, N'MENARA JAMSOSTEK', N'MENARA JAMSOSTEK', N'12017', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (194, N'EPICENTRUM', N'EPICENTRUM', N'12018', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (195, N'SUCOFINDO', N'SUCOFINDO', N'12019', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (196, N'SMESCO INDONESIA ', N'SMESCO INDONESIA ', N'12021', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (197, N'CENTENNIAL TOWER', N'CENTENNIAL TOWER', N'12022', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (198, N'KALIBATA PASAR MINGGU', N'KALIBATA PASAR MINGGU', N'12023', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (199, N'MENARA MTH D/H MENARA SAIDAH', N'MENARA MTH D/H MENARA SAIDAH', N'12024', 0)
GO
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (200, N'MAMPANG PRAPATAN', N'MAMPANG PRAPATAN', N'12025', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (201, N'SAHARJO', N'SAHARJO', N'12060', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (202, N'KEMENTERIAN KOPERASI DAN UKM D/H KALIBATA CITY', N'KEMENTERIAN KOPERASI DAN UKM D/H KALIBATA CITY', N'12061', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (203, N'MABESAL CILANGKAP', N'MABESAL CILANGKAP', N'12062', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (204, N'FAKULTAS KEDOKTERAN-UKI', N'FAKULTAS KEDOKTERAN-UKI', N'12063', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (205, N'DIGITAL BRANCH KOTA KASABLANKA', N'DIGITAL BRANCH KOTA KASABLANKA', N'12064', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (206, N'BRANTAS ABIPRAYA', N'BRANTAS ABIPRAYA', N'12065', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (207, N'WASKITA KARYA', N'WASKITA KARYA', N'12066', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (208, N'WISMA KORINDO', N'WISMA KORINDO', N'12067', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (209, N'PINANG RANTI', N'PINANG RANTI', N'12068', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (210, N'BULOG', N'BULOG', N'12069', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (211, N'WILAYAH 11 - MANADO', N'WILAYAH 11 - MANADO', N'611', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (212, N'BITUNG', N'BITUNG', N'13900', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (213, N'AIRMADIDI D/H UNIMA ', N'', N'', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (214, N'GIRIAN', N'GIRIAN', N'13960', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (215, N'GORONTALO', N'GORONTALO', N'03900', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (216, N'LIMBOTO', N'LIMBOTO', N'03901', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (217, N'SUDIRMAN GORONTALO D/H IKIP GORONTALO', N'SUDIRMAN GORONTALO D/H IKIP GORONTALO', N'03902', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (218, N'MARISA GORONTALO', N'MARISA GORONTALO', N'03903', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (219, N'KWANDANG', N'KWANDANG', N'03904', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (220, N'TILAMUTA', N'TILAMUTA', N'03905', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (221, N'TELAGA', N'TELAGA', N'03960', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (222, N'KOTAMOBAGU', N'KOTAMOBAGU', N'10600', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (223, N'PARIS MALL DH/ TOTABUAN EX. CPM. A.YANI', N'PARIS MALL DH/ TOTABUAN EX. CPM. A.YANI', N'10601', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (224, N'BOROKO', N'BOROKO', N'10602', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (225, N'TUTUYAN', N'TUTUYAN', N'10603', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (226, N'LOLAK', N'LOLAK', N'10604', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (227, N'LUWUK', N'LUWUK', N'13300', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (228, N'BANGGAI', N'BANGGAI', N'13301', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (229, N'TOILI', N'TOILI', N'13302', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (230, N'BATUI', N'BATUI', N'13360', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (231, N'MANADO', N'MANADO', N'01800', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (232, N'UNSRAT MANADO', N'UNSRAT MANADO', N'01801', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (233, N'WANEA', N'WANEA', N'01806', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (234, N'MEGA MAS D/H.  TELKOM MANADO', N'MEGA MAS D/H.  TELKOM MANADO', N'01807', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (235, N'KANAKA MANADO', N'KANAKA MANADO', N'01810', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (236, N'BANDARA SAM RATULANGI', N'BANDARA SAM RATULANGI', N'01812', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (237, N'BAHU', N'BAHU', N'01813', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (238, N'RANOTANA', N'RANOTANA', N'01860', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (239, N'CALACA', N'CALACA', N'01861', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (240, N'PAAL DUA', N'PAAL DUA', N'01862', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (241, N'MANTOS', N'MANTOS', N'01863', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (242, N'PANIKI', N'PANIKI', N'01815', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (243, N'DIGITAL BRANCH MANADO TOWN SQUARE', N'DIGITAL BRANCH MANADO TOWN SQUARE', N'01866', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (244, N'P A L U', N'P A L U', N'22200', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (245, N'DONGGALA', N'DONGGALA', N'22201', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (246, N'UNTAD PALU', N'UNTAD PALU', N'22202', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (247, N'IMAM BONJOL PALU', N'IMAM BONJOL PALU', N'22203', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (248, N'MASOMBA PALU', N'MASOMBA PALU', N'22204', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (249, N'MANONDA PALU', N'MANONDA PALU', N'22205', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (250, N'SIGI', N'SIGI', N'22206', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (251, N'DEWI SARTIKA PALU', N'DEWI SARTIKA PALU', N'22260', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (252, N'PANTOLOAN', N'PANTOLOAN', N'22261', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (253, N'PARIGI D/H POSO', N'PARIGI D/H POSO', N'06800', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (254, N'TOLAI', N'TOLAI', N'06801', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (255, N'POSO', N'POSO', N'06802', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (256, N'BUNGKU', N'BUNGKU', N'06803', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (257, N'AMPANA', N'AMPANA', N'06804', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (258, N'BAHODOPI', N'BAHODOPI', N'06861', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (259, N'TAHUNA', N'TAHUNA', N'18800', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (260, N'SIAU', N'SIAU', N'18801', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (261, N'TOLI-TOLI', N'TOLI-TOLI', N'19700', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (262, N'BUOL TOLI-TOLI', N'BUOL TOLI-TOLI', N'19701', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (263, N'SONI', N'SONI', N'19702', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (264, N'TERNATE', N'TERNATE', N'09700', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (265, N'SOASIO', N'SOASIO', N'09701', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (266, N'TOBELO', N'TOBELO', N'09702', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (267, N'SOFIFI', N'SOFIFI', N'09703', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (268, N'JAILOLO', N'JAILOLO', N'09704', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (269, N'MOROTAI', N'MOROTAI', N'09705', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (270, N'WEDA', N'WEDA', N'09706', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (271, N'BACAN', N'BACAN', N'09707', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (272, N'JATILAND', N'JATILAND', N'09760', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (273, N'BASTIONG', N'BASTIONG', N'09763', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (274, N'TOMOHON', N'TOMOHON', N'31700', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (275, N'TONDANO', N'TONDANO', N'31701', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (276, N'KAWANGKOAN DH. LANGOWAN', N'KAWANGKOAN DH. LANGOWAN', N'31702', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (277, N'AMURANG', N'AMURANG', N'31703', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (278, N'RATAHAN', N'RATAHAN', N'31704', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (279, N'WILAYAH 12 - JAKARTA KOTA', N'WILAYAH 12 - JAKARTA KOTA', N'612', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (280, N'DAAN MOGOT D/H TOMANG PLAZA ', N'DAAN MOGOT D/H TOMANG PLAZA ', N'23700', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (281, N'GRAHA ELOK MAS D/H GREEN GARDEN', N'GRAHA ELOK MAS D/H GREEN GARDEN', N'23701', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (282, N'TANJUNG DUREN', N'TANJUNG DUREN', N'23702', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (283, N'INTERCON', N'INTERCON', N'23705', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (284, N'TAMAN PALEM', N'TAMAN PALEM', N'23706', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (285, N'DAAN MOGOT BARU', N'DAAN MOGOT BARU', N'23707', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (286, N'SEASON CITY LATUMENTEN', N'SEASON CITY LATUMENTEN', N'23708', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (287, N'PURI KENCANA', N'PURI KENCANA', N'23709', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (288, N'PURI SENTRA NIAGA', N'PURI SENTRA NIAGA', N'23710', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (289, N'GREEN VILLE', N'GREEN VILLE', N'23711', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (290, N'SEMANAN', N'SEMANAN', N'23712', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (291, N'CITY RESORT', N'CITY RESORT', N'23713', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (292, N'CITRA GARDEN 2', N'CITRA GARDEN 2', N'23714', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (293, N'CENTRAL PARK', N'CENTRAL PARK', N'23715', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (294, N'KEMANGGISAN', N'KEMANGGISAN', N'23716', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (295, N'GREEN GARDEN', N'GREEN GARDEN', N'23717', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (296, N'JELAMBAR BARU', N'JELAMBAR BARU', N'23718', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (297, N'MERUYA', N'MERUYA', N'23719', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (298, N'PURI INDAH', N'PURI INDAH', N'23721', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (299, N'KEBON JERUK D/H GRAHA KENCANA', N'KEBON JERUK D/H GRAHA KENCANA', N'23722', 0)
GO
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (300, N'MERCU BUANA', N'MERCU BUANA', N'23723', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (301, N'PURI KEMBANGAN', N'PURI KEMBANGAN', N'23760', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (302, N'POS PENGUMBEN', N'POS PENGUMBEN', N'23761', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (303, N'MERUYA ILIR', N'MERUYA ILIR', N'23763', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (304, N'PESANGGRAHAN', N'PESANGGRAHAN', N'23764', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (305, N'CITRA 2 EXTENTION', N'CITRA 2 EXTENTION', N'23765', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (306, N'TAMAN KENCANA', N'TAMAN KENCANA', N'23766', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (307, N'PASAR CENGKARENG D/H TAMAN SURYA', N'PASAR CENGKARENG D/H TAMAN SURYA', N'23767', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (308, N'GREEN LAKE CITY D/H  GREEN LAKE', N'GREEN LAKE CITY D/H  GREEN LAKE', N'23768', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (309, N'TAMAN RATU', N'TAMAN RATU', N'23769', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (310, N'GRAHA MULTI', N'GRAHA MULTI', N'23770', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (311, N'HARMONI', N'HARMONI', N'07000', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (312, N'SEKRETARIAT NEGARA', N'SEKRETARIAT NEGARA', N'07001', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (313, N'PETOJO', N'PETOJO', N'07002', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (314, N'CIDENG', N'CIDENG', N'07003', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (315, N'UNTAR II', N'UNTAR II', N'07004', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (316, N'UNTARI', N'UNTARI', N'07005', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (317, N'KAMPUS F TRISAKTI', N'KAMPUS F TRISAKTI', N'07006', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (318, N'ABDUL MUIS ', N'ABDUL MUIS ', N'07007', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (319, N'KAMPUS A GEDUNG L TRISAKTI', N'KAMPUS A GEDUNG L TRISAKTI', N'07008', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (320, N'CARINGIN', N'CARINGIN', N'07011', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (321, N'HAYAM WURUK', N'HAYAM WURUK', N'07013', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (322, N'PERUSAHAAN GAS NEGARA', N'PERUSAHAAN GAS NEGARA', N'07014', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (323, N'MANDALA DH/ GEDUNG MANDALA AIR LINE', N'MANDALA DH/ GEDUNG MANDALA AIR LINE', N'07015', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (324, N'GAJAH MADA', N'GAJAH MADA', N'07016', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (325, N'ITC ROXY MAS', N'ITC ROXY MAS', N'07017', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (326, N'KETAPANG BUSINESS CENTRE', N'KETAPANG BUSINESS CENTRE', N'07061', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (327, N'KAMPUS B UNIV. TRISAKTI', N'KAMPUS B UNIV. TRISAKTI', N'07062', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (328, N'GROGOL DHI.KK SUMBER WARAS', N'GROGOL DHI.KK SUMBER WARAS', N'07063', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (329, N'MENARA MERDEKA', N'MENARA MERDEKA', N'07064', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (330, N'JAKARTA KOTA', N'JAKARTA KOTA', N'00100', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (331, N'ANCOL D/H TAMAN IMPIAN JAYA ANCOL', N'ANCOL D/H TAMAN IMPIAN JAYA ANCOL', N'00101', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (332, N'JITC KEMAYORAN', N'JITC KEMAYORAN', N'00103', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (333, N'GLODOK', N'GLODOK', N'00104', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (334, N'HARCO MANGGA DUA', N'HARCO MANGGA DUA', N'00107', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (335, N'LTC GLODOK', N'LTC GLODOK', N'00108', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (336, N'KOBEXINDO DH/ CORDOVA', N'KOBEXINDO DH/ CORDOVA', N'00109', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (337, N'MAHKOTA ANCOL', N'MAHKOTA ANCOL', N'00110', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (338, N'PANGERAN JAYAKARTA', N'PANGERAN JAYAKARTA', N'00111', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (339, N'MANGGA DUA', N'MANGGA DUA', N'00112', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (340, N'ITC MANGGA DUA', N'ITC MANGGA DUA', N'00113', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (341, N'MANGGA DUA MALL', N'MANGGA DUA MALL', N'00160', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (342, N'PINANGSIA', N'PINANGSIA', N'00162', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (343, N'PANCORAN GLODOK', N'PANCORAN GLODOK', N'00163', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (344, N'MANGGA BESAR VIII', N'MANGGA BESAR VIII', N'00164', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (345, N'RAJAWALI', N'RAJAWALI', N'00165', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (346, N'PPKK', N'PPKK', N'00166', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (347, N'PECENONGAN', N'PECENONGAN', N'13000', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (348, N'PASAR BARU JAKARTA', N'PASAR BARU JAKARTA', N'13001', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (349, N'DEPARTEMEN AGAMA', N'DEPARTEMEN AGAMA', N'13002', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (350, N'KREKOT', N'KREKOT', N'13003', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (351, N'DEPARTEMEN KEUANGAN', N'DEPARTEMEN KEUANGAN', N'13004', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (352, N'SAWAH BESAR D/H ASEM REGES', N'SAWAH BESAR D/H ASEM REGES', N'13005', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (353, N'MANGGA BESAR', N'MANGGA BESAR', N'13006', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (354, N'TAMANSARI D/H LOKASARI', N'TAMANSARI D/H LOKASARI', N'13007', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (355, N'GUNUNG SAHARI', N'GUNUNG SAHARI', N'13008', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (356, N'KARANG ANYAR', N'KARANG ANYAR', N'13060', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (357, N'KEMENDAGRI', N'KEMENDAGRI', N'13061', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (358, N'ROA MALAKA', N'ROA MALAKA', N'17200', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (359, N'MUARA KARANG', N'MUARA KARANG', N'17201', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (360, N'PLUIT KENCANA', N'PLUIT KENCANA', N'17202', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (361, N'SUNDA KELAPA ', N'', N'', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (362, N'JEMBATAN LIMA', N'JEMBATAN LIMA', N'17204', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (363, N'BANDENGAN D/H PASAR PAGI', N'BANDENGAN D/H PASAR PAGI', N'17208', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (364, N'CBD PLUIT', N'CBD PLUIT', N'17209', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (365, N'PANTAI INDAH KAPUK', N'PANTAI INDAH KAPUK', N'17210', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (366, N'TELUK GONG', N'TELUK GONG', N'17211', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (367, N'TUBAGUS ANGKE', N'TUBAGUS ANGKE', N'17212', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (368, N'LANDMARK PLUIT D/H PLUIT VILLAGE', N'LANDMARK PLUIT D/H PLUIT VILLAGE', N'17214', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (369, N'MUARA ANGKE', N'MUARA ANGKE', N'17215', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (370, N'ASEMKA', N'ASEMKA', N'17216', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (371, N'ELANG LAUT D/H GALERI NIAGA MEDITERANIA  II', N'ELANG LAUT D/H GALERI NIAGA MEDITERANIA  II', N'17217', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (372, N'KEAGUNGAN', N'KEAGUNGAN', N'17218', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (373, N'PASAR PAGI MANGGA DUA', N'PASAR PAGI MANGGA DUA', N'17260', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (374, N'MUARA KARANG II', N'MUARA KARANG II', N'17261', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (375, N'TAMAN HARAPAN INDAH', N'TAMAN HARAPAN INDAH', N'17263', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (376, N'KAPUK RAYA', N'KAPUK RAYA', N'17264', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (377, N'PERNIAGAAN ASEMKA', N'PERNIAGAAN ASEMKA', N'17265', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (378, N'MUARA BARU', N'MUARA BARU', N'17266', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (379, N'TANJUNG PRIOK', N'TANJUNG PRIOK', N'02400', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (380, N'ADONARA TJ. PRIOK', N'ADONARA TJ. PRIOK', N'02401', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (381, N'SUNTER', N'SUNTER', N'02402', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (382, N'KBN CAKUNG', N'KBN CAKUNG', N'02403', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (383, N'PASAR KOJA', N'PASAR KOJA', N'02404', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (384, N'UTPK KOJA *)', N'UTPK KOJA *)', N'02407', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (385, N'STIP/AIP MARUNDA', N'STIP/AIP MARUNDA', N'02408', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (386, N'PLUMPANG', N'PLUMPANG', N'02409', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (387, N'KBN MARUNDA D/H KAS MOBIL', N'KBN MARUNDA D/H KAS MOBIL', N'02410', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (388, N'BABEK TNI AL', N'BABEK TNI AL', N'02411', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (389, N'SUNTER AGUNG', N'SUNTER AGUNG', N'02414', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (390, N'ENGGANO', N'ENGGANO', N'02415', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (391, N'SUNTER GARDEN', N'SUNTER GARDEN', N'02416', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (392, N'GRIYA UTAMA D/H  STIE IBII', N'GRIYA UTAMA D/H  STIE IBII', N'02417', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (393, N'BP3IP', N'BP3IP', N'02460', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (394, N'SUKAPURA', N'SUKAPURA', N'02461', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (395, N'PADEMANGAN', N'PADEMANGAN', N'02462', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (396, N'KEBON BAWANG', N'KEBON BAWANG', N'02463', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (397, N'PASAR PERMAI', N'PASAR PERMAI', N'02464', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (398, N'KALIBARU', N'KALIBARU', N'02465', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (399, N'SUNTER INDAH', N'SUNTER INDAH', N'02466', 0)
GO
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (400, N'DANAU AGUNG SUNTER', N'DANAU AGUNG SUNTER', N'02469', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (401, N'WILAYAH  14 - JAKARTA BSD', N'WILAYAH  14 - JAKARTA BSD', N'614', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (402, N'BOGOR', N'BOGOR', N'06100', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (403, N'PAJAJARAN D/H IPB BARANGSIANG', N'PAJAJARAN D/H IPB BARANGSIANG', N'06101', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (404, N'IPB DERMAGA', N'IPB DERMAGA', N'06102', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (405, N'TAJUR', N'TAJUR', N'06104', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (406, N'WARUNG JAMBU BOGOR', N'WARUNG JAMBU BOGOR', N'06105', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (407, N'PASAR MERDEKA', N'PASAR MERDEKA', N'06107', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (408, N'CIMANGGU', N'CIMANGGU', N'06109', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (409, N'BARANANGSIANG DH/ PLAZA EKALOKASARI', N'BARANANGSIANG DH/ PLAZA EKALOKASARI', N'06111', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (410, N'PASAR ANYAR', N'PASAR ANYAR', N'06112', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (411, N'LEUWILIANG', N'LEUWILIANG', N'06113', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (412, N'SURYA KENCANA', N'SURYA KENCANA', N'06160', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (413, N'CISARUA', N'CISARUA', N'06162', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (414, N'CILUAR', N'CILUAR', N'06164', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (415, N'SUDIRMAN BOGOR', N'SUDIRMAN BOGOR', N'06165', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (416, N'CIOMAS', N'CIOMAS', N'06167', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (417, N'UNIVERSITAS PAKUAN', N'UNIVERSITAS PAKUAN', N'06168', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (418, N'BUMI SERPONG DAMAI', N'BUMI SERPONG DAMAI', N'31000', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (419, N'LIPPO KARAWACI', N'LIPPO KARAWACI', N'31001', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (420, N'CIKUPA', N'CIKUPA', N'31002', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (421, N'SUTERA NIAGA', N'SUTERA NIAGA', N'31003', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (422, N'BALARAJA', N'BALARAJA', N'31004', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (423, N'CILEDUG', N'CILEDUG', N'31005', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (424, N'GADING SERPONG', N'GADING SERPONG', N'31006', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (425, N'PAHLAWAN SERIBU DH/ VILLA MELATI MAS', N'PAHLAWAN SERIBU DH/ VILLA MELATI MAS', N'31007', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (426, N'PASAR MODERN BSD', N'PASAR MODERN BSD', N'31008', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (427, N'PALEM SEMI D/H BENTON JUNCTION ', N'PALEM SEMI D/H BENTON JUNCTION ', N'31009', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (428, N'BINTARO I ', N'BINTARO I ', N'31010', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (429, N'MENTENG BINTARO D/H PASAR MODERN BINTARO JAYA D/H BINTARO TRADE CENTRE', N'MENTENG BINTARO D/H PASAR MODERN BINTARO JAYA D/H BINTARO TRADE CENTRE', N'31011', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (430, N'LARANGAN', N'LARANGAN', N'31012', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (431, N'RS SILOAM KARAWACI', N'RS SILOAM KARAWACI', N'31060', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (432, N'GRAHA RAYA BINTARO', N'GRAHA RAYA BINTARO', N'31061', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (433, N'ALAM SUTERA', N'ALAM SUTERA', N'31062', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (434, N'GOLDEN VIENNA', N'GOLDEN VIENNA', N'31063', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (435, N'AEON MALL', N'AEON MALL', N'31064', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (436, N'SERPONG', N'SERPONG', N'31065', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (437, N'CIBINONG', N'CIBINONG', N'31300', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (438, N'CILEUNGSI D/H LEUWILIANG', N'CILEUNGSI D/H LEUWILIANG', N'31301', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (439, N'MAYOR OKING', N'MAYOR OKING', N'31302', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (440, N'CITEUREUP', N'CITEUREUP', N'31303', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (441, N'GUNUNG PUTRI', N'GUNUNG PUTRI', N'31304', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (442, N'SENTUL CITY', N'SENTUL CITY', N'31360', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (443, N'CIBINONG CITY CENTER', N'CIBINONG CITY CENTER', N'31362', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (444, N'BOJONG GEDE', N'BOJONG GEDE', N'31363', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (445, N'CILEGON', N'CILEGON', N'12500', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (446, N'MERAK', N'MERAK', N'12501', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (447, N'PT KRAKATAU STEEL', N'PT KRAKATAU STEEL', N'12502', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (448, N'PASAR ANYER', N'PASAR ANYER', N'12503', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (449, N'CILEGON CITY SQUARE', N'CILEGON CITY SQUARE', N'12560', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (450, N'KRAKATAU POSCO', N'KRAKATAU POSCO', N'12561', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (451, N'UBP SURALAYA', N'UBP SURALAYA', N'12562', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (452, N'CILEGON CENTER MALL', N'CILEGON CENTER MALL', N'12563', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (453, N'FATMAWATI', N'FATMAWATI', N'25100', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (454, N'UPN VETERAN PONDOK LABU', N'UPN VETERAN PONDOK LABU', N'25101', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (455, N'CINERE', N'CINERE', N'25102', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (456, N'PAMULANG', N'PAMULANG', N'25103', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (457, N'PASAR MINGGU', N'PASAR MINGGU', N'25104', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (458, N'PONDOK INDAH SHOPP. MALL ', N'', N'', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (459, N'CILANDAK KKO', N'CILANDAK KKO', N'25112', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (460, N'PIM-2 D/H. GRAHA ARSA', N'PIM-2 D/H. GRAHA ARSA', N'25113', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (461, N'BONA INDAH', N'BONA INDAH', N'25115', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (462, N'CINERE BUSINESS CENTER', N'CINERE BUSINESS CENTER', N'25116', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (463, N'PLAZA PONDOK INDAH', N'PLAZA PONDOK INDAH', N'25117', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (464, N'ARKADIA', N'ARKADIA', N'25118', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (465, N'UNIV.ISLAM NEGERI SYARIF HIDAYATULLAH D/H IAIN CIPUTAT', N'UNIV.ISLAM NEGERI SYARIF HIDAYATULLAH D/H IAIN CIPUTAT', N'25119', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (466, N'CIRENDEU', N'CIRENDEU', N'25121', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (467, N'PONDOK CABE', N'PONDOK CABE', N'25160', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (468, N'VETERAN KESEHATAN', N'VETERAN KESEHATAN', N'25161', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (469, N'BINTARO ARCADE', N'BINTARO ARCADE', N'25162', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (470, N'CIPUTAT', N'CIPUTAT', N'25163', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (471, N'PONDOK AREN', N'PONDOK AREN', N'25164', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (472, N'PERTAMINA HULU ENERGI', N'PERTAMINA HULU ENERGI', N'25165', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (473, N'THE MANHATTAN SQUARE', N'THE MANHATTAN SQUARE', N'25120', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (474, N'WISMA PONDOK INDAH', N'WISMA PONDOK INDAH', N'25167', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (475, N'SOUTH QUARTER', N'SOUTH QUARTER', N'25168', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (476, N'RPX CENTER', N'RPX CENTER', N'25169', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (477, N'KEMENTRIAN PERTANIAN', N'KEMENTRIAN PERTANIAN', N'25170', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (478, N'MARGONDA', N'MARGONDA', N'28500', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (479, N'NUSANTARA - DEPOK I', N'NUSANTARA - DEPOK I', N'28501', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (480, N'GRIYA DEPOK ASRI - DEPOK II', N'GRIYA DEPOK ASRI - DEPOK II', N'28502', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (481, N'PARUNG', N'PARUNG', N'28503', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (482, N'TRANSYOGI CIBUBUR', N'TRANSYOGI CIBUBUR', N'28505', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (483, N'CIBUBUR INDAH', N'CIBUBUR INDAH', N'28506', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (484, N'DEPOK TIMUR', N'DEPOK TIMUR', N'28507', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (485, N'PONDOK CINA D/H  R.S. SENTRA MEDIKA', N'PONDOK CINA D/H  R.S. SENTRA MEDIKA', N'28508', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (486, N'CIBUBUR ', N'', N'', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (487, N'DEPOK MAHARAJA', N'DEPOK MAHARAJA', N'28560', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (488, N'PESONA KHAYANGAN', N'PESONA KHAYANGAN', N'28561', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (489, N'CISALAK', N'CISALAK', N'28562', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (490, N'SERANG', N'SERANG', N'04600', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (491, N'PANDEGLANG', N'PANDEGLANG', N'04601', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (492, N'KRAGILAN D/H. TAMBAK ', N'', N'', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (493, N'RANGKASBITUNG', N'RANGKASBITUNG', N'04606', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (494, N'LABUAN', N'LABUAN', N'04607', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (495, N'PASAR RAU', N'PASAR RAU', N'04660', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (496, N'UNTIRTA', N'UNTIRTA', N'04662', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (497, N'CIKANDE', N'CIKANDE', N'04663', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (498, N'SERANG CITY', N'SERANG CITY', N'04664', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (499, N'MALINGPING', N'MALINGPING', N'04667', 0)
GO
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (500, N'TANGERANG', N'TANGERANG', N'08100', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (501, N'CIMONE INDAH', N'CIMONE INDAH', N'08101', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (502, N'MODERN LAND', N'MODERN LAND', N'08102', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (503, N'GAJAH TUNGGAL', N'GAJAH TUNGGAL', N'08107', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (504, N'WISMA NIAGA SOEWARNA', N'WISMA NIAGA SOEWARNA', N'08108', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (505, N'GMF BANDARA S-HATTA', N'GMF BANDARA S-HATTA', N'08109', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (506, N'CARGO AREA', N'CARGO AREA', N'08110', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (507, N'TANGERANG CITY', N'TANGERANG CITY', N'08117', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (508, N'GEDUNG GARUDA BSH', N'GEDUNG GARUDA BSH', N'08118', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (509, N'TERMINAL III BANDARA SOEKARNO - HATTA ', N'TERMINAL III BANDARA SOEKARNO - HATTA ', N'08119', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (510, N'CIPONDOH ', N'CIPONDOH ', N'08121', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (511, N'DUTA GARDENIA ', N'DUTA GARDENIA ', N'08122', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (512, N'KUTABUMI', N'KUTABUMI', N'08123', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (513, N'TERMINAL B BANDARA S-H *)', N'TERMINAL B BANDARA S-H *)', N'08160', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (514, N'TERMINAL F BANDARA S-H *)', N'TERMINAL F BANDARA S-H *)', N'08161', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (515, N'PASAR BARU TANGERANG DH/ TKI SELAPAJANG BANDARA', N'PASAR BARU TANGERANG DH/ TKI SELAPAJANG BANDARA', N'08162', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (516, N'IMAM BONJOL TANGERANG', N'IMAM BONJOL TANGERANG', N'08164', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (517, N'PORIS INDAH', N'PORIS INDAH', N'08165', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (518, N'KI SAMAUN', N'KI SAMAUN', N'08167', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (519, N'KARANG TENGAH', N'KARANG TENGAH', N'08170', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (520, N'PASAR MUTIARA KARAWACI D/H BOROBUDUR', N'PASAR MUTIARA KARAWACI D/H BOROBUDUR', N'08171', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (521, N'CITRA RAYA', N'CITRA RAYA', N'08172', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (522, N'CIMONE CITI MALL', N'CIMONE CITI MALL', N'08173', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (523, N'SRIWIJAYA AIR', N'SRIWIJAYA AIR', N'08174', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (524, N'CURUG', N'CURUG', N'08175', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (525, N'UI  DEPOK', N'UI  DEPOK', N'27300', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (526, N'UI SALEMBA ', N'', N'', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (527, N'UNIVERSITAS PANCASILA', N'UNIVERSITAS PANCASILA', N'27303', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (528, N'JAGAKARSA', N'JAGAKARSA', N'27305', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (529, N'KELAPA DUA', N'KELAPA DUA', N'27306', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (530, N'TANJUNG BARAT', N'TANJUNG BARAT', N'27307', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (531, N'CIGANJUR', N'CIGANJUR', N'27308', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (532, N'UNIVERSITAR GUNADHARMA', N'UNIVERSITAR GUNADHARMA', N'27360', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (533, N'WILAYAH  15 - JAKARTA KEMAYORAN', N'WILAYAH  15 - JAKARTA KEMAYORAN', N'615', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (534, N'BEKASI', N'BEKASI', N'18100', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (535, N'JUANDA D/H COMMERCIAL CENTRE', N'JUANDA D/H COMMERCIAL CENTRE', N'18102', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (536, N'PONDOK GEDE ', N'PONDOK GEDE ', N'18105', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (537, N'TAMAN GALAXY', N'TAMAN GALAXY', N'18106', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (538, N'PONDOK UNGU ', N'', N'', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (539, N'KEMANG PRATAMA', N'KEMANG PRATAMA', N'18110', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (540, N'CITRAGRAND', N'CITRAGRAND', N'18113', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (541, N'HARAPAN INDAH', N'HARAPAN INDAH', N'18114', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (542, N'SUMBER ARTA KALIMALANG', N'SUMBER ARTA KALIMALANG', N'18115', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (543, N'KOTA WISATA', N'KOTA WISATA', N'18116', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (544, N'JATIASIH', N'JATIASIH', N'18117', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (545, N'JATIWARINGIN', N'JATIWARINGIN', N'18118', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (546, N'SUMARECON BEKASI DH/BEKASI SQUARE', N'SUMARECON BEKASI DH/BEKASI SQUARE', N'18119', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (547, N'RAYA HANKAM D/H PLAZA PONDOK GEDE ', N'RAYA HANKAM D/H PLAZA PONDOK GEDE ', N'18120', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (548, N'BOULEVAR HIJAU', N'BOULEVAR HIJAU', N'18123', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (549, N'RAWA LUMBU DH/ PLN RAWA SEMUT', N'RAWA LUMBU DH/ PLN RAWA SEMUT', N'18160', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (550, N'GRAND MALL BEKASI', N'GRAND MALL BEKASI', N'18161', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (551, N'GRAND GALAXY', N'GRAND GALAXY', N'18163', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (552, N'BINTARA', N'BINTARA', N'18165', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (553, N'UNIVERSITAS MERCUBUANA D/H JATI MURNI D/H KRANGGAN', N'UNIVERSITAS MERCUBUANA D/H JATI MURNI D/H KRANGGAN', N'18166', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (554, N'JATI MAKMUR', N'JATI MAKMUR', N'18167', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (555, N'BANTAR GEBANG', N'BANTAR GEBANG', N'18168', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (556, N'JATIBENING', N'JATIBENING', N'18172', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (557, N'JAKARTA GARDEN CITY', N'JAKARTA GARDEN CITY', N'18175', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (558, N'GAMBIR', N'GAMBIR', N'08900', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (559, N'MERDEKA SELATAN', N'MERDEKA SELATAN', N'08901', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (560, N'MNC PLAZA D/H BIMANTARA', N'MNC PLAZA D/H BIMANTARA', N'08902', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (561, N'PERTAMINA PUSAT', N'PERTAMINA PUSAT', N'08903', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (562, N'MH. THAMRIN', N'MH. THAMRIN', N'08904', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (563, N'KWITANG', N'KWITANG', N'08906', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (564, N'KEMENTRIAN KELAUTAN DAN PERIKANAN', N'KEMENTRIAN KELAUTAN DAN PERIKANAN', N'08960', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (565, N'SOPO DEL', N'SOPO DEL', N'08961', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (566, N'JABABEKA', N'JABABEKA', N'31100', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (567, N'BULAK KAPAL', N'BULAK KAPAL', N'31101', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (568, N'CIKARANG', N'CIKARANG', N'31102', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (569, N'LIPPO CIKARANG', N'LIPPO CIKARANG', N'31103', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (570, N'KALIMAS', N'KALIMAS', N'31104', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (571, N'MUTIARA GADING', N'MUTIARA GADING', N'31105', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (572, N'CIKARANG BARU', N'CIKARANG BARU', N'31106', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (573, N'TAMBUN', N'TAMBUN', N'31107', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (574, N'CIKARANG CENTRAL CITY D/H PASAR SENTRAL CIKARANG', N'CIKARANG CENTRAL CITY D/H PASAR SENTRAL CIKARANG', N'31108', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (575, N'RE MARTADINATA D/H SENTRA GROSIR CIKARANG', N'RE MARTADINATA D/H SENTRA GROSIR CIKARANG', N'31160', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (576, N'MM 2100', N'MM 2100', N'31161', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (577, N'CIBITUNG', N'CIBITUNG', N'31162', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (578, N'GRAND WISATA D/H JATIMULYA', N'GRAND WISATA D/H JATIMULYA', N'31163', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (579, N'WISMA ASRI', N'WISMA ASRI', N'31165', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (580, N'DELTA MAS D/H SAKURA PARK', N'DELTA MAS D/H SAKURA PARK', N'31166', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (581, N'JATINEGARA', N'JATINEGARA', N'03700', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (582, N'BKN D/H  KOPERTIS', N'BKN D/H  KOPERTIS', N'03704', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (583, N'PASAR REBO D/H RSUD PASAR REBO', N'PASAR REBO D/H RSUD PASAR REBO', N'03705', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (584, N'JASAMARGA', N'JASAMARGA', N'03706', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (585, N'KANTOR LINGKUNGAN HIDUP', N'KANTOR LINGKUNGAN HIDUP', N'03707', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (586, N'PASAR INDUK KRAMAT JATI D/H  KRAMAT JATI D/H  TARAKANITA', N'PASAR INDUK KRAMAT JATI D/H  KRAMAT JATI D/H  TARAKANITA', N'03708', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (587, N'MATRAMAN', N'MATRAMAN', N'03709', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (588, N'CIPAYUNG D/H BP2TKI D/H. DEWI SARTIKA', N'CIPAYUNG D/H BP2TKI D/H. DEWI SARTIKA', N'03712', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (589, N'TAMINI SQUARE', N'TAMINI SQUARE', N'03713', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (590, N'CIPINANG JAYA', N'CIPINANG JAYA', N'03714', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (591, N'DEWI SARTIKA', N'DEWI SARTIKA', N'03715', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (592, N'CONDET RAYA', N'CONDET RAYA', N'03716', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (593, N'TAMAN MINI INDONESIA INDAH', N'TAMAN MINI INDONESIA INDAH', N'03717', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (594, N'JATINEGARA TRADE CENTRE ', N'', N'', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (595, N'PUSAT GROSIR CILILITAN ', N'', N'', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (596, N'JATINEGARA TIMUR D/H OTISTA', N'JATINEGARA TIMUR D/H OTISTA', N'03762', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (597, N'RS POLRI', N'RS POLRI', N'03763', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (598, N'WIJAYA KARYA', N'WIJAYA KARYA', N'03764', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (599, N'INDOMOBIL TOWER', N'INDOMOBIL TOWER', N'03765', 0)
GO
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (600, N'KELAPA GADING', N'KELAPA GADING', N'30900', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (601, N'BOULEVARD RAYA', N'BOULEVARD RAYA', N'30901', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (602, N'GADING INDAH', N'GADING INDAH', N'30902', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (603, N'GADING RIVIERA', N'GADING RIVIERA', N'30903', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (604, N'WISMA MITRA SUNTER', N'WISMA MITRA SUNTER', N'30904', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (605, N'GADING PANDAWA D/H BUTIK KIRANA D/H. KELAPA GADING D/H . MERDEKA TIMUR', N'GADING PANDAWA D/H BUTIK KIRANA D/H. KELAPA GADING D/H . MERDEKA TIMUR', N'30905', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (606, N'MOI D/H BOULEVARD KELAPA GADING', N'MOI D/H BOULEVARD KELAPA GADING', N'30906', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (607, N'BOULEVARD MENARA GADING', N'BOULEVARD MENARA GADING', N'30907', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (608, N'BOULEVARD TIMUR KELAPA GADING', N'BOULEVARD TIMUR KELAPA GADING', N'30908', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (609, N'ARTHA GADING ', N'', N'', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (610, N'YOS SUDARSO BKI', N'YOS SUDARSO BKI', N'30960', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (611, N'BOULEVARD UTARA', N'BOULEVARD UTARA', N'30961', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (612, N'HERMINA OFFICE TOWER', N'HERMINA OFFICE TOWER', N'30964', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (613, N'KRAMAT', N'KRAMAT', N'01700', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (614, N'HALIM PERDANA KUSUMA', N'HALIM PERDANA KUSUMA', N'01701', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (615, N'ASKES', N'ASKES', N'01702', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (616, N'SENEN', N'SENEN', N'01703', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (617, N'CEMPAKA MAS', N'CEMPAKA MAS', N'01704', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (618, N'DEPARTEMEN SOSIAL D/H  CEMPAKA PUTIH', N'DEPARTEMEN SOSIAL D/H  CEMPAKA PUTIH', N'01707', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (619, N'KEMAYORAN AIRPORT', N'KEMAYORAN AIRPORT', N'01709', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (620, N'GARUDA GUNUNG SAHARI D/H GRAHA SEJAHTERA', N'GARUDA GUNUNG SAHARI D/H GRAHA SEJAHTERA', N'01710', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (621, N'PASAR SENEN JAYA', N'PASAR SENEN JAYA', N'01711', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (622, N'PERCETAKAN NEGARA', N'PERCETAKAN NEGARA', N'01713', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (623, N'KENARI', N'KENARI', N'01760', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (624, N'GARUDA', N'GARUDA', N'01761', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (625, N'RSIA BERKAT IBU', N'RSIA BERKAT IBU', N'01762', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (626, N'RAWASARI', N'RAWASARI', N'01763', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (627, N'CEMPAKA PUTIH', N'CEMPAKA PUTIH', N'01764', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (628, N'PASAR JOHAR ', N'PASAR JOHAR ', N'01765', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (629, N'RSPAD GATOT SUBROTO', N'RSPAD GATOT SUBROTO', N'01766', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (630, N'CEMPAKA PUTIH PERMAI', N'CEMPAKA PUTIH PERMAI', N'01767', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (631, N'PASAR PRAMUKA', N'PASAR PRAMUKA', N'01768', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (632, N'GREEN PRAMUKA', N'GREEN PRAMUKA', N'01769', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (633, N'KARAWANG', N'KARAWANG', N'09500', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (634, N'KOSAMBI D/H. TELAGA SARI KRWG', N'KOSAMBI D/H. TELAGA SARI KRWG', N'09502', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (635, N'RENGASDENGKLOK', N'RENGASDENGKLOK', N'09503', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (636, N'CIKAMPEK', N'CIKAMPEK', N'09505', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (637, N'SUROTOKUNTO', N'SUROTOKUNTO', N'09507', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (638, N'PASAR CIKAMPEK', N'PASAR CIKAMPEK', N'09560', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (639, N'TELAGASARI', N'TELAGASARI', N'09561', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (640, N'KAWASAN INDUSTRI SURYA CIPTA', N'KAWASAN INDUSTRI SURYA CIPTA', N'09562', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (641, N'GALUH MAS', N'GALUH MAS', N'09563', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (642, N'GRAND TARUMA', N'GRAND TARUMA', N'09564', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (643, N'KIIC', N'KIIC', N'09565', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (644, N'RAWAMANGUN', N'RAWAMANGUN', N'24300', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (645, N'UNIV.NEGERI JAKARTA D/H IKIP JKT', N'UNIV.NEGERI JAKARTA D/H IKIP JKT', N'24301', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (646, N'CAKUNG', N'CAKUNG', N'24302', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (647, N'JL. PAUS RAWAMANGUN', N'JL. PAUS RAWAMANGUN', N'24304', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (648, N'PASAR INDUK CIPINANG', N'PASAR INDUK CIPINANG', N'24305', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (649, N'BUARAN', N'BUARAN', N'24306', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (650, N'STMT TRISAKTI D/H KAMPUS C UNIV. TRISAKTI', N'STMT TRISAKTI D/H KAMPUS C UNIV. TRISAKTI', N'24307', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (651, N'PONDOK BAMBU', N'PONDOK BAMBU', N'24308', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (652, N'UNIV. DHARMA PERSADA', N'UNIV. DHARMA PERSADA', N'24309', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (653, N'BALAI PUSTAKA', N'BALAI PUSTAKA', N'24310', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (654, N'PASAR KLENDER', N'PASAR KLENDER', N'24312', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (655, N'JKT. INDUST. ESTATE PL. GADUNG', N'JKT. INDUST. ESTATE PL. GADUNG', N'24313', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (656, N'PONDOK KELAPA', N'PONDOK KELAPA', N'24314', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (657, N'UTAN KAYU', N'UTAN KAYU', N'24315', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (658, N'BILLY MOON - KALIMALANG', N'BILLY MOON - KALIMALANG', N'24316', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (659, N'PASAR SUNAN GIRI', N'PASAR SUNAN GIRI', N'24360', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (660, N'KAMPUNG AMBON', N'KAMPUNG AMBON', N'24361', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (661, N'PENGGILINGAN CAKUNG', N'PENGGILINGAN CAKUNG', N'24362', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (662, N'DUREN SAWIT', N'DUREN SAWIT', N'24363', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (663, N'PAHLAWAN REVOLUSI', N'PAHLAWAN REVOLUSI', N'24364', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (664, N'BIZ PARK', N'BIZ PARK', N'24365', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (665, N'PULOGADUNG TRADE CENTRE', N'PULOGADUNG TRADE CENTRE', N'24366', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (666, N'WILAYAH  16 - PAPUA', N'WILAYAH  16 - PAPUA', N'616', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (667, N'BIAK', N'BIAK', N'29900', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (668, N'NABIRE', N'NABIRE', N'29901', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (669, N'WAROPEN', N'WAROPEN', N'29902', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (670, N'SERUI', N'SERUI', N'29903', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (671, N'PASAR SP NABIRE', N'PASAR SP NABIRE', N'29961', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (672, N'JAYAPURA', N'JAYAPURA', N'26800', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (673, N'SENTANI', N'SENTANI', N'26801', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (674, N'ABEPURA', N'ABEPURA', N'26802', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (675, N'TIMIKA', N'TIMIKA', N'26803', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (676, N'KEEROM', N'KEEROM', N'26804', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (677, N'SARMI', N'SARMI', N'26805', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (678, N'KOYA', N'KOYA', N'26806', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (679, N'WAMENA', N'WAMENA', N'26807', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (680, N'WAENA', N'WAENA', N'26860', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (681, N'KEMIRI SENTANI', N'KEMIRI SENTANI', N'26861', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (682, N'A YANI JAYAPURA', N'A YANI JAYAPURA', N'26862', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (683, N'ENTROP', N'ENTROP', N'26863', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (684, N'YOS SUDARSO', N'YOS SUDARSO', N'26864', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (685, N'KAMORO JAYA D/H SULTAN HASANUDDIN', N'KAMORO JAYA D/H SULTAN HASANUDDIN', N'26865', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (686, N'TANAH HITAM', N'TANAH HITAM', N'26867', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (687, N'DOK V D/H DOK IX', N'DOK V D/H DOK IX', N'26868', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (688, N'JALAN BARU', N'JALAN BARU', N'26869', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (689, N'MERAUKE', N'MERAUKE', N'30000', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (690, N'ASIKI', N'ASIKI', N'30001', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (691, N'UNIVERSITAS MUSAMUS', N'UNIVERSITAS MUSAMUS', N'30060', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (692, N'TANAH MERAH', N'TANAH MERAH', N'30061', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (693, N'MAM D/H MAAM', N'MAM D/H MAAM', N'30062', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (694, N'WAMANGGU', N'WAMANGGU', N'30063', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (695, N'BIA D/H BIO', N'BIA D/H BIO', N'30064', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (696, N'MANOKWARI', N'MANOKWARI', N'29800', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (697, N'BINTUNI', N'BINTUNI', N'29801', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (698, N'KAIMANA', N'KAIMANA', N'29802', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (699, N'PRAFI', N'PRAFI', N'29803', 0)
GO
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (700, N'FAKFAK', N'FAKFAK', N'29804', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (701, N'WOSI', N'WOSI', N'29860', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (702, N'PEMDA PAPUA BARAT', N'PEMDA PAPUA BARAT', N'29862', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (703, N'SORONG', N'SORONG', N'27900', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (704, N'AIMAS', N'AIMAS', N'27901', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (705, N'WAISAI', N'WAISAI', N'27902', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (706, N'TEMINABUAN', N'TEMINABUAN', N'27903', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (707, N'A YANI SORONG', N'A YANI SORONG', N'27960', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (708, N'PASAR BOSWESEN', N'PASAR BOSWESEN', N'27961', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (709, N'WILAYAH 17 - YOGYAKARTA', N'WILAYAH 17 - YOGYAKARTA', N'617', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (710, N'BOYOLALI', N'BOYOLALI', N'31400', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (711, N'AMPEL', N'AMPEL', N'31460', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (712, N'PEMKAB BOYOLALI', N'PEMKAB BOYOLALI', N'31461', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (713, N'KARANG GEDE', N'KARANG GEDE', N'31462', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (714, N'CILACAP', N'CILACAP', N'04400', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (715, N'KROYA', N'KROYA', N'04401', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (716, N'MAJENANG', N'MAJENANG', N'04402', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (717, N'SIDAREJA', N'SIDAREJA', N'04403', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (718, N'GATOT SUBROTO CILACAP', N'GATOT SUBROTO CILACAP', N'04460', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (719, N'SAMPANG', N'SAMPANG', N'04461', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (720, N'KAWUNGANTEN', N'KAWUNGANTEN', N'04462', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (721, N'MT HARYONO', N'MT HARYONO', N'04463', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (722, N'ADIPALA', N'ADIPALA', N'04464', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (723, N'KEBUMEN', N'KEBUMEN', N'07300', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (724, N'GOMBONG', N'GOMBONG', N'07301', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (725, N'PREMBUN', N'PREMBUN', N'07302', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (726, N'SUMPIUH', N'SUMPIUH', N'07360', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (727, N'PETANAHAN', N'PETANAHAN', N'07361', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (728, N'PANJER', N'PANJER', N'07362', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (729, N'KLATEN', N'KLATEN', N'20700', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (730, N'DELANGGU', N'DELANGGU', N'20701', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (731, N'KLATEN KOTA', N'KLATEN KOTA', N'20760', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (732, N'PEDAN', N'PEDAN', N'20761', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (733, N'PRAMBANAN', N'PRAMBANAN', N'20762', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (734, N'JATINOM', N'JATINOM', N'20763', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (735, N'MAGELANG', N'MAGELANG', N'02100', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (736, N'MUNTILAN', N'MUNTILAN', N'02101', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (737, N'MUNGKID', N'MUNGKID', N'02102', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (738, N'TANJUNG', N'TANJUNG', N'02109', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (739, N'REJOWINANGUN', N'REJOWINANGUN', N'02160', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (740, N'METROSQUARE', N'METROSQUARE', N'02161', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (741, N'GRABAG', N'GRABAG', N'02162', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (742, N'PURBALINGGA', N'PURBALINGGA', N'08400', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (743, N'BANJARNEGARA', N'BANJARNEGARA', N'08401', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (744, N'BOBOTSARI D/H KK BOBOT SARI', N'BOBOTSARI D/H KK BOBOT SARI', N'08402', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (745, N'KLAMPOK', N'KLAMPOK', N'08460', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (746, N'PURWOKERTO', N'PURWOKERTO', N'02800', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (747, N'UNSOED', N'UNSOED', N'02801', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (748, N'PASAR WAGE', N'PASAR WAGE', N'02802', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (749, N'WANGON', N'WANGON', N'02803', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (750, N'BUMIAYU', N'BUMIAYU', N'02804', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (751, N'SOKARAJA', N'SOKARAJA', N'02805', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (752, N'AJIBARANG', N'AJIBARANG', N'02806', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (753, N'DUKUHWALUH D/H UNIV. MUHAMMADIYAH PURWOKERTO', N'DUKUHWALUH D/H UNIV. MUHAMMADIYAH PURWOKERTO', N'02861', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (754, N'OVERSTE ISDIMAN D/H RS ELISABETH ', N'OVERSTE ISDIMAN D/H RS ELISABETH ', N'02862', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (755, N'KARANGLEWAS', N'KARANGLEWAS', N'02863', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (756, N'PURWOREJO', N'PURWOREJO', N'13800', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (757, N'KUTOARJO', N'KUTOARJO', N'13801', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (758, N'SURAKARTA', N'SURAKARTA', N'01100', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (759, N'KARANGANYAR', N'KARANGANYAR', N'01101', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (760, N'NUSUKAN', N'NUSUKAN', N'01102', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (761, N'UNIV SEBELAS MARET', N'UNIV SEBELAS MARET', N'01103', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (762, N'SRAGEN', N'SRAGEN', N'01104', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (763, N'KARTASURA', N'KARTASURA', N'01105', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (764, N'KAMPUS UNS', N'KAMPUS UNS', N'01107', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (765, N'SUKOWATI', N'SUKOWATI', N'01109', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (766, N'KK ADI SUCIPTO D/H BANDARA ADI SUMARMO', N'KK ADI SUCIPTO D/H BANDARA ADI SUMARMO', N'01108', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (767, N'GEMOLONG', N'GEMOLONG', N'01161', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (768, N'JATEN', N'JATEN', N'01163', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (769, N'MOJOSONGO', N'MOJOSONGO', N'01165', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (770, N'ADI SOEMARMO', N'ADI SOEMARMO', N'01166', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (771, N'SLAMET RIYADI SOLO D/H PSR. KLEWER', N'SLAMET RIYADI SOLO D/H PSR. KLEWER', N'22700', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (772, N'PASAR LEGI', N'PASAR LEGI', N'22701', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (773, N'PASAR KLEWER', N'PASAR KLEWER', N'22702', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (774, N'UNIV. MUHAMMADIYAH D/H KK. UNIV.MUHAMMADIYAH', N'UNIV. MUHAMMADIYAH D/H KK. UNIV.MUHAMMADIYAH', N'22703', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (775, N'RSI KUSTATI', N'RSI KUSTATI', N'22704', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (776, N'SOLO BARU', N'SOLO BARU', N'22705', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (777, N'SUKOHARJO', N'SUKOHARJO', N'22707', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (778, N'PALUR', N'PALUR', N'22712', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (779, N'VETERAN', N'VETERAN', N'22762', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (780, N'GENTAN', N'GENTAN', N'22764', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (781, N'TEMANGGUNG', N'TEMANGGUNG', N'09600', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (782, N'PARAKAN', N'PARAKAN', N'09601', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (783, N'NGADIREJO', N'NGADIREJO', N'09660', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (784, N'UNIV. GAJAH MADA YOGYAKARTA', N'UNIV. GAJAH MADA YOGYAKARTA', N'22800', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (785, N'SARJANA WIYATA D/H  KUSUMANEGARA', N'SARJANA WIYATA D/H  KUSUMANEGARA', N'22801', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (786, N'SLEMAN', N'SLEMAN', N'22802', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (787, N'JL. GODEAN', N'JL. GODEAN', N'22803', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (788, N'WATES', N'WATES', N'22804', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (789, N'UGM YOGYAKARTA', N'UGM YOGYAKARTA', N'22805', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (790, N'PASAR KOLOMBO', N'PASAR KOLOMBO', N'22806', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (791, N'UNIV. NEGERI YOGYAKARTA', N'UNIV. NEGERI YOGYAKARTA', N'22807', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (792, N'UPN VETERAN', N'UPN VETERAN', N'22808', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (793, N'JL. DIPONEGORO D/H  DIPONEGORO D/H PRIMAGAMA', N'JL. DIPONEGORO D/H  DIPONEGORO D/H PRIMAGAMA', N'22809', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (794, N'PASCA SARJANA UGM D/H PASCA SARJANA UGM', N'PASCA SARJANA UGM D/H PASCA SARJANA UGM', N'22810', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (795, N'UNIV. KRISTEN DUTA WACANA ', N'', N'', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (796, N'KALASAN', N'KALASAN', N'22812', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (797, N'PALAGAN', N'PALAGAN', N'22860', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (798, N'TAJEM', N'TAJEM', N'22861', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (799, N'SUDIRMAN YOGYAKARTA', N'SUDIRMAN YOGYAKARTA', N'22862', 0)
GO
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (800, N'SIDOLUHUR', N'SIDOLUHUR', N'22863', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (801, N'DIGITAL BRANCH HARTONO MALL', N'DIGITAL BRANCH HARTONO MALL', N'22864', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (802, N'SENTOLO', N'SENTOLO', N'22865', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (803, N'WONOGIRI', N'WONOGIRI', N'19100', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (804, N'BATURETNO', N'BATURETNO', N'19101', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (805, N'JATISRONO', N'JATISRONO', N'19102', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (806, N'WONOSOBO', N'WONOSOBO', N'07200', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (807, N'KERTEK', N'KERTEK', N'07201', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (808, N'YOGYAKARTA', N'YOGYAKARTA', N'00400', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (809, N'K.H. A. DAHLAN', N'K.H. A. DAHLAN', N'00401', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (810, N'ADISUCIPTO', N'ADISUCIPTO', N'00402', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (811, N'AMBARUKMO YOGYAKARTA', N'AMBARUKMO YOGYAKARTA', N'00403', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (812, N'WONOSARI', N'WONOSARI', N'00404', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (813, N'JL. PARANGTRITIS D/H. STIE KERJASAMA', N'JL. PARANGTRITIS D/H. STIE KERJASAMA', N'00405', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (814, N'BANTUL', N'BANTUL', N'00406', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (815, N'JL. SUTOYO D/H KK GEDUNG KEUANGAN  NEGARA D/H PBB', N'JL. SUTOYO D/H KK GEDUNG KEUANGAN  NEGARA D/H PBB', N'00407', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (816, N'KOTAGEDE', N'KOTAGEDE', N'00408', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (817, N'JL. MAGELANG', N'JL. MAGELANG', N'00409', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (818, N'BERINGHARJO', N'BERINGHARJO', N'00460', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (819, N'JOGJATRONIK', N'JOGJATRONIK', N'00461', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (820, N'HOS COKROAMINOTO', N'HOS COKROAMINOTO', N'00462', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (821, N'GAMPING', N'GAMPING', N'00463', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (822, N'PIYUNGAN', N'PIYUNGAN', N'00464', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (823, N'TEMON', N'TEMON', N'00465', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (824, N'IMOGIRI TIMUR', N'IMOGIRI TIMUR', N'00466', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (825, N'WILAYAH 18 - MALANG', N'WILAYAH 18 - MALANG', N'618', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (826, N'BRAWIJAYA', N'BRAWIJAYA', N'25300', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (827, N'UNEMA MALANG', N'UNEMA MALANG', N'25301', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (828, N'UNIV. MERDEKA', N'UNIV. MERDEKA', N'25302', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (829, N'ITN-2 TASIKMADU', N'ITN-2 TASIKMADU', N'25303', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (830, N'MALANG TOWN SQUARE', N'MALANG TOWN SQUARE', N'25304', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (831, N'SOEKARNO HATTA MALANG D/H ITN MALANG', N'SOEKARNO HATTA MALANG D/H ITN MALANG', N'25305', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (832, N'PAKIS', N'PAKIS', N'25361', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (833, N'GADANG', N'GADANG', N'25362', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (834, N'LUMAJANG', N'LUMAJANG', N'29200', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (835, N'PASIRIAN', N'PASIRIAN', N'29201', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (836, N'MALANG', N'MALANG', N'12100', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (837, N'UNIV.MUHAMMADYAH', N'UNIV.MUHAMMADYAH', N'12103', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (838, N'BATU', N'BATU', N'12104', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (839, N'KEPANJEN ', N'KEPANJEN ', N'12105', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (840, N'SINGOSARI', N'SINGOSARI', N'12109', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (841, N'PASAR BESAR ', N'PASAR BESAR ', N'12110', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (842, N'BLIMBING', N'BLIMBING', N'12112', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (843, N'SAWOJAJAR', N'SAWOJAJAR', N'12113', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (844, N'LAWANG', N'LAWANG', N'12114', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (845, N'DAMPIT', N'DAMPIT', N'12115', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (846, N'TUREN', N'TUREN', N'12116', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (847, N'SUKUN', N'SUKUN', N'12164', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (848, N'GONDANGLEGI', N'GONDANGLEGI', N'12165', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (849, N'SUNANDAR PS', N'SUNANDAR PS', N'12166', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (850, N'BULULAWANG', N'BULULAWANG', N'12167', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (851, N'PACITAN', N'PACITAN', N'31500', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (852, N'BALE HARJO', N'BALE HARJO', N'31560', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (853, N'PONOROGO', N'PONOROGO', N'28800', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (854, N'SOMOROTO', N'SOMOROTO', N'28805', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (855, N'JETIS', N'JETIS', N'28860', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (856, N'BALONG', N'BALONG', N'28861', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (857, N'PROBOLINGGO', N'PROBOLINGGO', N'10900', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (858, N'KRAKSAAN', N'KRAKSAAN', N'10901', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (859, N'PAITON', N'PAITON', N'10961', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (860, N'PASURUAN', N'PASURUAN', N'21600', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (861, N'BANGIL', N'BANGIL', N'21601', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (862, N'PANDAAN', N'PANDAAN', N'21602', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (863, N'KEJAPANAN', N'KEJAPANAN', N'21603', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (864, N'PURWOSARI', N'PURWOSARI', N'21661', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (865, N'TULUNGAGUNG', N'TULUNGAGUNG', N'24200', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (866, N'TRENGGALEK', N'TRENGGALEK', N'24201', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (867, N'NGUNUT', N'NGUNUT', N'24202', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (868, N'BANDUNG TULUNGAGUNG', N'BANDUNG TULUNGAGUNG', N'24260', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (869, N'IAIN TULUNGAGUNG', N'IAIN TULUNGAGUNG', N'24261', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (870, N'BLITAR', N'BLITAR', N'18300', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (871, N'WLINGI', N'WLINGI', N'18301', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (872, N'SRENGAT', N'SRENGAT', N'18360', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (873, N'SUTOJAYAN', N'SUTOJAYAN', N'18361', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (874, N'KESAMBEN', N'KESAMBEN', N'18362', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (875, N'BANYUWANGI', N'BANYUWANGI', N'09100', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (876, N'GENTENG', N'GENTENG', N'09101', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (877, N'BANTERANG D/H PELABUHAN KETAPANG', N'BANTERANG D/H PELABUHAN KETAPANG', N'09102', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (878, N'MUNCAR', N'MUNCAR', N'09103', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (879, N'ROGOJAMPI', N'ROGOJAMPI', N'09104', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (880, N'JAJAG', N'JAJAG', N'09160', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (881, N'KETAPANG', N'KETAPANG', N'09161', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (882, N'JEMBER', N'JEMBER', N'03000', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (883, N'UNIV. JEMBER', N'UNIV. JEMBER', N'03001', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (884, N'TANGGUL', N'TANGGUL', N'03002', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (885, N'BONDOWOSO', N'BONDOWOSO', N'03004', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (886, N'BALUNG', N'BALUNG', N'03005', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (887, N'PASAR TANJUNG', N'PASAR TANJUNG', N'03006', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (888, N'RAMBIPUJI', N'RAMBIPUJI', N'03062', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (889, N'AMBULU', N'AMBULU', N'03063', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (890, N'KALISAT', N'KALISAT', N'03064', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (891, N'KEDIRI', N'KEDIRI', N'11300', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (892, N'NGANJUK', N'NGANJUK', N'11301', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (893, N'PARE', N'PARE', N'11302', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (894, N'KERTOSONO', N'KERTOSONO', N'11303', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (895, N'REJOSO', N'REJOSO', N'11304', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (896, N'MOJOROTO', N'MOJOROTO', N'11305', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (897, N'PASAR PAHING', N'PASAR PAHING', N'11306', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (898, N'PASAR WATES', N'PASAR WATES', N'11361', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (899, N'WARUJAYENG', N'WARUJAYENG', N'11362', 0)
GO
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (900, N'KANDANGAN', N'KANDANGAN', N'11363', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (901, N'GUDANG GARAM', N'GUDANG GARAM', N'11364', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (902, N'MADIUN', N'MADIUN', N'11900', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (903, N'NGAWI', N'NGAWI', N'11901', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (904, N'MAGETAN', N'MAGETAN', N'11902', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (905, N'PAHLAWAN', N'PAHLAWAN', N'11903', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (906, N'CARUBAN', N'CARUBAN', N'11904', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (907, N'DOLOPO', N'DOLOPO', N'11961', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (908, N'MANTINGAN', N'MANTINGAN', N'11962', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (909, N'SITUBONDO', N'SITUBONDO', N'08200', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (910, N'BESUKI', N'BESUKI', N'08260', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (911, N'', N'', N'', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (912, N'BALIGE', N'BALIGE', N'15600', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (913, N'TARUTUNG', N'TARUTUNG', N'15601', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (914, N'PORSEA D/H SISINGAMANGARAJA', N'PORSEA D/H SISINGAMANGARAJA', N'15602', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (915, N'DOLOK SANGGUL', N'DOLOK SANGGUL', N'15603', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (916, N'PANGURURAN', N'PANGURURAN', N'15604', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (917, N'SIBORONG-BORONG', N'SIBORONG-BORONG', N'15605', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (918, N'BIREUEN', N'BIREUEN', N'10500', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (919, N'GUNUNG SITOLI', N'GUNUNG SITOLI', N'03200', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (920, N'TELUK DALAM', N'TELUK DALAM', N'03201', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (921, N'KABANJAHE', N'KABANJAHE', N'19300', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (922, N'BERASTAGI', N'BERASTAGI', N'19301', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (923, N'PASAR KABANJAHE', N'PASAR KABANJAHE', N'19302', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (924, N'SIDIKALANG', N'SIDIKALANG', N'19303', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (925, N'KAWASAN INDUSTRI MEDAN ', N'KAWASAN INDUSTRI MEDAN ', N'05300', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (926, N'TANJUNG MORAWA', N'TANJUNG MORAWA', N'05302', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (927, N'BELAWAN', N'BELAWAN', N'05303', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (928, N'CEMARA ASRI', N'CEMARA ASRI', N'05305', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (929, N'TEMBUNG', N'TEMBUNG', N'05306', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (930, N'LUBUK PAKAM', N'LUBUK PAKAM', N'05308', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (931, N'MARELAN', N'MARELAN', N'05361', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (932, N'KUALANAMU', N'KUALANAMU', N'05363', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (933, N'KUALA TANJUNG', N'KUALA TANJUNG', N'24000', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (934, N'INDRAPURA', N'INDRAPURA', N'24001', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (935, N'LIMA PULUH', N'LIMA PULUH', N'24002', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (936, N'SEI MANGKEI', N'SEI MANGKEI', N'24060', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (937, N'LANGSA', N'LANGSA', N'09000', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (938, N'LHOKSEUMAWE', N'LHOKSEUMAWE', N'05000', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (939, N'MEULABOH', N'MEULABOH', N'04000', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (940, N'MEDAN', N'MEDAN', N'00600', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (941, N'SISINGAMANGARAJA', N'SISINGAMANGARAJA', N'00602', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (942, N'AKSARA', N'AKSARA', N'00603', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (943, N'SIMPANG LIMUN', N'SIMPANG LIMUN', N'00605', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (944, N'JL KATAMSO', N'JL KATAMSO', N'00606', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (945, N'UNIMED', N'UNIMED', N'00607', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (946, N'PT TELKOM DIVRE I SUMATERA', N'PT TELKOM DIVRE I SUMATERA', N'00608', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (947, N'PLN PIKITRING', N'PLN PIKITRING', N'00609', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (948, N'JALAN SUTOMO MEDAN', N'JALAN SUTOMO MEDAN', N'00611', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (949, N'YOS SUDARSO', N'YOS SUDARSO', N'00612', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (950, N'KESAWAN', N'KESAWAN', N'00613', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (951, N'HM. YAMIN DH/ SUKARAMAI', N'HM. YAMIN DH/ SUKARAMAI', N'00614', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (952, N'JL ASIA', N'JL ASIA', N'00615', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (953, N'KRAKATAU MEDAN', N'KRAKATAU MEDAN', N'00617', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (954, N'PASAR SENTRAL', N'PASAR SENTRAL', N'00660', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (955, N'JUANDA D/H SUDIRMAN', N'JUANDA D/H SUDIRMAN', N'00663', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (956, N'AR HAKIM', N'AR HAKIM', N'00664', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (957, N'PASAR BARU ', N'PASAR BARU ', N'00665', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (958, N'DELI TUA', N'DELI TUA', N'00667', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (959, N'STASIUN KERETA API MEDAN', N'STASIUN KERETA API MEDAN', N'00668', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (960, N'SUMATERA', N'SUMATERA', N'00671', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (961, N'AH NASUTION', N'AH NASUTION', N'00673', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (962, N'GATOT SUBROTO MEDAN', N'GATOT SUBROTO MEDAN', N'00674', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (963, N'KARYA D/H GABION D/H UTPK GABION', N'KARYA D/H GABION D/H UTPK GABION', N'00675', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (964, N'PADANG SIDEMPUAN', N'PADANG SIDEMPUAN', N'08800', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (965, N'PANYABUNGAN', N'PANYABUNGAN', N'08801', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (966, N'SIBUHUAN', N'SIBUHUAN', N'08802', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (967, N'GUNUNG TUA', N'GUNUNG TUA', N'08803', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (968, N'BATANG TORU', N'BATANG TORU', N'08860', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (969, N'PEMATANGSIANTAR', N'PEMATANGSIANTAR', N'09300', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (970, N'PERDAGANGAN', N'PERDAGANGAN', N'09303', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (971, N'HORAS', N'HORAS', N'09304', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (972, N'RAYA', N'RAYA', N'09305', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (973, N'PARAPAT', N'PARAPAT', N'09306', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (974, N'SARIBUDOLOK', N'SARIBUDOLOK', N'09307', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (975, N'SERBELAWAN', N'SERBELAWAN', N'09360', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (976, N'RANTAU PRAPAT', N'RANTAU PRAPAT', N'28200', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (977, N'KOTA PINANG', N'KOTA PINANG', N'28201', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (978, N'AEK KANOPAN', N'AEK KANOPAN', N'28202', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (979, N'CIKAMPAK', N'CIKAMPAK', N'28260', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (980, N'AEK NABARA', N'AEK NABARA', N'28261', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (981, N'SIBOLGA', N'SIBOLGA', N'01200', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (982, N'PANDAN', N'PANDAN', N'01260', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (983, N'SIGLI', N'SIGLI', N'14800', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (984, N'TANJUNG BALAI ASAHAN', N'TANJUNG BALAI ASAHAN', N'06400', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (985, N'KISARAN', N'KISARAN', N'06401', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (986, N'SEI PIRING D/H A YANI ', N'SEI PIRING D/H A YANI ', N'06402', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (987, N'TEBING TINGGI', N'TEBING TINGGI', N'18500', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (988, N'SEI RAMPAH', N'SEI RAMPAH', N'18501', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (989, N'PERBAUNGAN', N'PERBAUNGAN', N'18502', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (990, N'DOLOK MASIHUL', N'DOLOK MASIHUL', N'18561', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (991, N'GALANG', N'GALANG', N'18562', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (992, N'UNIVERSITAS SUMATERA UTARA MEDAN', N'UNIVERSITAS SUMATERA UTARA MEDAN', N'26500', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (993, N'BINJAI', N'BINJAI', N'26501', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (994, N'TOMANG ELOK DH/ SEI SIKAMBING', N'TOMANG ELOK DH/ SEI SIKAMBING', N'26503', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (995, N'BIRO REKTOR USU', N'BIRO REKTOR USU', N'26504', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (996, N'SUNGGAL', N'SUNGGAL', N'26505', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (997, N'SETIABUDI D/H UNIKA ST THOMAS', N'SETIABUDI D/H UNIKA ST THOMAS', N'26506', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (998, N'JL ISKANDAR MUDA', N'JL ISKANDAR MUDA', N'26507', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (999, N'CITRA GARDEN DH. PADANG BULAN', N'CITRA GARDEN DH. PADANG BULAN', N'26508', 0)
GO
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1000, N'BUMI SEROJA INDAH', N'BUMI SEROJA INDAH', N'26509', 0)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1001, N'STABAT', N'STABAT', N'26510', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1002, N'PANGKALAN BRANDAN', N'PANGKALAN BRANDAN', N'26511', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1003, N'GRAHA HELVETIA', N'GRAHA HELVETIA', N'26515', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1004, N'PETISAH', N'PETISAH', N'26516', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1005, N'PLAZA MEDAN FAIR', N'PLAZA MEDAN FAIR', N'26517', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1006, N'DISKI', N'DISKI', N'26565', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1007, N'SIMALINGKAR', N'SIMALINGKAR', N'26566', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1008, N'PASAR PETISAH', N'PASAR PETISAH', N'26567', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1009, N'PASAR SETIA BUDI', N'PASAR SETIA BUDI', N'26568', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1010, N'GAPERTA', N'GAPERTA', N'26569', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1011, N'DIGITAL BRANCH MEDAN FAIR', N'DIGITAL BRANCH MEDAN FAIR', N'26570', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1012, N'WILAYAH 02 - PADANG', N'WILAYAH 02 - PADANG', N'602', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1013, N'BUKITTINGGI', N'BUKITTINGGI', N'05500', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1014, N'PADANG PANJANG', N'PADANG PANJANG', N'05501', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1015, N'AUR KUNING', N'AUR KUNING', N'05502', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1016, N'LUBUK SIKAPING', N'LUBUK SIKAPING', N'05503', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1017, N'LUBUK BASUNG', N'LUBUK BASUNG', N'05504', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1018, N'PASA ATEH D/H PASAR ATAS', N'PASA ATEH D/H PASAR ATAS', N'05560', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1019, N'PADANG LUAR', N'PADANG LUAR', N'05561', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1020, N'SIMPANG AUR', N'SIMPANG AUR', N'05562', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1021, N'BATAM', N'BATAM', N'24500', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1022, N'HANG NADIM', N'HANG NADIM', N'24501', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1023, N'BATAMINDO', N'BATAMINDO', N'24502', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1024, N'HOTEL PLANET HOLIDAY', N'HOTEL PLANET HOLIDAY', N'24503', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1025, N'SEI PANAS', N'SEI PANAS', N'24504', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1026, N'BATAM CENTER DH SUMATERA PROMOTION CENTER', N'BATAM CENTER DH SUMATERA PROMOTION CENTER', N'24505', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1027, N'BATU AJI', N'BATU AJI', N'24507', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1028, N'NAGOYA', N'NAGOYA', N'24508', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1029, N'BOTANIA', N'BOTANIA', N'24509', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1030, N'SEKUPANG', N'SEKUPANG', N'24510', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1031, N'BATU AMPAR', N'BATU AMPAR', N'24560', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1032, N'SP PLAZA', N'SP PLAZA', N'24561', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1033, N'KABIL', N'KABIL', N'24562', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1034, N'NAGOYA HILL', N'NAGOYA HILL', N'24563', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1035, N'BENGKONG', N'BENGKONG', N'24564', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1036, N'SUKAJADI', N'SUKAJADI', N'24565', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1037, N'TIBAN', N'TIBAN', N'24566', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1038, N'UNIVERSITAS BATAM', N'UNIVERSITAS BATAM', N'24567', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1039, N'TANJUNG PIAYU', N'TANJUNG PIAYU', N'24568', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1040, N'BP BATAM', N'BP BATAM', N'24569', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1041, N'PENUIN', N'PENUIN', N'24570', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1042, N'AVIARI', N'AVIARI', N'24571', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1043, N'DUMAI', N'DUMAI', N'05900', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1044, N'BENGKALIS', N'BENGKALIS', N'05901', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1045, N'DURI', N'DURI', N'05902', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1046, N'BAGAN BATU', N'BAGAN BATU', N'05903', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1047, N'BAGAN SIAPI-API', N'BAGAN SIAPI-API', N'05904', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1048, N'PINGGIR', N'PINGGIR', N'05905', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1049, N'SUKAJADI', N'SUKAJADI', N'05960', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1050, N'SUDIRMAN DURI', N'SUDIRMAN DURI', N'05961', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1051, N'PEKANBARU', N'PEKANBARU', N'00800', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1052, N'RUMBAI D/H PT. CALTEX RUMBAI', N'RUMBAI D/H PT. CALTEX RUMBAI', N'00801', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1053, N'NANGKA PEKANBARU', N'NANGKA PEKANBARU', N'00802', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1054, N'PANGKALAN KERINCI', N'PANGKALAN KERINCI', N'00803', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1055, N'SIAK SRI INDRAPURA', N'SIAK SRI INDRAPURA', N'00804', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1056, N'TANGKERANG D/H PASAR PUSAT PEKANBARU', N'TANGKERANG D/H PASAR PUSAT PEKANBARU', N'00806', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1057, N'BANGKINANG', N'BANGKINANG', N'00807', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1058, N'SUKARAMAI PEKANBARU', N'SUKARAMAI PEKANBARU', N'00808', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1059, N'JL. A.YANI PEKANBARU ', N'JL. A.YANI PEKANBARU ', N'00809', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1060, N'JALAN RIAU', N'JALAN RIAU', N'00810', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1061, N'PANAM', N'PANAM', N'00811', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1062, N'PASIR PENGARAIAN', N'PASIR PENGARAIAN', N'00812', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1063, N'UJUNG BATU', N'UJUNG BATU', N'00814', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1064, N'KANDIS', N'KANDIS', N'00815', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1065, N'PERAWANG', N'PERAWANG', N'00816', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1066, N'LIPAT KAIN', N'LIPAT KAIN', N'00817', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1067, N'KASIKAN', N'KASIKAN', N'00813', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1068, N'MARPOYAN', N'MARPOYAN', N'00860', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1069, N'HARAPAN RAYA', N'HARAPAN RAYA', N'00861', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1070, N'ARIFIN AHMAD', N'ARIFIN AHMAD', N'00864', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1071, N'HANGTUAH', N'HANGTUAH', N'00866', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1072, N'ARENGKA', N'ARENGKA', N'00868', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1073, N'PADANG', N'PADANG', N'00900', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1074, N'AIR TAWAR DH UNIV. NEGERI PADANG', N'AIR TAWAR DH UNIV. NEGERI PADANG', N'00901', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1075, N'SITEBA D/H UNIV. BUNG HATTA', N'SITEBA D/H UNIV. BUNG HATTA', N'00902', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1076, N'DOBI', N'DOBI', N'00903', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1077, N'UNIV. ANDALAS D/H PASAR BARU PADANG DH. UNIV. ANDALAS', N'UNIV. ANDALAS D/H PASAR BARU PADANG DH. UNIV. ANDALAS', N'00904', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1078, N'JALAN AHMAD YANI PADANG', N'JALAN AHMAD YANI PADANG', N'00905', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1079, N'BANDAR BUAT D/H TELUK BAYUR', N'BANDAR BUAT D/H TELUK BAYUR', N'00906', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1080, N'PARIAMAN', N'PARIAMAN', N'00907', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1081, N'SIMPANG EMPAT PASAMAN', N'SIMPANG EMPAT PASAMAN', N'00908', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1082, N'PASAR RAYA PADANG', N'PASAR RAYA PADANG', N'00909', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1083, N'LUBUK ALUNG', N'LUBUK ALUNG', N'00910', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1084, N'MENTAWAI', N'MENTAWAI', N'00911', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1085, N'UJUNG GADING PASAMAN', N'UJUNG GADING PASAMAN', N'00912', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1086, N'PAINAN', N'PAINAN', N'00913', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1087, N'BY PASS PADANG', N'BY PASS PADANG', N'00960', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1088, N'VETERAN PADANG', N'VETERAN PADANG', N'00961', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1089, N'HATTA', N'HATTA', N'00963', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1090, N'PAYAKUMBUH', N'PAYAKUMBUH', N'14000', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1091, N'BATUSANGKAR', N'BATUSANGKAR', N'14001', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1092, N'DANGUNG DANGUNG', N'DANGUNG DANGUNG', N'14003', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1093, N'RENGAT', N'RENGAT', N'02700', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1094, N'TELUK KUANTAN', N'TELUK KUANTAN', N'02701', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1095, N'AIR MOLEK', N'AIR MOLEK', N'02702', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1096, N'SOREK', N'SOREK', N'02703', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1097, N'BELILAS', N'BELILAS', N'02704', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1098, N'UKUI', N'UKUI', N'02705', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1099, N'SOLOK', N'SOLOK', N'30400', NULL)
GO
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1100, N'SAWAH LUNTO', N'SAWAH LUNTO', N'30401', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1101, N'KOTOBARU', N'KOTOBARU', N'30402', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1102, N'ALAHAN PANJANG', N'ALAHAN PANJANG', N'30403', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1103, N'MUARO SIJUNJUNG', N'MUARO SIJUNJUNG', N'30404', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1104, N'PADANG ARO', N'PADANG ARO', N'30405', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1105, N'SELAT PANJANG', N'SELAT PANJANG', N'06700', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1106, N'SUNGAI PENUH', N'SUNGAI PENUH', N'17800', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1107, N'KAYU ARO', N'KAYU ARO', N'17801', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1108, N'TEMBILAHAN', N'TEMBILAHAN', N'04500', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1109, N'SUNGAI GUNTUNG D/H PULAU SAMBU', N'SUNGAI GUNTUNG D/H PULAU SAMBU', N'04501', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1110, N'PASAR SUNGAI GUNTUNG', N'PASAR SUNGAI GUNTUNG', N'04502', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1111, N'SUNGAI GANTANG', N'SUNGAI GANTANG', N'04503', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1112, N'KOTABARU', N'KOTABARU', N'04560', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1113, N'RSUP INDUSTRI', N'RSUP INDUSTRI', N'04561', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1114, N'TANJUNG BALAI KARIMUN', N'TANJUNG BALAI KARIMUN', N'05100', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1115, N'TANJUNG BATU', N'TANJUNG BATU', N'05101', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1116, N'MORO', N'MORO', N'05102', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1117, N'SUNGAI LAKAM', N'SUNGAI LAKAM', N'05103', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1118, N'MERAL', N'MERAL', N'05160', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1119, N'TELUK UMA', N'TELUK UMA', N'05162', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1120, N'TANJUNG PINANG', N'TANJUNG PINANG', N'02000', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1121, N'TAREMPA NATUNA', N'TAREMPA NATUNA', N'02001', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1122, N'TANJUNG UBAN', N'TANJUNG UBAN', N'02002', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1123, N'BINTAN CENTER', N'BINTAN CENTER', N'02003', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1124, N'WIRATNO', N'WIRATNO', N'02004', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1125, N'KIJANG', N'KIJANG', N'02006', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1126, N'DABO SINGKEP', N'DABO SINGKEP', N'02005', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1127, N'NATUNA', N'NATUNA', N'02008', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1128, N'WILAYAH 03 - PALEMBANG', N'WILAYAH 03 - PALEMBANG', N'603', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1129, N'SENTRA WILAYAH 03', N'SENTRA WILAYAH 03', N'603', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1130, N'BENGKULU', N'BENGKULU', N'22300', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1131, N'MANNA', N'MANNA', N'22301', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1132, N'CURUP', N'CURUP', N'22302', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1133, N'ARGAMAKMUR', N'ARGAMAKMUR', N'22303', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1134, N'PASAR PANORAMA', N'PASAR PANORAMA', N'22304', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1135, N'PENARIK', N'PENARIK', N'22305', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1136, N'BINTUHAN', N'BINTUHAN', N'22307', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1137, N'KEPAHIANG', N'KEPAHIANG', N'22310', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1138, N'KETAHUN', N'KETAHUN', N'22311', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1139, N'UNIVERSITAS BENGKULU', N'UNIVERSITAS BENGKULU', N'22362', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1140, N'PAGAR DEWA', N'PAGAR DEWA', N'22363', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1141, N'BANGKO', N'BANGKO', N'28000', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1142, N'SAROLANGUN', N'SAROLANGUN', N'28001', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1143, N'HITAM ULU', N'HITAM ULU', N'28002', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1144, N'SINGKUT', N'SINGKUT', N'28060', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1145, N'BATURAJA', N'BATURAJA', N'29500', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1146, N'MUARA DUA', N'MUARA DUA', N'29501', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1147, N'BELITANG', N'BELITANG', N'29502', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1148, N'MARTAPURA', N'MARTAPURA', N'29503', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1149, N'JAMBI', N'JAMBI', N'00300', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1150, N'ABADI', N'ABADI', N'00301', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1151, N'SIMPANG SIPIN', N'SIMPANG SIPIN', N'00302', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1152, N'THE HOK', N'THE HOK', N'00303', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1153, N'SENGETI', N'SENGETI', N'00304', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1154, N'MUARA BULIAN', N'MUARA BULIAN', N'00305', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1155, N'ABUNJANI D/H PATTIMURA', N'ABUNJANI D/H PATTIMURA', N'00361', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1156, N'SELINCAH D/H ANGSO DUO', N'SELINCAH D/H ANGSO DUO', N'00362', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1157, N'TALANG BANJAR', N'TALANG BANJAR', N'00363', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1158, N'KAYU AGUNG', N'KAYU AGUNG', N'29300', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1159, N'TUGUMULYO', N'TUGUMULYO', N'29301', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1160, N'KUALA TUNGKAL', N'KUALA TUNGKAL', N'04800', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1161, N'MUARA SABAK', N'MUARA SABAK', N'04801', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1162, N'KOTABUMI', N'KOTABUMI', N'11600', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1163, N'BUKIT KEMUNING', N'BUKIT KEMUNING', N'11601', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1164, N'LIWA', N'LIWA', N'11602', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1165, N'BARADATU', N'BARADATU', N'11603', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1166, N'KRUI', N'KRUI', N'11604', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1167, N'BUNGA MAYANG', N'BUNGA MAYANG', N'11660', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1168, N'DAYA MURNI', N'DAYA MURNI', N'11661', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1169, N'LUBUK LINGGAU', N'LUBUK LINGGAU', N'20400', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1170, N'LAHAT', N'LAHAT', N'20402', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1171, N'PAGAR ALAM', N'PAGAR ALAM', N'20403', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1172, N'EMPAT LAWANG', N'EMPAT LAWANG', N'20404', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1173, N'MURATARA D/H MUARA RUPIT', N'MURATARA D/H MUARA RUPIT', N'20405', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1174, N'MUSI RAWAS D/H TUGUMULYO', N'MUSI RAWAS D/H TUGUMULYO', N'20406', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1175, N'SIMPANG PERIUK', N'SIMPANG PERIUK', N'20460', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1176, N'METRO', N'METRO', N'28900', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1177, N'BANDAR JAYA', N'BANDAR JAYA', N'28901', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1178, N'TULANG BAWANG', N'TULANG BAWANG', N'28902', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1179, N'WAY JEPARA', N'WAY JEPARA', N'28903', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1180, N'MESUJI', N'MESUJI', N'28904', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1181, N'MUARA BUNGO', N'MUARA BUNGO', N'30300', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1182, N'RIMBO BUJANG', N'RIMBO BUJANG', N'30301', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1183, N'JUJUHAN', N'JUJUHAN', N'30302', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1184, N'KUAMANG KUNING', N'KUAMANG KUNING', N'30303', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1185, N'MUSI PALEMBANG', N'MUSI PALEMBANG', N'11100', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1186, N'PASAR BETUNG', N'PASAR BETUNG', N'11101', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1187, N'SUNGAI LILIN', N'SUNGAI LILIN', N'11102', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1188, N'BOOM BARU PALEMBANG', N'BOOM BARU PALEMBANG', N'11103', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1189, N'PAL - LIMA', N'PAL - LIMA', N'11104', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1190, N'KALIDONI', N'KALIDONI', N'11107', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1191, N'LEMABANG', N'LEMABANG', N'11108', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1192, N'RAJAWALI PALEMBANG', N'RAJAWALI PALEMBANG', N'11109', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1193, N'SAKO', N'SAKO', N'11110', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1194, N'SEKAYU', N'SEKAYU', N'11111', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1195, N'BAYUNG LENCIR', N'BAYUNG LENCIR', N'11112', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1196, N'KM 9', N'KM 9', N'11160', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1197, N'MP MANGKUNEGARA', N'MP MANGKUNEGARA', N'11161', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1198, N'OPI MALL', N'OPI MALL', N'11163', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1199, N'KENTEN LAUT', N'KENTEN LAUT', N'11164', NULL)
GO
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1200, N'TANJUNG API-API', N'TANJUNG API-API', N'11165', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1201, N'PALEMBANG', N'PALEMBANG', N'01000', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1202, N'UNSRI', N'UNSRI', N'01001', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1203, N'JL. A. YANI', N'JL. A. YANI', N'01002', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1204, N'KOMPERTA', N'KOMPERTA', N'01003', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1205, N'UNSRI INDRALAYA', N'UNSRI INDRALAYA', N'01004', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1206, N'KENTEN', N'KENTEN', N'01005', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1207, N'KM - 12 SUKAJADI', N'KM - 12 SUKAJADI', N'01006', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1208, N'JEMBATAN AMPERA PALEMBANG', N'JEMBATAN AMPERA PALEMBANG', N'01007', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1209, N'PASAR 16 ILIR ', N'PASAR 16 ILIR ', N'01008', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1210, N'PALEMBANG SQUARE', N'PALEMBANG SQUARE', N'01009', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1211, N'PIM LETKOL ISKANDAR', N'PIM LETKOL ISKANDAR', N'01060', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1212, N'DEMPO', N'DEMPO', N'01061', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1213, N'SAYANGAN', N'SAYANGAN', N'01062', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1214, N'LORONG BASAH', N'LORONG BASAH', N'01063', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1215, N'KERTAPATI', N'KERTAPATI', N'01064', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1216, N'PLAJU', N'PLAJU', N'01065', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1217, N'PUSRI', N'PUSRI', N'01066', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1218, N'MUSI II', N'MUSI II', N'01067', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1219, N'DEMANG LEBAR DAUN', N'DEMANG LEBAR DAUN', N'01068', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1220, N'PRABUMULIH', N'PRABUMULIH', N'29400', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1221, N'TANJUNG ENIM', N'TANJUNG ENIM', N'29401', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1222, N'MUARA ENIM', N'MUARA ENIM', N'29402', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1223, N'PASAR PRABUMULIH', N'PASAR PRABUMULIH', N'29460', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1224, N'PANGKAL PINANG', N'PANGKAL PINANG', N'13500', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1225, N'SUNGAI LIAT', N'SUNGAI LIAT', N'13501', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1226, N'TANJUNG PANDAN', N'TANJUNG PANDAN', N'13502', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1227, N'KOBA', N'KOBA', N'13503', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1228, N'MANGGAR', N'MANGGAR', N'13504', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1229, N'MUNTOK', N'MUNTOK', N'13505', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1230, N'TOBOALI', N'TOBOALI', N'13506', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1231, N'BANGKA TRADE CENTRE', N'BANGKA TRADE CENTRE', N'13560', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1232, N'TANJUNG KARANG', N'TANJUNG KARANG', N'14200', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1233, N' JL. TEUKU UMAR', N' JL. TEUKU UMAR', N'14201', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1234, N'ANTASARI', N'ANTASARI', N'14202', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1235, N'PANJANG', N'PANJANG', N'14206', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1236, N'KALIANDA', N'KALIANDA', N'14207', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1237, N'BANDAR LAMPUNG', N'BANDAR LAMPUNG', N'14208', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1238, N'UNILA', N'UNILA', N'14209', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1239, N'PRINGSEWU', N'PRINGSEWU', N'14210', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1240, N'NATAR', N'NATAR', N'14211', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1241, N'TALANG PADANG', N'TALANG PADANG', N'14212', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1242, N'GEDONG TATAAN', N'GEDONG TATAAN', N'14214', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1243, N'SUKARAME', N'SUKARAME', N'14215', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1244, N'SIDOMULYO', N'SIDOMULYO', N'14216', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1245, N'MAJAPAHIT D/H PASAR TENGAH', N'MAJAPAHIT D/H PASAR TENGAH', N'14260', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1246, N'WAY HALIM', N'WAY HALIM', N'14261', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1247, N'UNIVERSITAS MALAHAYATI', N'UNIVERSITAS MALAHAYATI', N'14262', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1248, N'KEDATON', N'KEDATON', N'14263', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1249, N'KEMILING', N'KEMILING', N'14264', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1250, N'WILAYAH 04 - BANDUNG', N'WILAYAH 04 - BANDUNG', N'604', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1251, N'SENTRA WILAYAH 04', N'SENTRA WILAYAH 04', N'604', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1252, N'BANDUNG', N'BANDUNG', N'00200', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1253, N'JL.RIAU D/H JL. SUMBAWA D/H LEMBONG', N'JL.RIAU D/H JL. SUMBAWA D/H LEMBONG', N'00201', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1254, N'JL. BRAGA D/H  CIKAPUNDUNG', N'JL. BRAGA D/H  CIKAPUNDUNG', N'00202', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1255, N'JL. SUPRATMAN', N'JL. SUPRATMAN', N'00203', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1256, N'BUAH BATU D/H  PLN SOEKARNO HATTA', N'BUAH BATU D/H  PLN SOEKARNO HATTA', N'00204', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1257, N'JL. PUNGKUR D/H  DEWI SARTIKA', N'JL. PUNGKUR D/H  DEWI SARTIKA', N'00205', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1258, N'A.YANI BANDUNG', N'A.YANI BANDUNG', N'00206', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1259, N'CICADAS', N'CICADAS', N'00207', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1260, N'KIARACONDONG', N'KIARACONDONG', N'00209', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1261, N'RANCAEKEK', N'RANCAEKEK', N'00210', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1262, N'UJUNG BERUNG', N'UJUNG BERUNG', N'00211', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1263, N'JAPATI', N'JAPATI', N'00213', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1264, N'JL.SOEKARNO-HATTA D/H  GEDE BAGE BANDUNG', N'JL.SOEKARNO-HATTA D/H  GEDE BAGE BANDUNG', N'00215', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1265, N'ANTAPANI', N'ANTAPANI', N'00260', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1266, N'ASTANA ANYAR', N'ASTANA ANYAR', N'00261', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1267, N'GATOT SUBROTO BANDUNG', N'GATOT SUBROTO BANDUNG', N'00262', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1268, N'BATUNUNGGAL', N'BATUNUNGGAL', N'00263', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1269, N'ARCAMANIK', N'ARCAMANIK', N'00264', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1270, N'BANJAR', N'BANJAR', N'08500', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1271, N'PANGANDARAN', N'PANGANDARAN', N'08501', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1272, N'BANJARSARI', N'BANJARSARI', N'08560', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1273, N'CIANJUR', N'CIANJUR', N'10300', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1274, N'CIPANAS', N'CIPANAS', N'10301', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1275, N'CIRANJANG', N'CIRANJANG', N'10302', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1276, N'TANGGEUNG', N'TANGGEUNG', N'10303', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1277, N'HOS COKROAMINOTO', N'HOS COKROAMINOTO', N'10361', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1278, N'CIREBON', N'CIREBON', N'01900', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1279, N'TEGALWANGI D/H  PLERED D/H  SUMBER', N'TEGALWANGI D/H  PLERED D/H  SUMBER', N'01902', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1280, N'GRAGE MALL', N'GRAGE MALL', N'01903', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1281, N'ARJAWINANGUN', N'ARJAWINANGUN', N'01904', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1282, N'LOSARI', N'LOSARI', N'01905', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1283, N'SUMBER', N'SUMBER', N'01911', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1284, N'PEKALIPAN', N'PEKALIPAN', N'01960', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1285, N'HARJAMUKTI', N'HARJAMUKTI', N'01961', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1286, N'SINDANG LAUT', N'SINDANG LAUT', N'01963', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1287, N'TUPAREV', N'TUPAREV', N'01965', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1288, N'INDRAMAYU', N'INDRAMAYU', N'11800', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1289, N'JATIBARANG', N'JATIBARANG', N'11801', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1290, N'PATROL', N'PATROL', N'11802', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1291, N'HAURGEULIS', N'HAURGEULIS', N'11803', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1292, N'KARANGAMPEL', N'KARANGAMPEL', N'11804', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1293, N'KUNINGAN', N'KUNINGAN', N'13100', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1294, N'CIKIJING', N'CIKIJING', N'13101', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1295, N'MAJALENGKA', N'MAJALENGKA', N'13102', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1296, N'KADIPATEN', N'KADIPATEN', N'13104', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1297, N'CILIMUS', N'CILIMUS', N'13160', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1298, N'JATIWANGI', N'JATIWANGI', N'13161', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1299, N'BIJB KERTAJATI', N'BIJB KERTAJATI', N'13163', NULL)
GO
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1300, N'GARUT', N'GARUT', N'10200', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1301, N'CIKAJANG', N'CIKAJANG', N'10201', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1302, N'PAMENGPEUK', N'PAMENGPEUK', N'10202', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1303, N'LIMBANGAN', N'LIMBANGAN', N'10203', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1304, N'KADUNGORA', N'KADUNGORA', N'10260', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1305, N'CILEDUG', N'CILEDUG', N'10262', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1306, N'JL. PERINTIS KEMERDEKAAN BDG', N'JL. PERINTIS KEMERDEKAAN BDG', N'26900', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1307, N'STASIUN KA BANDUNG', N'STASIUN KA BANDUNG', N'26901', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1308, N'PT. INTI', N'PT. INTI', N'26903', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1309, N'YDPP TELKOM', N'YDPP TELKOM', N'26904', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1310, N'JL.JEND.SUDIRMAN BANDUNG', N'JL.JEND.SUDIRMAN BANDUNG', N'26905', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1311, N'MOCH. TOHA DH/CARINGIN', N'MOCH. TOHA DH/CARINGIN', N'26906', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1312, N'KOPO MAS', N'KOPO MAS', N'26907', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1313, N'CIJERAH', N'CIJERAH', N'26908', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1314, N'CIMAHI', N'CIMAHI', N'26909', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1315, N'PADALARANG', N'PADALARANG', N'26911', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1316, N'POSINDO', N'POSINDO', N'26912', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1317, N'PASAR BARU', N'PASAR BARU', N'26913', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1318, N'PAJAJARAN', N'PAJAJARAN', N'26914', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1319, N'RS. IMMANUEL BANDUNG', N'RS. IMMANUEL BANDUNG', N'26915', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1320, N'UNJANI', N'UNJANI', N'26960', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1321, N'DAYEUH KOLOT', N'DAYEUH KOLOT', N'26961', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1322, N'SUMBERSARI', N'SUMBERSARI', N'26962', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1323, N'BATUJAJAR', N'BATUJAJAR', N'26963', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1324, N'CIWASTRA', N'CIWASTRA', N'26964', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1325, N'POJOK CIMAHI', N'POJOK CIMAHI', N'26965', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1326, N'KARAPITAN', N'KARAPITAN', N'26966', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1327, N'DIGITAL BRANCH 23 PASKAL', N'DIGITAL BRANCH 23 PASKAL', N'26967', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1328, N'MAJALAYA', N'MAJALAYA', N'06900', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1329, N'SOREANG', N'SOREANG', N'06901', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1330, N'BALEENDAH', N'BALEENDAH', N'06902', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1331, N'BANJARAN D/H PANGALENGAN', N'BANJARAN D/H PANGALENGAN', N'06903', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1332, N'CICALENGKA', N'CICALENGKA', N'06904', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1333, N'CINUNUK', N'CINUNUK', N'06905', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1334, N'TAMAN KOPO INDAH', N'TAMAN KOPO INDAH', N'06960', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1335, N'CIWIDEY', N'CIWIDEY', N'06963', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1336, N'KOPO KETAPANG', N'KOPO KETAPANG', N'06964', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1337, N'DEPRIMATERA', N'DEPRIMATERA', N'06965', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1338, N'CIPARAY', N'CIPARAY', N'06966', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1339, N'CIBADUYUT', N'CIBADUYUT', N'06967', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1340, N'PERGURUAN TINGGI BANDUNG', N'PERGURUAN TINGGI BANDUNG', N'23600', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1341, N'GANESHA', N'GANESHA', N'23601', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1342, N'SETRASARI DH/ POLITEKNIK ITB', N'SETRASARI DH/ POLITEKNIK ITB', N'23602', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1343, N'SANGKURIANG D/H KOMPL  LIPI - ITB', N'SANGKURIANG D/H KOMPL  LIPI - ITB', N'23603', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1344, N'CIHAMPELAS', N'CIHAMPELAS', N'23604', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1345, N'UNIKOM D/H K.KAS R.S. ST. BORROMEUS', N'UNIKOM D/H K.KAS R.S. ST. BORROMEUS', N'23606', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1346, N'UNIV. PADJAJARAN', N'UNIV. PADJAJARAN', N'23607', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1347, N'JATINANGOR', N'JATINANGOR', N'23608', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1348, N'DAGO', N'DAGO', N'23610', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1349, N'UNIV. PENDIDIKAN INDONESIA', N'UNIV. PENDIDIKAN INDONESIA', N'23611', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1350, N'LEMBANG ', N'LEMBANG ', N'23612', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1351, N'SUKAJADI', N'SUKAJADI', N'23613', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1352, N'ITENAS', N'ITENAS', N'23614', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1353, N'UNIV. MARANATHA D/H KK UNIV. MARANATHA', N'UNIV. MARANATHA D/H KK UNIV. MARANATHA', N'23615', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1354, N'PASTEUR', N'PASTEUR', N'23660', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1355, N'SETIABUDHI', N'SETIABUDHI', N'23661', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1356, N'CIPADUNG D/H JATOS', N'CIPADUNG D/H JATOS', N'23662', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1357, N'RAJAWALI BANDUNG', N'RAJAWALI BANDUNG', N'23663', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1358, N'CIUMBULEUIT', N'CIUMBULEUIT', N'23664', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1359, N'PURWAKARTA', N'PURWAKARTA', N'17900', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1360, N'PLERED', N'PLERED', N'17901', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1361, N'BUKIT INDAH CITY', N'BUKIT INDAH CITY', N'17960', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1362, N'JATILUHUR', N'JATILUHUR', N'17961', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1363, N'CIKOPO', N'CIKOPO', N'17962', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1364, N'SUMEDANG', N'SUMEDANG', N'18000', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1365, N'TANJUNGSARI', N'TANJUNGSARI', N'18013', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1366, N'SUKABUMI', N'SUKABUMI', N'07400', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1367, N'CIWANGI', N'CIWANGI', N'07401', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1368, N'CIBADAK', N'CIBADAK', N'07402', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1369, N'CICURUG', N'CICURUG', N'07406', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1370, N'SURADE', N'SURADE', N'07407', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1371, N'PALABUHAN RATU', N'PALABUHAN RATU', N'07408', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1372, N'PANGLESERAN', N'PANGLESERAN', N'07462', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1373, N'SUBANG', N'SUBANG', N'18200', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1374, N'PAMANUKAN', N'PAMANUKAN', N'18201', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1375, N'KALIJATI', N'KALIJATI', N'18202', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1376, N'CIPEUNDEUY', N'CIPEUNDEUY', N'18263', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1377, N'TASIKMALAYA', N'TASIKMALAYA', N'02600', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1378, N'CIAWI D/H  UNIV.SILIWANGI TASIKMALAYA', N'CIAWI D/H  UNIV.SILIWANGI TASIKMALAYA', N'02601', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1379, N'UNIVERSITAS SILIWANGI', N'UNIVERSITAS SILIWANGI', N'02602', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1380, N'CIAMIS', N'CIAMIS', N'02605', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1381, N'SINGAPARNA', N'SINGAPARNA', N'02606', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1382, N'CIKURUBUK', N'CIKURUBUK', N'02608', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1383, N'KARANGNUNGGAL', N'KARANGNUNGGAL', N'02607', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1384, N'SUTISNA SENJAYA', N'SUTISNA SENJAYA', N'02662', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1385, N'KAWALI', N'KAWALI', N'02663', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1386, N'WILAYAH 05 - SEMARANG', N'WILAYAH 05 - SEMARANG', N'605', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1387, N'SENTRA WILAYAH 05', N'SENTRA WILAYAH 05', N'605', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1388, N'CEPU', N'CEPU', N'25200', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1389, N'BLORA', N'BLORA', N'25201', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1390, N'RANDUBLATUNG', N'RANDUBLATUNG', N'25260', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1391, N'JEPARA', N'JEPARA', N'14600', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1392, N'BANGSRI', N'BANGSRI', N'14601', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1393, N'MARGOYOSO', N'MARGOYOSO', N'14602', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1394, N'PLTU TANJUNG JATI B', N'PLTU TANJUNG JATI B', N'14660', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1395, N'KUDUS', N'KUDUS', N'04300', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1396, N'DEMAK', N'DEMAK', N'04301', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1397, N'PURWODADI', N'PURWODADI', N'04303', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1398, N'PR SUKUN', N'PR SUKUN', N'04360', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1399, N'JEKULO', N'JEKULO', N'04361', NULL)
GO
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1400, N'PRAMBATAN', N'PRAMBATAN', N'04362', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1401, N'PASAR KLIWON', N'PASAR KLIWON', N'04363', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1402, N'UNDAAN', N'UNDAAN', N'04364', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1403, N'KARANGAYU', N'KARANGAYU', N'24400', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1404, N'JALAN PEMUDA SEMARANG D/H PANDANARAN', N'JALAN PEMUDA SEMARANG D/H PANDANARAN', N'24401', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1405, N'SRONDOL', N'SRONDOL', N'24402', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1406, N'NGALIYAN D/H.KRAPYAK', N'NGALIYAN D/H.KRAPYAK', N'24403', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1407, N'CANDI', N'CANDI', N'24404', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1408, N'BANDARA AHMAD YANI', N'BANDARA AHMAD YANI', N'24460', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1409, N'MAYJEND SUTOYO D/H GAJAHMADA', N'MAYJEND SUTOYO D/H GAJAHMADA', N'24461', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1410, N'PAMULARSIH', N'PAMULARSIH', N'24462', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1411, N'BSB', N'BSB', N'24465', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1412, N'KENDAL', N'KENDAL', N'31200', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1413, N'KALIWUNGU D/H TEXMACO', N'KALIWUNGU D/H TEXMACO', N'31201', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1414, N'BOJA', N'BOJA', N'31202', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1415, N'WELERI', N'WELERI', N'31203', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1416, N'SUKOREJO', N'SUKOREJO', N'31261', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1417, N'PEGANDON', N'PEGANDON', N'31263', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1418, N'PEKALONGAN', N'PEKALONGAN', N'05700', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1419, N'BATANG', N'BATANG', N'05701', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1420, N'WIRADESA', N'WIRADESA', N'05702', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1421, N'KEDUNGWUNI', N'KEDUNGWUNI', N'05703', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1422, N'LIMPUNG', N'LIMPUNG', N'05704', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1423, N'COMAL', N'COMAL', N'05705', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1424, N'BANDAR', N'BANDAR', N'05761', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1425, N'BUARAN', N'BUARAN', N'05762', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1426, N'PATI', N'PATI', N'14500', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1427, N'REMBANG', N'REMBANG', N'14501', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1428, N'JUWANA', N'JUWANA', N'14502', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1429, N'SUKOLILO', N'SUKOLILO', N'14503', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1430, N'NGEMPLAK', N'NGEMPLAK', N'14560', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1431, N'LASEM', N'LASEM', N'14561', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1432, N'GABUS', N'GABUS', N'14562', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1433, N'TAYU', N'TAYU', N'14563', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1434, N'SALATIGA', N'SALATIGA', N'13700', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1435, N'AMBARAWA', N'AMBARAWA', N'13701', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1436, N'UNIV. KRISTEN SATYA WACANA', N'UNIV. KRISTEN SATYA WACANA', N'13702', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1437, N'SURUH', N'SURUH', N'13760', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1438, N'BANDUNGAN', N'BANDUNGAN', N'13761', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1439, N'SEMARANG', N'SEMARANG', N'01300', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1440, N'UNGARAN', N'UNGARAN', N'01302', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1441, N'PERUMPEL III', N'PERUMPEL III', N'01305', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1442, N'UNIV. NEGERI SEMARANG D/H IKIP NEGERI ', N'UNIV. NEGERI SEMARANG D/H IKIP NEGERI ', N'01307', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1443, N'JOMBLANG', N'JOMBLANG', N'01308', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1444, N'DR. CIPTO SEMARANG', N'DR. CIPTO SEMARANG', N'01309', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1445, N'EMERALD SEMARANG', N'EMERALD SEMARANG', N'01313', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1446, N'KRANGGAN', N'KRANGGAN', N'01314', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1447, N'PURI ANJASMORO', N'PURI ANJASMORO', N'01360', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1448, N'PANDANARAN', N'PANDANARAN', N'01362', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1449, N'PLN DISTRIBUSI JATENG DAN DIY DH. PAYMENT POINT PLN JATENG DAN DIY', N'PLN DISTRIBUSI JATENG DAN DIY DH. PAYMENT POINT PLN JATENG DAN DIY', N'01363', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1450, N'KARANGJATI', N'KARANGJATI', N'01364', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1451, N'KARANGTURI', N'KARANGTURI', N'01365', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1452, N'BANYUMANIK', N'BANYUMANIK', N'01366', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1453, N'PERTAMINA MOR IV', N'PERTAMINA MOR IV', N'01367', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1454, N'TEGAL', N'TEGAL', N'16900', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1455, N'BREBES', N'BREBES', N'16901', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1456, N'SLAWI', N'SLAWI', N'16902', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1457, N'PEMALANG', N'PEMALANG', N'16903', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1458, N'BANJARAN D/H SAPURAN ', N'', N'', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1459, N'KETANGGUNGAN', N'KETANGGUNGAN', N'16905', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1460, N'JATIBARANG', N'JATIBARANG', N'16961', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1461, N'PASAR PAGI TEGAL', N'PASAR PAGI TEGAL', N'16962', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1462, N'RANDUDONGKAL', N'RANDUDONGKAL', N'16963', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1463, N'MARGASARI', N'MARGASARI', N'16964', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1464, N'SURADADI', N'SURADADI', N'16965', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1465, N'UNIV. DIPONEGORO SEMARANG', N'UNIV. DIPONEGORO SEMARANG', N'26100', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1466, N'GAYAMSARI', N'GAYAMSARI', N'26101', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1467, N'TEMBALANG', N'TEMBALANG', N'26102', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1468, N'UNIVERSITAS SEMARANG D/H KK UNIV. SEMARANG', N'UNIVERSITAS SEMARANG D/H KK UNIV. SEMARANG', N'26103', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1469, N'MRANGGEN', N'MRANGGEN', N'26104', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1470, N'KEDUNGMUNDU', N'KEDUNGMUNDU', N'26160', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1471, N'GAJAH', N'GAJAH', N'26161', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1472, N'POLTEK ILMU PELAYARAN SEMARANG', N'POLTEK ILMU PELAYARAN SEMARANG', N'26162', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1473, N'GUBUG', N'GUBUG', N'26163', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1474, N'MANYARAN', N'MANYARAN', N'26164', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1475, N'WILAYAH 06 - SURABAYA', N'WILAYAH 06 - SURABAYA', N'606', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1476, N'SENTRA WILAYAH 06', N'SENTRA WILAYAH 06', N'606', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1477, N'BOJONEGORO', N'BOJONEGORO', N'11700', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1478, N'BABAT', N'BABAT', N'11701', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1479, N'KALITIDU', N'KALITIDU', N'11702', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1480, N'SUMBERREJO', N'SUMBERREJO', N'11760', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1481, N'BAURENO', N'BAURENO', N'11761', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1482, N'GRAHA PANGERAN SURABAYA', N'GRAHA PANGERAN SURABAYA', N'25500', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1483, N'KETINTANG', N'KETINTANG', N'25501', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1484, N'JL.DIPONEGORO', N'JL.DIPONEGORO', N'25502', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1485, N'WONOKROMO', N'WONOKROMO', N'25503', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1486, N'KUTISARI', N'KUTISARI', N'25504', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1487, N'PLAZA MARINA', N'PLAZA MARINA', N'25507', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1488, N'WIYUNG', N'WIYUNG', N'25508', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1489, N'RUNGKUT', N'RUNGKUT', N'25510', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1490, N'JEMURSARI', N'JEMURSARI', N'25513', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1491, N'TELKOM DIVRE V', N'TELKOM DIVRE V', N'25515', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1492, N'UPN VETERAN', N'UPN VETERAN', N'25516', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1493, N'HIGH POINT', N'HIGH POINT', N'25563', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1494, N'UNITOMO', N'UNITOMO', N'25565', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1495, N'LOTTEMART MASTRIP', N'LOTTEMART MASTRIP', N'25566', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1496, N'GRAHA PENA', N'GRAHA PENA', N'25567', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1497, N'SIER', N'SIER', N'25568', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1498, N'BP2IP', N'BP2IP', N'25569', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1499, N'GRESIK', N'GRESIK', N'22400', NULL)
GO
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1500, N'PETROKIMIA GRESIK', N'PETROKIMIA GRESIK', N'22401', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1501, N'LAMONGAN', N'LAMONGAN', N'22402', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1502, N'KARTINI', N'KARTINI', N'22403', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1503, N'BUNGAH', N'BUNGAH', N'22405', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1504, N'DRIYOREJO', N'DRIYOREJO', N'22406', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1505, N'MANYAR', N'MANYAR', N'22407', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1506, N'MENGANTI', N'MENGANTI', N'22462', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1507, N'CERME', N'CERME', N'22463', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1508, N'LAMONGAN TRADE CENTER', N'LAMONGAN TRADE CENTER', N'22464', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1509, N'GREEN GARDEN GRESIK', N'GREEN GARDEN GRESIK', N'22465', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1510, N'HR MUHAMMAD', N'HR MUHAMMAD', N'31900', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1511, N'KUPANG JAYA', N'KUPANG JAYA', N'31901', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1512, N'MANUKAN', N'MANUKAN', N'31902', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1513, N'BUKIT DARMO GOLF D/H  MARGO MULYO', N'BUKIT DARMO GOLF D/H  MARGO MULYO', N'31903', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1514, N'G-WALK', N'G-WALK', N'31904', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1515, N'DARMO INDAH', N'DARMO INDAH', N'31905', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1516, N'PAKUWON TRADE CENTER', N'PAKUWON TRADE CENTER', N'31906', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1517, N'EMERALD DARMO D/H RAJAWALI', N'EMERALD DARMO D/H RAJAWALI', N'31907', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1518, N'LIDAH WETAN', N'LIDAH WETAN', N'31960', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1519, N'MARGOMULYO D/H PASAR ATUM', N'MARGOMULYO D/H PASAR ATUM', N'31961', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1520, N'JOMBANG ', N'JOMBANG ', N'12300', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1521, N'MOJOAGUNG', N'MOJOAGUNG', N'12301', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1522, N'KAUMAN NGORO', N'KAUMAN NGORO', N'12302', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1523, N'PLOSO', N'PLOSO', N'12303', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1524, N'PERAK', N'PERAK', N'12361', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1525, N'PAMEKASAN D/H MADURA ', N'PAMEKASAN D/H MADURA ', N'09800', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1526, N'SAMPANG', N'SAMPANG', N'09801', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1527, N'TEMBERU D/H KAS MOBIL TAMBERU', N'TEMBERU D/H KAS MOBIL TAMBERU', N'09804', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1528, N'BANGKALAN', N'BANGKALAN', N'09805', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1529, N'KETAPANG', N'KETAPANG', N'09806', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1530, N'BLEGA', N'BLEGA', N'09861', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1531, N'TRUNOJOYO BANGKALAN', N'TRUNOJOYO BANGKALAN', N'09862', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1532, N'TANJUNG BUMI', N'TANJUNG BUMI', N'09864', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1533, N'WARU', N'WARU', N'09865', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1534, N'MOJOKERTO', N'MOJOKERTO', N'12400', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1535, N'MOJOSARI', N'MOJOSARI', N'12401', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1536, N'DLANGGU', N'DLANGGU', N'12402', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1537, N'NGORO', N'NGORO', N'12403', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1538, N'JETIS', N'JETIS', N'12404', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1539, N'KAMPUS MOJOANYAR', N'KAMPUS MOJOANYAR', N'12405', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1540, N'GAJAH MADA D/H PASAR TANJUNG ANYAR', N'GAJAH MADA D/H PASAR TANJUNG ANYAR', N'12460', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1541, N'BRANGKAL', N'BRANGKAL', N'12464', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1542, N'SURABAYA', N'SURABAYA', N'01400', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1543, N'KUSUMA BANGSA D/H KEDUNGSARI', N'KUSUMA BANGSA D/H KEDUNGSARI', N'01401', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1544, N'STASIUN GUBENG SBY', N'STASIUN GUBENG SBY', N'01402', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1545, N'URIP SUMOHARDJO', N'URIP SUMOHARDJO', N'01403', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1546, N'ITS SURABAYA', N'ITS SURABAYA', N'01404', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1547, N'DARMO', N'DARMO', N'01405', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1548, N'RSAL DR.RAMELAN', N'RSAL DR.RAMELAN', N'01407', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1549, N'UNAIR SURABAYA', N'UNAIR SURABAYA', N'01408', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1550, N'NGINDEN', N'NGINDEN', N'01409', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1551, N'KLAMPIS JAYA', N'KLAMPIS JAYA', N'01410', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1552, N'PUCANG ANOM', N'PUCANG ANOM', N'01411', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1553, N'KERTAJAYA', N'KERTAJAYA', N'01412', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1554, N'UNDAAN', N'UNDAAN', N'01413', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1555, N'DHARMA HUSADA', N'DHARMA HUSADA', N'01414', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1556, N'RUKUN MANYAR INDAH', N'RUKUN MANYAR INDAH', N'01415', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1557, N'INDRAGIRI D/H SURABAYA TOWN SQUARE', N'INDRAGIRI D/H SURABAYA TOWN SQUARE', N'01416', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1558, N'HOTEL TUNJUNGAN', N'HOTEL TUNJUNGAN', N'01417', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1559, N'KENJERAN', N'KENJERAN', N'01418', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1560, N'PERTAMINA TOWER', N'PERTAMINA TOWER', N'01419', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1561, N'MERR', N'MERR', N'01420', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1562, N'UNDAAN WETAN D/H ADI HUSADA', N'UNDAAN WETAN D/H ADI HUSADA', N'01460', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1563, N'MEGA GALAXY', N'MEGA GALAXY', N'01461', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1564, N'PAKUWON TOWN SQUARE', N'PAKUWON TOWN SQUARE', N'01463', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1565, N'WTC', N'WTC', N'01464', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1566, N'PJB', N'PJB', N'01421', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1567, N'DIGITAL BRANCH GRAND CITY', N'DIGITAL BRANCH GRAND CITY', N'01468', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1568, N'DIGITAL BRANCH CIPUTRA WORLD', N'DIGITAL BRANCH CIPUTRA WORLD', N'01469', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1569, N'SIDOARJO', N'SIDOARJO', N'23000', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1570, N'LIK TROSOBO', N'LIK TROSOBO', N'23001', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1571, N'CANDI D/H PORONG', N'CANDI D/H PORONG', N'23002', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1572, N'SEPANJANG', N'SEPANJANG', N'23003', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1573, N'KRIAN', N'KRIAN', N'23004', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1574, N'GEDANGAN', N'GEDANGAN', N'23005', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1575, N'SUN CITY', N'SUN CITY', N'23006', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1576, N'PORONG', N'PORONG', N'23007', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1577, N'PONDOK CHANDRA', N'PONDOK CHANDRA', N'23008', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1578, N'BANDARA JUANDA D/H KK JUANDA', N'BANDARA JUANDA D/H KK JUANDA', N'23009', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1579, N'HANGTUAH', N'HANGTUAH', N'23061', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1580, N'TROPODO', N'TROPODO', N'23062', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1581, N'RUKO GATEWAY', N'RUKO GATEWAY', N'23063', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1582, N'JUANDA TERMINAL 2', N'JUANDA TERMINAL 2', N'23064', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1583, N'SUMENEP', N'SUMENEP', N'08300', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1584, N'PRENDUAN', N'PRENDUAN', N'08301', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1585, N'PASONGSONGAN', N'PASONGSONGAN', N'08360', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1586, N'TANJUNG PERAK SURABAYA', N'TANJUNG PERAK SURABAYA', N'04200', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1587, N'UTPK', N'UTPK', N'04203', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1588, N'PELINDO III.D/H  KMBL.PT.PERSERO PELABUHAN IND.III  D/H KMBL. UPN VETERAN', N'PELINDO III.D/H  KMBL.PT.PERSERO PELABUHAN IND.III  D/H KMBL. UPN VETERAN', N'04205', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1589, N'KEDUNGDORO', N'KEDUNGDORO', N'04206', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1590, N'KAPAS KRAMPUNG', N'KAPAS KRAMPUNG', N'04207', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1591, N'PASAR ATOM', N'PASAR ATOM', N'04208', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1592, N'JEMBATAN MERAH SURABAYA', N'JEMBATAN MERAH SURABAYA', N'04212', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1593, N'JL.MAYJEN.SUNGKONO', N'JL.MAYJEN.SUNGKONO', N'04213', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1594, N'PASAR TURI', N'PASAR TURI', N'04216', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1595, N'KAPASAN', N'KAPASAN', N'04218', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1596, N'KH.MAS MANSYUR', N'KH.MAS MANSYUR', N'04219', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1597, N'PUSAT GROSIR SURABAYA', N'PUSAT GROSIR SURABAYA', N'04220', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1598, N'BALIWERTI', N'BALIWERTI', N'04260', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1599, N'ITC MEGA GROSIR', N'ITC MEGA GROSIR', N'04261', NULL)
GO
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1600, N'DUPAK', N'DUPAK', N'04263', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1601, N'JEMBATAN MERAH PLAZA', N'JEMBATAN MERAH PLAZA', N'04265', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1602, N'BANYU URIP D/H PASAR TURI BARU', N'BANYU URIP D/H PASAR TURI BARU', N'04266', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1603, N'KALIBUTUH', N'KALIBUTUH', N'04267', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1604, N'TUBAN', N'TUBAN', N'27600', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1605, N'SEMEN GRESIK TUBAN', N'SEMEN GRESIK TUBAN', N'27601', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1606, N'BRONDONG', N'BRONDONG', N'27602', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1607, N'BANCAR', N'BANCAR', N'27661', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1608, N'PACIRAN', N'PACIRAN', N'27662', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1609, N'JENU', N'JENU', N'27663', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1610, N'WILAYAH 07 - MAKASSAR', N'WILAYAH 07 - MAKASSAR', N'607', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1611, N'SENTRA WILAYAH 07', N'SENTRA WILAYAH 07', N'607', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1612, N'AMBON', N'AMBON', N'04100', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1613, N'WAIHAONG', N'WAIHAONG', N'04101', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1614, N'TUAL', N'TUAL', N'04102', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1615, N'NAMLEA', N'NAMLEA', N'04103', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1616, N'KEPULAUAN ARU', N'KEPULAUAN ARU', N'04104', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1617, N'SERAM BAGIAN TIMUR', N'SERAM BAGIAN TIMUR', N'04105', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1618, N'SERAM BAGIAN BARAT', N'SERAM BAGIAN BARAT', N'04106', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1619, N'MALUKU TENGGARA', N'MALUKU TENGGARA', N'04107', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1620, N'MASOHI', N'MASOHI', N'04110', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1621, N'SAUMLAKI', N'SAUMLAKI', N'04111', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1622, N'BURU SELATAN', N'BURU SELATAN', N'04108', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1623, N'PASSO', N'PASSO', N'04160', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1624, N'PASAR MARDIKA', N'PASAR MARDIKA', N'04162', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1625, N'UNIVERSITAS PATTIMURA', N'UNIVERSITAS PATTIMURA', N'04164', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1626, N'BAU-BAU', N'BAU-BAU', N'16800', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1627, N'RAHA', N'RAHA', N'16801', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1628, N'WAKATOBI', N'WAKATOBI', N'16802', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1629, N'EREKE', N'EREKE', N'16803', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1630, N'BATAUGA', N'BATAUGA', N'16804', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1631, N'LOMBE', N'LOMBE', N'16805', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1632, N'BETOAMBARI', N'BETOAMBARI', N'16806', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1633, N'PASAR WAJO', N'PASAR WAJO', N'16860', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1634, N'BULUKUMBA', N'BULUKUMBA', N'30100', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1635, N'SINJAI', N'SINJAI', N'30103', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1636, N'BANTAENG', N'BANTAENG', N'30104', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1637, N'JENEPONTO', N'JENEPONTO', N'30105', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1638, N'SELAYAR', N'SELAYAR', N'30160', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1639, N'KENDARI', N'KENDARI', N'08000', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1640, N'KOLAKA', N'KOLAKA', N'08001', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1641, N'MANDONGA', N'MANDONGA', N'08002', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1642, N'UNAHA', N'UNAHA', N'08003', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1643, N'KONAWE SELATAN', N'KONAWE SELATAN', N'08004', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1644, N'KOLAKA UTARA', N'KOLAKA UTARA', N'08005', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1645, N'KONAWE UTARA', N'KONAWE UTARA', N'08006', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1646, N'BOMBANA', N'BOMBANA', N'08007', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1647, N'KOLAKA TIMUR', N'KOLAKA TIMUR', N'08008', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1648, N'ANDUONOHU', N'ANDUONOHU', N'08060', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1649, N'POMALAA', N'POMALAA', N'08062', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1650, N'LEPO LEPO', N'LEPO LEPO', N'08063', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1651, N'MATTOANGIN', N'MATTOANGIN', N'24800', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1652, N'PANGKEP', N'PANGKEP', N'24801', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1653, N'PANAKUKANG MAS', N'PANAKUKANG MAS', N'24802', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1654, N'PUSAT NIAGA DAYA', N'PUSAT NIAGA DAYA', N'24803', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1655, N'GOWA', N'GOWA', N'24804', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1656, N'MAROS', N'MAROS', N'24805', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1657, N'TAKALAR', N'TAKALAR', N'24806', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1658, N'PURI KENCANA D/H  FAJAR NITRO', N'PURI KENCANA D/H  FAJAR NITRO', N'24807', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1659, N'TONASA', N'TONASA', N'24808', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1660, N'VETERAN', N'VETERAN', N'24809', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1661, N'PERINTIS KEMERDEKAAN MAKASSAR', N'PERINTIS KEMERDEKAAN MAKASSAR', N'24810', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1662, N'SUDIANG', N'SUDIANG', N'24860', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1663, N'VETERAN SELATAN', N'VETERAN SELATAN', N'24861', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1664, N'UIN ALAUDDIN', N'UIN ALAUDDIN', N'24862', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1665, N'HERTASNING MAKASSAR', N'HERTASNING MAKASSAR', N'24865', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1666, N'GUNUNG SARI D/H PARAMOUNT', N'GUNUNG SARI D/H PARAMOUNT', N'24866', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1667, N'MAKASSAR', N'MAKASSAR', N'00700', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1668, N'BANDARA HASANUDDIN ', N'', N'', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1669, N'PASAR BUTUNG', N'PASAR BUTUNG', N'00702', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1670, N'MENARA BOSOWA', N'MENARA BOSOWA', N'00703', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1671, N'UNHAS TAMALANREA', N'UNHAS TAMALANREA', N'00704', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1672, N'AP. PETTARANI D/H  IKIP U. PANDANG ', N'', N'', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1673, N'SOMBAOPU', N'SOMBAOPU', N'00706', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1674, N'BARAYA', N'BARAYA', N'00707', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1675, N'ARIEF RATE DH. SAM RATULANGI DH. MARI MALL', N'ARIEF RATE DH. SAM RATULANGI DH. MARI MALL', N'00708', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1676, N'UNIVERSITAS NEGERI MAKASSAR D/H TELKOM DIVRE VII', N'UNIVERSITAS NEGERI MAKASSAR D/H TELKOM DIVRE VII', N'00709', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1677, N'BOULEVARD', N'BOULEVARD', N'00760', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1678, N'DAENG TATA', N'DAENG TATA', N'00761', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1679, N'SULTAN HASANUDDIN', N'SULTAN HASANUDDIN', N'00762', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1680, N'BUMI TAMALANREA PERMAI', N'BUMI TAMALANREA PERMAI', N'00763', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1681, N'ANTANG', N'ANTANG', N'00764', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1682, N'PELABUHAN PETI KEMAS', N'PELABUHAN PETI KEMAS', N'00765', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1683, N'NEW MAKASSAR MALL D/H METRO TANJUNG BUNGA', N'NEW MAKASSAR MALL D/H METRO TANJUNG BUNGA', N'00766', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1684, N'DIGITAL BRANCH NIPAH MALL', N'DIGITAL BRANCH NIPAH MALL', N'00767', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1685, N'PIPO MALL', N'PIPO MALL', N'00768', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1686, N'MAMUJU', N'MAMUJU', N'30700', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1687, N'PASANG KAYU', N'PASANG KAYU', N'30701', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1688, N'TOPOYO', N'TOPOYO', N'30702', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1689, N'PALOPO', N'PALOPO', N'20300', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1690, N'TANA TORAJA ', N'TANA TORAJA ', N'20301', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1691, N'MASAMBA / LUWU', N'MASAMBA / LUWU', N'20302', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1692, N'MALILI D/H PASAR SENTRAL PALOPO', N'MALILI D/H PASAR SENTRAL PALOPO', N'20303', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1693, N'BELOPA', N'BELOPA', N'20304', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1694, N'SOROWAKO', N'SOROWAKO', N'20308', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1695, N'TOMONI', N'TOMONI', N'20309', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1696, N'MAKALE', N'MAKALE', N'20361', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1697, N'SAM RATULANGI', N'SAM RATULANGI', N'20363', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1698, N'BONE-BONE', N'BONE-BONE', N'20364', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1699, N'PARE-PARE', N'PARE-PARE', N'10000', NULL)
GO
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1700, N'SIDRAP', N'SIDRAP', N'10001', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1701, N'PINRANG', N'PINRANG', N'10002', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1702, N'BARRU', N'BARRU', N'10003', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1703, N'ENREKANG', N'ENREKANG', N'10004', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1704, N'TANRU TEDONG SIDRAP', N'TANRU TEDONG SIDRAP', N'10005', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1705, N'RAPPANG', N'RAPPANG', N'10006', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1706, N'PEKKABATA D/H PASAR SENTRAL PINRANG', N'PEKKABATA D/H PASAR SENTRAL PINRANG', N'10060', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1707, N'JL. JENDRAL SUDIRMAN D/H PASAR LAKESSI', N'JL. JENDRAL SUDIRMAN D/H PASAR LAKESSI', N'10061', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1708, N'PASAR SUDU', N'PASAR SUDU', N'10062', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1709, N'POLEWALI', N'POLEWALI', N'21700', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1710, N'WONOMULYO', N'WONOMULYO', N'21701', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1711, N'MAJENE', N'MAJENE', N'21702', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1712, N'MAMASA', N'MAMASA', N'21703', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1713, N'SENGKANG', N'SENGKANG', N'10100', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1714, N'BONE', N'BONE', N'10101', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1715, N'WAJO / SIWA', N'WAJO / SIWA', N'10102', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1716, N'WATANSOPENG', N'WATANSOPENG', N'10103', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1717, N'SOPENG/CABENGE', N'SOPENG/CABENGE', N'10104', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1718, N'PASAR SENTRAL', N'PASAR SENTRAL', N'10105', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1719, N'PALATTAE', N'PALATTAE', N'10106', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1720, N'MARE', N'MARE', N'10108', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1721, N'ATAPANGE', N'ATAPANGE', N'10110', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1722, N'BONE TRADE CENTRE', N'BONE TRADE CENTRE', N'10160', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1723, N'WILAYAH 08 - DENPASAR', N'WILAYAH 08 - DENPASAR', N'608', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1724, N'SENTRA KANTOR WILAYAH 08', N'SENTRA KANTOR WILAYAH 08', N'608', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1725, N'BIMA', N'BIMA', N'19000', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1726, N'DOMPU', N'DOMPU', N'19001', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1727, N'SAPE', N'SAPE', N'19002', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1728, N'RABA', N'RABA', N'19003', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1729, N'WOHA', N'WOHA', N'19004', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1730, N'SILA', N'SILA', N'19005', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1731, N'DENPASAR', N'DENPASAR', N'03400', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1732, N'NUSA DUA BEACH HOTEL', N'NUSA DUA BEACH HOTEL', N'03404', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1733, N'WESTIN HOTELS AND RESORT D/H SHERATON NUSA INDAH ', N'WESTIN HOTELS AND RESORT D/H SHERATON NUSA INDAH ', N'03405', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1734, N'TABANAN', N'TABANAN', N'03407', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1735, N'UBUD', N'UBUD', N'03408', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1736, N'GIANYAR', N'GIANYAR', N'03409', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1737, N'KLUNGKUNG', N'KLUNGKUNG', N'03410', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1738, N'BANGLI', N'BANGLI', N'03411', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1739, N'GATOT SUBROTO', N'GATOT SUBROTO', N'03412', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1740, N'GAJAH MADA D/H GATOT SUBROTO BARAT', N'GAJAH MADA D/H GATOT SUBROTO BARAT', N'03413', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1741, N'KAPAL', N'KAPAL', N'03414', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1742, N'BAJERA', N'BAJERA', N'03415', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1743, N'BATURITI', N'BATURITI', N'03416', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1744, N'CANGGU', N'CANGGU', N'03417', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1745, N'CELUK SUKAWATI D/H SUKAWATI', N'CELUK SUKAWATI D/H SUKAWATI', N'03418', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1746, N'MAHENDRADATA', N'MAHENDRADATA', N'03420', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1747, N'DALUNG', N'DALUNG', N'03421', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1748, N'TABANAN KOTA', N'TABANAN KOTA', N'03422', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1749, N'PELINDO BENOA', N'PELINDO BENOA', N'03423', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1750, N'UNIVERSITAS UDAYANA', N'UNIVERSITAS UDAYANA', N'03466', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1751, N'ENDE', N'ENDE', N'28400', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1752, N'BAJAWA', N'BAJAWA', N'28401', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1753, N'RUTENG', N'RUTENG', N'28402', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1754, N'LABUAN BAJO', N'LABUAN BAJO', N'28403', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1755, N'MBAY', N'MBAY', N'28404', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1756, N'BORONG', N'BORONG', N'28405', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1757, N'KUPANG', N'KUPANG', N'22900', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1758, N'OESAPA SELATAN DH/UNIV. NUSA CENDANA', N'OESAPA SELATAN DH/UNIV. NUSA CENDANA', N'22901', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1759, N'SOE', N'SOE', N'22902', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1760, N'ATAMBUA', N'ATAMBUA', N'22903', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1761, N'KALABAHI', N'KALABAHI', N'22904', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1762, N'WAINGAPU', N'WAINGAPU', N'22905', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1763, N'WAIKABUBAK', N'WAIKABUBAK', N'22906', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1764, N'KEFAMENANU D/H KLN KEWAPANTE ', N'', N'', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1765, N'KUANINO', N'KUANINO', N'22908', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1766, N'KUPANG TIMUR', N'KUPANG TIMUR', N'22909', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1767, N'ROTE NDAO', N'ROTE NDAO', N'22910', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1768, N'BETUN', N'BETUN', N'22911', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1769, N'WAITABULA', N'WAITABULA', N'22912', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1770, N'OESAPA', N'OESAPA', N'22913', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1771, N'PELINDO TENAU', N'PELINDO TENAU', N'22962', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1772, N'MAUMERE', N'MAUMERE', N'29000', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1773, N'LARANTUKA', N'LARANTUKA', N'29001', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1774, N'WAIWERANG', N'WAIWERANG', N'29002', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1775, N'LEWOLEBA', N'LEWOLEBA', N'29003', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1776, N'MATARAM', N'MATARAM', N'03800', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1777, N'CAKRANEGARA', N'CAKRANEGARA', N'03801', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1778, N'SENGGIGI BEACH HOTEL', N'SENGGIGI BEACH HOTEL', N'03802', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1779, N'PRAYA', N'PRAYA', N'03803', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1780, N'SELONG', N'SELONG', N'03804', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1781, N'AIRLANGGA D/H UNIV. MATARAM', N'AIRLANGGA D/H UNIV. MATARAM', N'03805', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1782, N'MASBAGIK D/H  MANDALIKA', N'MASBAGIK D/H  MANDALIKA', N'03806', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1783, N'LABUHAN LOMBOK', N'LABUHAN LOMBOK', N'03807', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1784, N'TANJUNG', N'TANJUNG', N'03808', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1785, N'GERUNG', N'GERUNG', N'03809', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1786, N'SANDUBAYA', N'SANDUBAYA', N'03810', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1787, N'KEBON ROEK', N'KEBON ROEK', N'03811', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1788, N'SEMBALUN', N'SEMBALUN', N'03812', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1789, N'NARMADA', N'NARMADA', N'03813', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1790, N'BANDARA INTERNASIONAL LOMBOK', N'BANDARA INTERNASIONAL LOMBOK', N'03864', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1791, N'RENON', N'RENON', N'30200', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1792, N'PANJER D/H GRAND BALI BEACH', N'PANJER D/H GRAND BALI BEACH', N'30202', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1793, N'SANUR BEACH HOTEL', N'SANUR BEACH HOTEL', N'30203', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1794, N'SANUR BALIMOON', N'SANUR BALIMOON', N'30204', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1795, N'RSU SANGLAH', N'RSU SANGLAH', N'30205', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1796, N'KAMBOJA', N'KAMBOJA', N'30206', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1797, N'TEUKU UMAR', N'TEUKU UMAR', N'30207', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1798, N'W.R. SUPRATMAN', N'W.R. SUPRATMAN', N'30208', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1799, N'LEGIAN', N'LEGIAN', N'30209', NULL)
GO
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1800, N'BANDARA NGURAH RAI', N'BANDARA NGURAH RAI', N'30210', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1801, N'DEWI SARTIKA RENON', N'DEWI SARTIKA RENON', N'30211', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1802, N'SIMPANG SIUR D/H . TERMINAL CARGO BANDARA NGURAH RAI', N'SIMPANG SIUR D/H . TERMINAL CARGO BANDARA NGURAH RAI', N'30212', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1803, N'IMAM BONJOL RENON ', N'IMAM BONJOL RENON ', N'30213', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1804, N'NUSA DUA', N'NUSA DUA', N'30214', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1805, N'SUNSET ROAD', N'SUNSET ROAD', N'30215', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1806, N'DIPONEGORO', N'DIPONEGORO', N'30216', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1807, N'PB SUDIRMAN', N'PB SUDIRMAN', N'30217', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1808, N'SESETAN', N'SESETAN', N'30218', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1809, N'KEROBOKAN', N'KEROBOKAN', N'30219', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1810, N'SANUR', N'SANUR', N'30220', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1811, N'TEUKU UMAR TIMUR', N'TEUKU UMAR TIMUR', N'30221', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1812, N'HAYAM WURUK D/H PT JAMSOSTEK DENPASAR', N'HAYAM WURUK D/H PT JAMSOSTEK DENPASAR', N'30222', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1813, N'JIMBARAN', N'JIMBARAN', N'30223', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1814, N'TEUKU UMAR BARAT', N'TEUKU UMAR BARAT', N'30224', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1815, N'BEACHWALK', N'BEACHWALK', N'30266', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1816, N'DIGITAL BRANCH BANDARA NGURAH RAI', N'DIGITAL BRANCH BANDARA NGURAH RAI', N'30269', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1817, N'MOH. YAMIN D/H EMERALD RENON', N'MOH. YAMIN D/H EMERALD RENON', N'30270', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1818, N'SUMBAWA BESAR', N'SUMBAWA BESAR', N'06600', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1819, N'TALIWANG', N'TALIWANG', N'06601', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1820, N'MALUK', N'MALUK', N'06602', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1821, N'TOWN SITE', N'TOWN SITE', N'06603', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1822, N'ALAS', N'ALAS', N'06604', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1823, N'PLAMPANG', N'PLAMPANG', N'06605', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1824, N'LUNYUK', N'LUNYUK', N'06606', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1825, N'GARUDA', N'GARUDA', N'06661', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1826, N'SINGARAJA', N'SINGARAJA', N'06200', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1827, N'SERIRIT', N'SERIRIT', N'06201', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1828, N'NEGARA', N'NEGARA', N'06202', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1829, N'AMLAPURA', N'AMLAPURA', N'06203', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1830, N'SURAPATI', N'SURAPATI', N'06205', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1831, N'WILAYAH 09 - BANJARMASIN', N'WILAYAH 09 - BANJARMASIN', N'609', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1832, N'SENTRA KANTOR WILAYAH 09', N'SENTRA KANTOR WILAYAH 09', N'609', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1833, N'BARABAI', N'BARABAI', N'25700', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1834, N'AMUNTAI', N'AMUNTAI', N'25701', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1835, N'KANDANGAN', N'KANDANGAN', N'25702', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1836, N'TANJUNG', N'TANJUNG', N'25703', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1837, N'RANTAU D/H . NAGARA', N'RANTAU D/H . NAGARA', N'25704', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1838, N'BALANGAN', N'BALANGAN', N'25705', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1839, N'BINUANG', N'BINUANG', N'25760', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1840, N'KELUA', N'KELUA', N'25762', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1841, N'BANJAR BARU', N'BANJAR BARU', N'15500', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1842, N'MARTAPURA', N'MARTAPURA', N'15501', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1843, N'PELAIHARI', N'PELAIHARI', N'15502', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1844, N'LANDASAN ULIN', N'LANDASAN ULIN', N'15560', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1845, N'DARUSSALAM', N'DARUSSALAM', N'15561', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1846, N'CEMPAKA', N'CEMPAKA', N'15562', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1847, N'ASAM ASAM', N'ASAM ASAM', N'15563', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1848, N'BANJARMASIN', N'BANJARMASIN', N'01500', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1849, N'UNLAM', N'UNLAM', N'01501', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1850, N'A YANI BANJARMASIN', N'A YANI BANJARMASIN', N'01502', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1851, N'A. YANI KM. 1 D/H A. YANI KM. 2', N'A. YANI KM. 1 D/H A. YANI KM. 2', N'01503', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1852, N'P. ANTASARI BANJARMASIN', N'P. ANTASARI BANJARMASIN', N'01504', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1853, N'MARABAHAN', N'MARABAHAN', N'01505', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1854, N'PASARBARU, BMS', N'', N'01506', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1855, N'A. YANI KM 8', N'A. YANI KM 8', N'01507', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1856, N'KAMPUNG MELAYU', N'KAMPUNG MELAYU', N'01560', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1857, N'SUTOYO S', N'SUTOYO S', N'01561', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1858, N'PELINDO III BANJARMASIN', N'PELINDO III BANJARMASIN', N'01562', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1859, N'SENTRA ANTASARI', N'SENTRA ANTASARI', N'01563', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1860, N'SULTAN ADAM', N'SULTAN ADAM', N'01564', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1861, N'BONTANG', N'BONTANG', N'29700', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1862, N'SANGATA', N'SANGATA', N'29701', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1863, N'PUPUK KALTIM', N'PUPUK KALTIM', N'29702', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1864, N'BENGALON', N'BENGALON', N'29760', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1865, N'BHAYANGKARA', N'BHAYANGKARA', N'29761', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1866, N'BALIKPAPAN', N'BALIKPAPAN', N'04900', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1867, N'PASAR KLANDASAN', N'PASAR KLANDASAN', N'04901', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1868, N'AHMAD YANI D/H RAPAK', N'AHMAD YANI D/H RAPAK', N'04902', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1869, N'SEPINGGAN', N'SEPINGGAN', N'04903', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1870, N'PANDANSARI BALIKPAPAN', N'PANDANSARI BALIKPAPAN', N'04904', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1871, N'BALIKPAPAN PERMAI', N'BALIKPAPAN PERMAI', N'04905', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1872, N'TANAH GROGOT', N'TANAH GROGOT', N'04906', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1873, N'BALIKPAPAN BARU', N'BALIKPAPAN BARU', N'04907', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1874, N'PENAJAM PASER UTARA', N'PENAJAM PASER UTARA', N'04908', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1875, N'BATU KAJANG', N'BATU KAJANG', N'04909', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1876, N'BANDARA SEPINGGAN DHI SANTIKA SEPINGGAN ', N'BANDARA SEPINGGAN DHI SANTIKA SEPINGGAN ', N'04910', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1877, N'MT. HARYONO D/H JENDERAL SUDIRMAN', N'MT. HARYONO D/H JENDERAL SUDIRMAN', N'04960', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1878, N'DAMAI', N'DAMAI', N'04961', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1879, N'MANGGAR', N'MANGGAR', N'04962', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1880, N'GUNUNGSARI', N'GUNUNGSARI', N'04963', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1881, N'PASAR SEGAR', N'PASAR SEGAR', N'04964', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1882, N'KARIANGAU', N'KARIANGAU', N'04965', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1883, N'HANDIL', N'HANDIL', N'04911', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1884, N'TERMINAL KARIANGAU', N'TERMINAL KARIANGAU', N'04967', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1885, N'BALIKPAPAN SUPER BLOCK', N'BALIKPAPAN SUPER BLOCK', N'04968', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1886, N'KETAPANG KALBAR', N'KETAPANG KALBAR', N'10800', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1887, N'SUKADANA', N'SUKADANA', N'10801', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1888, N'SANDAI', N'SANDAI', N'10802', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1889, N'KENDAWANGAN', N'KENDAWANGAN', N'10860', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1890, N'TAYAN', N'TAYAN', N'10862', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1891, N'S PARMAN', N'S PARMAN', N'10863', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1892, N'KOTABARU P. LAUT', N'KOTABARU P. LAUT', N'12800', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1893, N'BATU LICIN', N'BATU LICIN', N'12801', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1894, N'SUNGAI DANAU', N'SUNGAI DANAU', N'12802', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1895, N'PAGATAN', N'PAGATAN', N'12860', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1896, N'SERONGGA', N'SERONGGA', N'12861', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1897, N'MUARA TEWEH', N'MUARA TEWEH', N'30600', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1898, N'BUNTOK', N'BUNTOK', N'30601', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1899, N'PURUK CAHU', N'PURUK CAHU', N'30602', NULL)
GO
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1900, N'AMPAH', N'AMPAH', N'30603', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1901, N'NUNUKAN', N'NUNUKAN', N'22100', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1902, N'PULAU SEBATIK', N'PULAU SEBATIK', N'22101', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1903, N'LIM HIE DJUNG', N'LIM HIE DJUNG', N'22160', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1904, N'PANGKALAN BUN', N'PANGKALAN BUN', N'20000', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1905, N'KUMAI', N'KUMAI', N'20001', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1906, N'SUKAMARA', N'SUKAMARA', N'20002', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1907, N'LAMANDAU', N'LAMANDAU', N'20003', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1908, N'UDAN SAID', N'UDAN SAID', N'20060', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1909, N'KARANG MULIA', N'KARANG MULIA', N'20062', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1910, N'PONTIANAK', N'PONTIANAK', N'02300', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1911, N'UNIV. TANJUNGPURA', N'UNIV. TANJUNGPURA', N'02301', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1912, N'PASAR SIANTAN', N'PASAR SIANTAN', N'02302', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1913, N'SEI PINYUH', N'SEI PINYUH', N'02303', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1914, N'GAJAH MADA PONTIANAK', N'GAJAH MADA PONTIANAK', N'02306', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1915, N'SULTAN SYARIF ABDURRAHMAN', N'SULTAN SYARIF ABDURRAHMAN', N'02308', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1916, N'NGABANG', N'NGABANG', N'02309', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1917, N'KUBU RAYA', N'KUBU RAYA', N'02310', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1918, N'SEI JAWI', N'SEI JAWI', N'02360', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1919, N'MEGA MALL', N'MEGA MALL', N'02361', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1920, N'SULTAN MUHAMMAD', N'SULTAN MUHAMMAD', N'02362', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1921, N'PANGLIMA AIM', N'PANGLIMA AIM', N'02363', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1922, N'JERUJU', N'JERUJU', N'02364', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1923, N'MEMPAWAH', N'MEMPAWAH', N'02365', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1924, N'M. YAMIN', N'M. YAMIN', N'02366', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1925, N'KUALA DUA', N'KUALA DUA', N'02367', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1926, N'PALANGKARAYA', N'PALANGKARAYA', N'27800', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1927, N'JL ACHMAD YANI PALANGKARAYA / DARMOSUGONDO', N'JL ACHMAD YANI PALANGKARAYA / DARMOSUGONDO', N'27801', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1928, N'KASONGAN D/H KK. KERENG PANGI', N'KASONGAN D/H KK. KERENG PANGI', N'27804', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1929, N'GUNUNG MAS', N'GUNUNG MAS', N'27807', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1930, N'RAJAWALI PALANGKARAYA', N'RAJAWALI PALANGKARAYA', N'27860', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1931, N'SETH AJI', N'SETH AJI', N'27861', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1932, N'TJILIK RIWUT', N'TJILIK RIWUT', N'27862', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1933, N'RTA MILONO', N'RTA MILONO', N'27863', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1934, N'SINGKAWANG', N'SINGKAWANG', N'15100', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1935, N'BENGKAYANG', N'BENGKAYANG', N'15101', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1936, N'DIPONEGORO SINGKAWANG', N'DIPONEGORO SINGKAWANG', N'15160', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1937, N'ROBAN', N'ROBAN', N'15162', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1938, N'SAMARINDA', N'SAMARINDA', N'18400', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1939, N'TENGGARONG', N'TENGGARONG', N'18401', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1940, N'UNIV. MULAWARMAN', N'UNIV. MULAWARMAN', N'18402', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1941, N'AIR PUTIH', N'AIR PUTIH', N'18403', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1942, N'SUNGAI PINANG DALAM', N'SUNGAI PINANG DALAM', N'18404', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1943, N'SAMARINDA SEBERANG', N'SAMARINDA SEBERANG', N'18405', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1944, N'LOA JANAN', N'LOA JANAN', N'18406', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1945, N'SUTOMO', N'SUTOMO', N'18460', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1946, N'PASAR SEGIRI', N'PASAR SEGIRI', N'18461', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1947, N'A YANI SAMARINDA', N'A YANI SAMARINDA', N'18463', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1948, N'TEPIAN', N'TEPIAN', N'18464', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1949, N'PALARAN', N'PALARAN', N'18465', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1950, N'AW SYAHRANI', N'AW SYAHRANI', N'18466', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1951, N'SENDAWAR', N'SENDAWAR', N'18407', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1952, N'SINTANG ', N'SINTANG ', N'30800', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1953, N'SANGGAU', N'SANGGAU', N'30801', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1954, N'PUTUSSIBAU', N'PUTUSSIBAU', N'30802', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1955, N'NANGA PINOH', N'NANGA PINOH', N'30803', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1956, N'SEKADAU', N'SEKADAU', N'30804', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1957, N'PARINDU', N'PARINDU', N'30805', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1958, N'BALAI KARANGAN', N'BALAI KARANGAN', N'30806', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1959, N'PASAR INPRES SINTANG', N'PASAR INPRES SINTANG', N'30862', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1960, N'SOSOK', N'SOSOK', N'30865', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1961, N'SIMPANG PINOH', N'SIMPANG PINOH', N'30866', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1962, N'SUNGAI AYAK', N'SUNGAI AYAK', N'30867', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1963, N'SAMPIT', N'SAMPIT', N'03500', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1964, N'SAMUDA', N'SAMUDA', N'03501', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1965, N'KUALA PEMBUANG', N'KUALA PEMBUANG', N'03502', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1966, N'PARENGGEAN', N'PARENGGEAN', N'03503', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1967, N'HM ARSYAD', N'HM ARSYAD', N'03560', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1968, N'SAWAHAN', N'SAWAHAN', N'03563', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1969, N'SAMBAS', N'SAMBAS', N'31600', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1970, N'PEMANGKAT', N'PEMANGKAT', N'31601', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1971, N'TEBAS', N'TEBAS', N'31660', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1972, N'TANJUNG REDEB', N'TANJUNG REDEB', N'23400', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1973, N'PASAR ADJI DILAYAS', N'PASAR ADJI DILAYAS', N'23460', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1974, N'TARAKAN', N'TARAKAN', N'22500', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1975, N'PASAR BERINGIN', N'PASAR BERINGIN', N'22501', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1976, N'JUATA PERMAI', N'JUATA PERMAI', N'22560', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1977, N'KUSUMA BANGSA', N'KUSUMA BANGSA', N'22561', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1978, N'KUALA KAPUAS', N'KUALA KAPUAS', N'16600', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1979, N'PULANG PISAU', N'PULANG PISAU', N'16601', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1980, N'TANJUNG SELOR', N'TANJUNG SELOR', N'31800', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1981, N'MALINAU', N'MALINAU', N'31801', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1982, N'TANA TIDUNG', N'TANA TIDUNG', N'31802', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1983, N'WILAYAH  10 - JAKARTA SENAYAN', N'WILAYAH  10 - JAKARTA SENAYAN', N'610', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1984, N'MEGA KUNINGAN D/H DUKUH BAWAH', N'MEGA KUNINGAN D/H DUKUH BAWAH', N'06000', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1985, N'DEPLU RI', N'DEPLU RI', N'06001', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1986, N'WISMA BUMI PUTERA', N'WISMA BUMI PUTERA', N'06002', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1987, N'ALLIANZ TOWER D/H WISMA BUNGA MAS D/H.  KARTIKA PLAZA', N'ALLIANZ TOWER D/H WISMA BUNGA MAS D/H.  KARTIKA PLAZA', N'06003', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1988, N'KCP HUTAMA KARYA TOWER D/H MENARA IMPERIUM D/H ATRIUM MULIA D/H .GEDUNG STAKO', N'KCP HUTAMA KARYA TOWER D/H MENARA IMPERIUM D/H ATRIUM MULIA D/H .GEDUNG STAKO', N'06004', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1989, N'TEMPO SCAN TOWER DH/GRAHA. SURYA INTERNUSA', N'TEMPO SCAN TOWER DH/GRAHA. SURYA INTERNUSA', N'06005', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1990, N'MANGGARAI', N'MANGGARAI', N'06009', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1991, N'WISMA MULIA D/H.  ITC KUNINGAN', N'WISMA MULIA D/H.  ITC KUNINGAN', N'06010', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1992, N'PLAZA SUDIRMAN', N'PLAZA SUDIRMAN', N'06013', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1993, N'THE ENERGY', N'THE ENERGY', N'06014', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1994, N'THE EAST', N'THE EAST', N'06015', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1995, N'MALL AMBASADOR', N'MALL AMBASADOR', N'06016', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1996, N'TELKOM LANDMARK TOWER D/H. RS MRCC', N'TELKOM LANDMARK TOWER D/H. RS MRCC', N'06017', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1997, N'BURSA EFEK INDONESIA D/H. SEMANGGI', N'BURSA EFEK INDONESIA D/H. SEMANGGI', N'06018', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1998, N'SAMPOERNA STRATEGIC', N'SAMPOERNA STRATEGIC', N'06019', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (1999, N'SETIA BUDI BUILDING', N'SETIA BUDI BUILDING', N'06022', NULL)
GO
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2000, N'CHASE PLAZA', N'CHASE PLAZA', N'06024', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2001, N'WTC', N'WTC', N'06060', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2002, N'STASIUN BNI CITY', N'STASIUN BNI CITY', N'06062', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2003, N'JAKARTA PUSAT', N'JAKARTA PUSAT', N'25900', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2004, N'THE SULTAN HOTEL DH HOTEL HILTON', N'THE SULTAN HOTEL DH HOTEL HILTON', N'25901', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2005, N'PASAR TANAH ABANG BLOK A', N'PASAR TANAH ABANG BLOK A', N'25902', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2006, N'PLAZA INDONESIA', N'PLAZA INDONESIA', N'25903', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2007, N'FX SUDIRMAN D/H PLAZA FX STYLE', N'FX SUDIRMAN D/H PLAZA FX STYLE', N'25904', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2008, N'SUDIRMAN PARK', N'SUDIRMAN PARK', N'25905', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2009, N'PASAR TANAH ABANG BLOK B', N'PASAR TANAH ABANG BLOK B', N'25906', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2010, N'WISMA 46', N'WISMA 46', N'25907', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2011, N'GRAND INDONESIA D/H  ASCOTT ', N'', N'', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2012, N'TANAH ABANG', N'TANAH ABANG', N'25910', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2013, N'PASAR TANAH ABANG', N'PASAR TANAH ABANG', N'25911', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2014, N'THAMRIN CITY', N'THAMRIN CITY', N'25960', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2015, N'METRO TANAH ABANG DH. TANAH ABANG BLOK A1', N'METRO TANAH ABANG DH. TANAH ABANG BLOK A1', N'25961', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2016, N'TANAH ABANG BLOK B2', N'TANAH ABANG BLOK B2', N'25963', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2017, N'TANAH ABANG BLOK A2', N'TANAH ABANG BLOK A2', N'25964', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2018, N'PASAR BENHIL', N'PASAR BENHIL', N'25965', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2019, N'WAHID HASYIM', N'WAHID HASYIM', N'25966', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2020, N'THE CITY CENTRE', N'THE CITY CENTRE', N'25967', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2021, N'GAMA TOWER', N'GAMA TOWER', N'25968', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2022, N'THAMRIN RESIDENCE OFFICE PARK', N'THAMRIN RESIDENCE OFFICE PARK', N'25969', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2023, N'MELAWAI RAYA D/H  KEBAYORAN BARU', N'MELAWAI RAYA D/H  KEBAYORAN BARU', N'02200', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2024, N'KEMANG ', N'', N'', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2025, N'WIJAYA GRAND CENTER', N'WIJAYA GRAND CENTER', N'02204', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2026, N'BLOK M D/H. KALIBATA ', N'', N'', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2027, N'PLN PUSAT', N'PLN PUSAT', N'02206', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2028, N'INFOMEDIA D/H PANGLIMA POLIM', N'INFOMEDIA D/H PANGLIMA POLIM', N'02207', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2029, N'WARUNG BUNCIT', N'WARUNG BUNCIT', N'02208', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2030, N'AMPERA', N'AMPERA', N'02209', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2031, N'PEJATEN VILLAGE', N'PEJATEN VILLAGE', N'02210', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2032, N'BANGKA RAYA', N'BANGKA RAYA', N'02212', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2033, N'RADIO DALAM', N'RADIO DALAM', N'02214', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2034, N'DIGITAL BRANCH PACIFIC PLACE', N'DIGITAL BRANCH PACIFIC PLACE', N'02215', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2035, N'MELAWAI', N'MELAWAI', N'02217', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2036, N'MONGINSIDI D/H CIRANJANG D/H KELAPA GADING  ', N'', N'', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2037, N'MAMPANG', N'MAMPANG', N'02219', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2038, N'DUTA MAS FATMAWATI', N'DUTA MAS FATMAWATI', N'02220', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2039, N'KEMANG RAYA', N'KEMANG RAYA', N'02260', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2040, N'CIPETE', N'CIPETE', N'02261', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2041, N'DUREN TIGA', N'DUREN TIGA', N'02262', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2042, N'KEMENTRIAN PU', N'KEMENTRIAN PU', N'02263', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2043, N'FATMAWATI RAYA', N'FATMAWATI RAYA', N'02264', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2044, N'POLDA METRO JAYA', N'POLDA METRO JAYA', N'02266', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2045, N'MABES POLRI', N'MABES POLRI', N'02267', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2046, N'KEMENTERIAN AGRARIA DAN TATA RUANG/BPN', N'KEMENTERIAN AGRARIA DAN TATA RUANG/BPN', N'02268', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2047, N'MENTENG', N'MENTENG', N'09400', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2048, N'STASIUN K.A. GAMBIR', N'STASIUN K.A. GAMBIR', N'09401', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2049, N'DEPARTEMEN PERTAHANAN ', N'', N'', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2050, N'SABANG', N'SABANG', N'09403', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2051, N'PLAZA MENTENG', N'PLAZA MENTENG', N'09404', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2052, N'CIKINI', N'CIKINI', N'09405', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2053, N'PROKLAMASI', N'PROKLAMASI', N'09460', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2054, N'UNIVERSITAS BUNG KARNO D/H CIKINI GOLD CENTRE', N'UNIVERSITAS BUNG KARNO D/H CIKINI GOLD CENTRE', N'09461', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2055, N'PASAR MAYESTIK', N'PASAR MAYESTIK', N'07600', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2056, N'CIPULIR', N'CIPULIR', N'07602', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2057, N'GANDARIA D/H  RADIO DALAM', N'GANDARIA D/H  RADIO DALAM', N'07604', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2058, N'KEBAYORAN LAMA', N'KEBAYORAN LAMA', N'07605', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2059, N'JOGLO D/H. APARTEMEN PERMATA', N'JOGLO D/H. APARTEMEN PERMATA', N'07606', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2060, N'SENAYAN CITY', N'SENAYAN CITY', N'07609', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2061, N'ITC PERMATA HIJAU', N'ITC PERMATA HIJAU', N'07610', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2062, N'GANDARIA CITY', N'GANDARIA CITY', N'07611', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2063, N'PONDOK INDAH ARTERI', N'PONDOK INDAH ARTERI', N'07612', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2064, N'PONDOK PINANG', N'PONDOK PINANG', N'07613', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2065, N'VETERAN BINTARO D/H STP TRISAKTI ', N'', N'', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2066, N'RS PUSAT PERTAMINA ', N'RS PUSAT PERTAMINA ', N'07660', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2067, N'KREO', N'KREO', N'07661', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2068, N'SANTA', N'SANTA', N'07662', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2069, N'KEBAYORAN ICON D/H CIPADU', N'KEBAYORAN ICON D/H CIPADU', N'07663', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2070, N'PASAR MAYESTIK', N'', N'', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2071, N'DIGITAL BRANCH GANDARIA CITY', N'DIGITAL BRANCH GANDARIA CITY', N'07665', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2072, N'SENAYAN', N'SENAYAN', N'06300', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2073, N'RATU PLAZA', N'RATU PLAZA', N'06304', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2074, N'WISMA GKBI', N'WISMA GKBI', N'06306', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2075, N'KEMDIKBUD', N'KEMDIKBUD', N'06307', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2076, N'BENDUNGAN HILIR D/H GRANADA', N'BENDUNGAN HILIR D/H GRANADA', N'06309', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2077, N'SAMUDERA INDONESIA', N'SAMUDERA INDONESIA', N'06311', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2078, N'PALMERAH', N'PALMERAH', N'06312', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2079, N'MANGGALA WANABHAKTI', N'MANGGALA WANABHAKTI', N'06314', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2080, N'PATRAJASA', N'PATRAJASA', N'06316', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2081, N'PLAZA BP JAMSOSTEK D/H WISMA ARGO MANUNGGAL', N'PLAZA BP JAMSOSTEK D/H WISMA ARGO MANUNGGAL', N'06317', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2082, N'KEMANGGISAN UTAMA RAYA D/H RS GRAHA KEDOYA', N'KEMANGGISAN UTAMA RAYA D/H RS GRAHA KEDOYA', N'06360', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2083, N'RS PELNI D/H PETAMBURAN', N'RS PELNI D/H PETAMBURAN', N'06361', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2084, N'WISMA 77 D/H MENARA CITICON', N'WISMA 77 D/H MENARA CITICON', N'06362', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2085, N'BKPM D/H RS SILOAM KEBON JERUK', N'BKPM D/H RS SILOAM KEBON JERUK', N'06363', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2086, N'KEMANDORAN', N'KEMANDORAN', N'06364', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2087, N'MPR-DPR', N'MPR-DPR', N'06365', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2088, N'GRAND SLIPI TOWER DH GRAND SOHO', N'GRAND SLIPI TOWER DH GRAND SOHO', N'06367', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2089, N'HANG LEKIR D/H PAKUBUWONO', N'HANG LEKIR D/H PAKUBUWONO', N'06368', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2090, N'BNI DIGITAL BRANCH PEJOMPONGAN', N'BNI DIGITAL BRANCH PEJOMPONGAN', N'06369', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2091, N'TEBET', N'TEBET', N'12000', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2092, N'DEPARTEMEN TRANSMIGRASI', N'DEPARTEMEN TRANSMIGRASI', N'12001', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2093, N'BKKBN', N'BKKBN', N'12002', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2094, N'RASUNA SAID', N'RASUNA SAID', N'12003', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2095, N'DEPARTEMEN KESEHATAN', N'DEPARTEMEN KESEHATAN', N'12005', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2096, N'DEPARTEMEN TENAGA KERJA', N'DEPARTEMEN TENAGA KERJA', N'12008', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2097, N'MABES TNI CILANGKAP', N'MABES TNI CILANGKAP', N'12010', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2098, N'DEPARTEMEN KEHAKIMAN', N'DEPARTEMEN KEHAKIMAN', N'12011', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2099, N'ANGKASA HALIM PERDANA KUSUMA', N'ANGKASA HALIM PERDANA KUSUMA', N'12012', NULL)
GO
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2100, N'LAPANGAN ROS', N'LAPANGAN ROS', N'12013', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2101, N'TEBET BARAT', N'TEBET BARAT', N'12014', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2102, N'TEBET TIMUR', N'TEBET TIMUR', N'12015', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2103, N'MENARA BIDAKARA', N'MENARA BIDAKARA', N'12016', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2104, N'MENARA JAMSOSTEK', N'MENARA JAMSOSTEK', N'12017', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2105, N'EPICENTRUM', N'EPICENTRUM', N'12018', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2106, N'SUCOFINDO', N'SUCOFINDO', N'12019', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2107, N'SMESCO INDONESIA ', N'SMESCO INDONESIA ', N'12021', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2108, N'CENTENNIAL TOWER', N'CENTENNIAL TOWER', N'12022', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2109, N'KALIBATA PASAR MINGGU', N'KALIBATA PASAR MINGGU', N'12023', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2110, N'MENARA MTH D/H MENARA SAIDAH', N'MENARA MTH D/H MENARA SAIDAH', N'12024', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2111, N'MAMPANG PRAPATAN', N'MAMPANG PRAPATAN', N'12025', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2112, N'SAHARJO', N'SAHARJO', N'12060', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2113, N'KEMENTERIAN KOPERASI DAN UKM D/H KALIBATA CITY', N'KEMENTERIAN KOPERASI DAN UKM D/H KALIBATA CITY', N'12061', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2114, N'MABESAL CILANGKAP', N'MABESAL CILANGKAP', N'12062', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2115, N'FAKULTAS KEDOKTERAN-UKI', N'FAKULTAS KEDOKTERAN-UKI', N'12063', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2116, N'DIGITAL BRANCH KOTA KASABLANKA', N'DIGITAL BRANCH KOTA KASABLANKA', N'12064', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2117, N'BRANTAS ABIPRAYA', N'BRANTAS ABIPRAYA', N'12065', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2118, N'WASKITA KARYA', N'WASKITA KARYA', N'12066', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2119, N'WISMA KORINDO', N'WISMA KORINDO', N'12067', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2120, N'PINANG RANTI', N'PINANG RANTI', N'12068', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2121, N'BULOG', N'BULOG', N'12069', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2122, N'WILAYAH 11 - MANADO', N'WILAYAH 11 - MANADO', N'611', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2123, N'BITUNG', N'BITUNG', N'13900', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2124, N'AIRMADIDI D/H UNIMA ', N'', N'', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2125, N'GIRIAN', N'GIRIAN', N'13960', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2126, N'GORONTALO', N'GORONTALO', N'03900', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2127, N'LIMBOTO', N'LIMBOTO', N'03901', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2128, N'SUDIRMAN GORONTALO D/H IKIP GORONTALO', N'SUDIRMAN GORONTALO D/H IKIP GORONTALO', N'03902', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2129, N'MARISA GORONTALO', N'MARISA GORONTALO', N'03903', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2130, N'KWANDANG', N'KWANDANG', N'03904', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2131, N'TILAMUTA', N'TILAMUTA', N'03905', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2132, N'TELAGA', N'TELAGA', N'03960', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2133, N'KOTAMOBAGU', N'KOTAMOBAGU', N'10600', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2134, N'PARIS MALL DH/ TOTABUAN EX. CPM. A.YANI', N'PARIS MALL DH/ TOTABUAN EX. CPM. A.YANI', N'10601', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2135, N'BOROKO', N'BOROKO', N'10602', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2136, N'TUTUYAN', N'TUTUYAN', N'10603', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2137, N'LOLAK', N'LOLAK', N'10604', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2138, N'LUWUK', N'LUWUK', N'13300', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2139, N'BANGGAI', N'BANGGAI', N'13301', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2140, N'TOILI', N'TOILI', N'13302', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2141, N'BATUI', N'BATUI', N'13360', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2142, N'MANADO', N'MANADO', N'01800', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2143, N'UNSRAT MANADO', N'UNSRAT MANADO', N'01801', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2144, N'WANEA', N'WANEA', N'01806', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2145, N'MEGA MAS D/H.  TELKOM MANADO', N'MEGA MAS D/H.  TELKOM MANADO', N'01807', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2146, N'KANAKA MANADO', N'KANAKA MANADO', N'01810', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2147, N'BANDARA SAM RATULANGI', N'BANDARA SAM RATULANGI', N'01812', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2148, N'BAHU', N'BAHU', N'01813', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2149, N'RANOTANA', N'RANOTANA', N'01860', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2150, N'CALACA', N'CALACA', N'01861', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2151, N'PAAL DUA', N'PAAL DUA', N'01862', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2152, N'MANTOS', N'MANTOS', N'01863', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2153, N'PANIKI', N'PANIKI', N'01815', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2154, N'DIGITAL BRANCH MANADO TOWN SQUARE', N'DIGITAL BRANCH MANADO TOWN SQUARE', N'01866', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2155, N'P A L U', N'P A L U', N'22200', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2156, N'DONGGALA', N'DONGGALA', N'22201', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2157, N'UNTAD PALU', N'UNTAD PALU', N'22202', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2158, N'IMAM BONJOL PALU', N'IMAM BONJOL PALU', N'22203', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2159, N'MASOMBA PALU', N'MASOMBA PALU', N'22204', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2160, N'MANONDA PALU', N'MANONDA PALU', N'22205', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2161, N'SIGI', N'SIGI', N'22206', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2162, N'DEWI SARTIKA PALU', N'DEWI SARTIKA PALU', N'22260', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2163, N'PANTOLOAN', N'PANTOLOAN', N'22261', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2164, N'PARIGI D/H POSO', N'PARIGI D/H POSO', N'06800', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2165, N'TOLAI', N'TOLAI', N'06801', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2166, N'POSO', N'POSO', N'06802', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2167, N'BUNGKU', N'BUNGKU', N'06803', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2168, N'AMPANA', N'AMPANA', N'06804', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2169, N'BAHODOPI', N'BAHODOPI', N'06861', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2170, N'TAHUNA', N'TAHUNA', N'18800', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2171, N'SIAU', N'SIAU', N'18801', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2172, N'TOLI-TOLI', N'TOLI-TOLI', N'19700', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2173, N'BUOL TOLI-TOLI', N'BUOL TOLI-TOLI', N'19701', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2174, N'SONI', N'SONI', N'19702', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2175, N'TERNATE', N'TERNATE', N'09700', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2176, N'SOASIO', N'SOASIO', N'09701', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2177, N'TOBELO', N'TOBELO', N'09702', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2178, N'SOFIFI', N'SOFIFI', N'09703', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2179, N'JAILOLO', N'JAILOLO', N'09704', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2180, N'MOROTAI', N'MOROTAI', N'09705', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2181, N'WEDA', N'WEDA', N'09706', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2182, N'BACAN', N'BACAN', N'09707', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2183, N'JATILAND', N'JATILAND', N'09760', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2184, N'BASTIONG', N'BASTIONG', N'09763', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2185, N'TOMOHON', N'TOMOHON', N'31700', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2186, N'TONDANO', N'TONDANO', N'31701', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2187, N'KAWANGKOAN DH. LANGOWAN', N'KAWANGKOAN DH. LANGOWAN', N'31702', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2188, N'AMURANG', N'AMURANG', N'31703', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2189, N'RATAHAN', N'RATAHAN', N'31704', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2190, N'WILAYAH 12 - JAKARTA KOTA', N'WILAYAH 12 - JAKARTA KOTA', N'612', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2191, N'DAAN MOGOT D/H TOMANG PLAZA ', N'DAAN MOGOT D/H TOMANG PLAZA ', N'23700', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2192, N'GRAHA ELOK MAS D/H GREEN GARDEN', N'GRAHA ELOK MAS D/H GREEN GARDEN', N'23701', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2193, N'TANJUNG DUREN', N'TANJUNG DUREN', N'23702', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2194, N'INTERCON', N'INTERCON', N'23705', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2195, N'TAMAN PALEM', N'TAMAN PALEM', N'23706', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2196, N'DAAN MOGOT BARU', N'DAAN MOGOT BARU', N'23707', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2197, N'SEASON CITY LATUMENTEN', N'SEASON CITY LATUMENTEN', N'23708', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2198, N'PURI KENCANA', N'PURI KENCANA', N'23709', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2199, N'PURI SENTRA NIAGA', N'PURI SENTRA NIAGA', N'23710', NULL)
GO
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2200, N'GREEN VILLE', N'GREEN VILLE', N'23711', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2201, N'SEMANAN', N'SEMANAN', N'23712', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2202, N'CITY RESORT', N'CITY RESORT', N'23713', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2203, N'CITRA GARDEN 2', N'CITRA GARDEN 2', N'23714', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2204, N'CENTRAL PARK', N'CENTRAL PARK', N'23715', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2205, N'KEMANGGISAN', N'KEMANGGISAN', N'23716', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2206, N'GREEN GARDEN', N'GREEN GARDEN', N'23717', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2207, N'JELAMBAR BARU', N'JELAMBAR BARU', N'23718', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2208, N'MERUYA', N'MERUYA', N'23719', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2209, N'PURI INDAH', N'PURI INDAH', N'23721', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2210, N'KEBON JERUK D/H GRAHA KENCANA', N'KEBON JERUK D/H GRAHA KENCANA', N'23722', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2211, N'MERCU BUANA', N'MERCU BUANA', N'23723', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2212, N'PURI KEMBANGAN', N'PURI KEMBANGAN', N'23760', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2213, N'POS PENGUMBEN', N'POS PENGUMBEN', N'23761', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2214, N'MERUYA ILIR', N'MERUYA ILIR', N'23763', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2215, N'PESANGGRAHAN', N'PESANGGRAHAN', N'23764', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2216, N'CITRA 2 EXTENTION', N'CITRA 2 EXTENTION', N'23765', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2217, N'TAMAN KENCANA', N'TAMAN KENCANA', N'23766', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2218, N'PASAR CENGKARENG D/H TAMAN SURYA', N'PASAR CENGKARENG D/H TAMAN SURYA', N'23767', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2219, N'GREEN LAKE CITY D/H  GREEN LAKE', N'GREEN LAKE CITY D/H  GREEN LAKE', N'23768', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2220, N'TAMAN RATU', N'TAMAN RATU', N'23769', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2221, N'GRAHA MULTI', N'GRAHA MULTI', N'23770', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2222, N'HARMONI', N'HARMONI', N'07000', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2223, N'SEKRETARIAT NEGARA', N'SEKRETARIAT NEGARA', N'07001', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2224, N'PETOJO', N'PETOJO', N'07002', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2225, N'CIDENG', N'CIDENG', N'07003', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2226, N'UNTAR II', N'UNTAR II', N'07004', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2227, N'UNTARI', N'UNTARI', N'07005', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2228, N'KAMPUS F TRISAKTI', N'KAMPUS F TRISAKTI', N'07006', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2229, N'ABDUL MUIS ', N'ABDUL MUIS ', N'07007', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2230, N'KAMPUS A GEDUNG L TRISAKTI', N'KAMPUS A GEDUNG L TRISAKTI', N'07008', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2231, N'CARINGIN', N'CARINGIN', N'07011', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2232, N'HAYAM WURUK', N'HAYAM WURUK', N'07013', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2233, N'PERUSAHAAN GAS NEGARA', N'PERUSAHAAN GAS NEGARA', N'07014', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2234, N'MANDALA DH/ GEDUNG MANDALA AIR LINE', N'MANDALA DH/ GEDUNG MANDALA AIR LINE', N'07015', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2235, N'GAJAH MADA', N'GAJAH MADA', N'07016', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2236, N'ITC ROXY MAS', N'ITC ROXY MAS', N'07017', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2237, N'KETAPANG BUSINESS CENTRE', N'KETAPANG BUSINESS CENTRE', N'07061', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2238, N'KAMPUS B UNIV. TRISAKTI', N'KAMPUS B UNIV. TRISAKTI', N'07062', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2239, N'GROGOL DHI.KK SUMBER WARAS', N'GROGOL DHI.KK SUMBER WARAS', N'07063', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2240, N'MENARA MERDEKA', N'MENARA MERDEKA', N'07064', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2241, N'JAKARTA KOTA', N'JAKARTA KOTA', N'00100', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2242, N'ANCOL D/H TAMAN IMPIAN JAYA ANCOL', N'ANCOL D/H TAMAN IMPIAN JAYA ANCOL', N'00101', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2243, N'JITC KEMAYORAN', N'JITC KEMAYORAN', N'00103', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2244, N'GLODOK', N'GLODOK', N'00104', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2245, N'HARCO MANGGA DUA', N'HARCO MANGGA DUA', N'00107', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2246, N'LTC GLODOK', N'LTC GLODOK', N'00108', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2247, N'KOBEXINDO DH/ CORDOVA', N'KOBEXINDO DH/ CORDOVA', N'00109', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2248, N'MAHKOTA ANCOL', N'MAHKOTA ANCOL', N'00110', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2249, N'PANGERAN JAYAKARTA', N'PANGERAN JAYAKARTA', N'00111', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2250, N'MANGGA DUA', N'MANGGA DUA', N'00112', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2251, N'ITC MANGGA DUA', N'ITC MANGGA DUA', N'00113', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2252, N'MANGGA DUA MALL', N'MANGGA DUA MALL', N'00160', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2253, N'PINANGSIA', N'PINANGSIA', N'00162', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2254, N'PANCORAN GLODOK', N'PANCORAN GLODOK', N'00163', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2255, N'MANGGA BESAR VIII', N'MANGGA BESAR VIII', N'00164', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2256, N'RAJAWALI', N'RAJAWALI', N'00165', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2257, N'PPKK', N'PPKK', N'00166', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2258, N'PECENONGAN', N'PECENONGAN', N'13000', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2259, N'PASAR BARU JAKARTA', N'PASAR BARU JAKARTA', N'13001', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2260, N'DEPARTEMEN AGAMA', N'DEPARTEMEN AGAMA', N'13002', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2261, N'KREKOT', N'KREKOT', N'13003', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2262, N'DEPARTEMEN KEUANGAN', N'DEPARTEMEN KEUANGAN', N'13004', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2263, N'SAWAH BESAR D/H ASEM REGES', N'SAWAH BESAR D/H ASEM REGES', N'13005', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2264, N'MANGGA BESAR', N'MANGGA BESAR', N'13006', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2265, N'TAMANSARI D/H LOKASARI', N'TAMANSARI D/H LOKASARI', N'13007', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2266, N'GUNUNG SAHARI', N'GUNUNG SAHARI', N'13008', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2267, N'KARANG ANYAR', N'KARANG ANYAR', N'13060', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2268, N'KEMENDAGRI', N'KEMENDAGRI', N'13061', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2269, N'ROA MALAKA', N'ROA MALAKA', N'17200', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2270, N'MUARA KARANG', N'MUARA KARANG', N'17201', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2271, N'PLUIT KENCANA', N'PLUIT KENCANA', N'17202', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2272, N'SUNDA KELAPA ', N'', N'', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2273, N'JEMBATAN LIMA', N'JEMBATAN LIMA', N'17204', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2274, N'BANDENGAN D/H PASAR PAGI', N'BANDENGAN D/H PASAR PAGI', N'17208', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2275, N'CBD PLUIT', N'CBD PLUIT', N'17209', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2276, N'PANTAI INDAH KAPUK', N'PANTAI INDAH KAPUK', N'17210', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2277, N'TELUK GONG', N'TELUK GONG', N'17211', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2278, N'TUBAGUS ANGKE', N'TUBAGUS ANGKE', N'17212', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2279, N'LANDMARK PLUIT D/H PLUIT VILLAGE', N'LANDMARK PLUIT D/H PLUIT VILLAGE', N'17214', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2280, N'MUARA ANGKE', N'MUARA ANGKE', N'17215', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2281, N'ASEMKA', N'ASEMKA', N'17216', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2282, N'ELANG LAUT D/H GALERI NIAGA MEDITERANIA  II', N'ELANG LAUT D/H GALERI NIAGA MEDITERANIA  II', N'17217', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2283, N'KEAGUNGAN', N'KEAGUNGAN', N'17218', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2284, N'PASAR PAGI MANGGA DUA', N'PASAR PAGI MANGGA DUA', N'17260', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2285, N'MUARA KARANG II', N'MUARA KARANG II', N'17261', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2286, N'TAMAN HARAPAN INDAH', N'TAMAN HARAPAN INDAH', N'17263', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2287, N'KAPUK RAYA', N'KAPUK RAYA', N'17264', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2288, N'PERNIAGAAN ASEMKA', N'PERNIAGAAN ASEMKA', N'17265', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2289, N'MUARA BARU', N'MUARA BARU', N'17266', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2290, N'ADONARA TJ. PRIOK', N'ADONARA TJ. PRIOK', N'02401', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2291, N'SUNTER', N'SUNTER', N'02402', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2292, N'KBN CAKUNG', N'KBN CAKUNG', N'02403', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2293, N'PASAR KOJA', N'PASAR KOJA', N'02404', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2294, N'UTPK KOJA *)', N'UTPK KOJA *)', N'02407', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2295, N'STIP/AIP MARUNDA', N'STIP/AIP MARUNDA', N'02408', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2296, N'PLUMPANG', N'PLUMPANG', N'02409', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2297, N'KBN MARUNDA D/H KAS MOBIL', N'KBN MARUNDA D/H KAS MOBIL', N'02410', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2298, N'BABEK TNI AL', N'BABEK TNI AL', N'02411', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2299, N'SUNTER AGUNG', N'SUNTER AGUNG', N'02414', NULL)
GO
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2300, N'ENGGANO', N'ENGGANO', N'02415', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2301, N'SUNTER GARDEN', N'SUNTER GARDEN', N'02416', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2302, N'GRIYA UTAMA D/H  STIE IBII', N'GRIYA UTAMA D/H  STIE IBII', N'02417', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2303, N'BP3IP', N'BP3IP', N'02460', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2304, N'SUKAPURA', N'SUKAPURA', N'02461', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2305, N'PADEMANGAN', N'PADEMANGAN', N'02462', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2306, N'KEBON BAWANG', N'KEBON BAWANG', N'02463', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2307, N'PASAR PERMAI', N'PASAR PERMAI', N'02464', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2308, N'KALIBARU', N'KALIBARU', N'02465', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2309, N'SUNTER INDAH', N'SUNTER INDAH', N'02466', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2310, N'DANAU AGUNG SUNTER', N'DANAU AGUNG SUNTER', N'02469', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2311, N'WILAYAH  14 - JAKARTA BSD', N'WILAYAH  14 - JAKARTA BSD', N'614', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2312, N'BOGOR', N'BOGOR', N'06100', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2313, N'PAJAJARAN D/H IPB BARANGSIANG', N'PAJAJARAN D/H IPB BARANGSIANG', N'06101', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2314, N'IPB DERMAGA', N'IPB DERMAGA', N'06102', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2315, N'TAJUR', N'TAJUR', N'06104', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2316, N'WARUNG JAMBU BOGOR', N'WARUNG JAMBU BOGOR', N'06105', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2317, N'PASAR MERDEKA', N'PASAR MERDEKA', N'06107', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2318, N'CIMANGGU', N'CIMANGGU', N'06109', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2319, N'BARANANGSIANG DH/ PLAZA EKALOKASARI', N'BARANANGSIANG DH/ PLAZA EKALOKASARI', N'06111', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2320, N'PASAR ANYAR', N'PASAR ANYAR', N'06112', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2321, N'LEUWILIANG', N'LEUWILIANG', N'06113', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2322, N'SURYA KENCANA', N'SURYA KENCANA', N'06160', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2323, N'CISARUA', N'CISARUA', N'06162', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2324, N'CILUAR', N'CILUAR', N'06164', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2325, N'SUDIRMAN BOGOR', N'SUDIRMAN BOGOR', N'06165', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2326, N'CIOMAS', N'CIOMAS', N'06167', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2327, N'UNIVERSITAS PAKUAN', N'UNIVERSITAS PAKUAN', N'06168', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2328, N'BUMI SERPONG DAMAI', N'BUMI SERPONG DAMAI', N'31000', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2329, N'LIPPO KARAWACI', N'LIPPO KARAWACI', N'31001', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2330, N'CIKUPA', N'CIKUPA', N'31002', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2331, N'SUTERA NIAGA', N'SUTERA NIAGA', N'31003', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2332, N'BALARAJA', N'BALARAJA', N'31004', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2333, N'CILEDUG', N'CILEDUG', N'31005', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2334, N'GADING SERPONG', N'GADING SERPONG', N'31006', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2335, N'PAHLAWAN SERIBU DH/ VILLA MELATI MAS', N'PAHLAWAN SERIBU DH/ VILLA MELATI MAS', N'31007', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2336, N'PASAR MODERN BSD', N'PASAR MODERN BSD', N'31008', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2337, N'PALEM SEMI D/H BENTON JUNCTION ', N'PALEM SEMI D/H BENTON JUNCTION ', N'31009', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2338, N'BINTARO I ', N'BINTARO I ', N'31010', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2339, N'MENTENG BINTARO D/H PASAR MODERN BINTARO JAYA D/H BINTARO TRADE CENTRE', N'MENTENG BINTARO D/H PASAR MODERN BINTARO JAYA D/H BINTARO TRADE CENTRE', N'31011', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2340, N'LARANGAN', N'LARANGAN', N'31012', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2341, N'RS SILOAM KARAWACI', N'RS SILOAM KARAWACI', N'31060', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2342, N'GRAHA RAYA BINTARO', N'GRAHA RAYA BINTARO', N'31061', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2343, N'ALAM SUTERA', N'ALAM SUTERA', N'31062', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2344, N'GOLDEN VIENNA', N'GOLDEN VIENNA', N'31063', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2345, N'AEON MALL', N'AEON MALL', N'31064', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2346, N'SERPONG', N'SERPONG', N'31065', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2347, N'CIBINONG', N'CIBINONG', N'31300', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2348, N'CILEUNGSI D/H LEUWILIANG', N'CILEUNGSI D/H LEUWILIANG', N'31301', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2349, N'MAYOR OKING', N'MAYOR OKING', N'31302', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2350, N'CITEUREUP', N'CITEUREUP', N'31303', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2351, N'GUNUNG PUTRI', N'GUNUNG PUTRI', N'31304', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2352, N'SENTUL CITY', N'SENTUL CITY', N'31360', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2353, N'CIBINONG CITY CENTER', N'CIBINONG CITY CENTER', N'31362', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2354, N'BOJONG GEDE', N'BOJONG GEDE', N'31363', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2355, N'CILEGON', N'CILEGON', N'12500', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2356, N'MERAK', N'MERAK', N'12501', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2357, N'PT KRAKATAU STEEL', N'PT KRAKATAU STEEL', N'12502', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2358, N'PASAR ANYER', N'PASAR ANYER', N'12503', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2359, N'CILEGON CITY SQUARE', N'CILEGON CITY SQUARE', N'12560', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2360, N'KRAKATAU POSCO', N'KRAKATAU POSCO', N'12561', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2361, N'UBP SURALAYA', N'UBP SURALAYA', N'12562', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2362, N'CILEGON CENTER MALL', N'CILEGON CENTER MALL', N'12563', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2363, N'FATMAWATI', N'FATMAWATI', N'25100', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2364, N'UPN VETERAN PONDOK LABU', N'UPN VETERAN PONDOK LABU', N'25101', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2365, N'CINERE', N'CINERE', N'25102', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2366, N'PAMULANG', N'PAMULANG', N'25103', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2367, N'PASAR MINGGU', N'PASAR MINGGU', N'25104', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2368, N'PONDOK INDAH SHOPP. MALL ', N'', N'', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2369, N'CILANDAK KKO', N'CILANDAK KKO', N'25112', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2370, N'PIM-2 D/H. GRAHA ARSA', N'PIM-2 D/H. GRAHA ARSA', N'25113', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2371, N'BONA INDAH', N'BONA INDAH', N'25115', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2372, N'CINERE BUSINESS CENTER', N'CINERE BUSINESS CENTER', N'25116', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2373, N'PLAZA PONDOK INDAH', N'PLAZA PONDOK INDAH', N'25117', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2374, N'ARKADIA', N'ARKADIA', N'25118', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2375, N'UNIV.ISLAM NEGERI SYARIF HIDAYATULLAH D/H IAIN CIPUTAT', N'UNIV.ISLAM NEGERI SYARIF HIDAYATULLAH D/H IAIN CIPUTAT', N'25119', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2376, N'CIRENDEU', N'CIRENDEU', N'25121', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2377, N'PONDOK CABE', N'PONDOK CABE', N'25160', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2378, N'VETERAN KESEHATAN', N'VETERAN KESEHATAN', N'25161', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2379, N'BINTARO ARCADE', N'BINTARO ARCADE', N'25162', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2380, N'CIPUTAT', N'CIPUTAT', N'25163', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2381, N'PONDOK AREN', N'PONDOK AREN', N'25164', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2382, N'PERTAMINA HULU ENERGI', N'PERTAMINA HULU ENERGI', N'25165', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2383, N'THE MANHATTAN SQUARE', N'THE MANHATTAN SQUARE', N'25120', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2384, N'WISMA PONDOK INDAH', N'WISMA PONDOK INDAH', N'25167', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2385, N'SOUTH QUARTER', N'SOUTH QUARTER', N'25168', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2386, N'RPX CENTER', N'RPX CENTER', N'25169', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2387, N'KEMENTRIAN PERTANIAN', N'KEMENTRIAN PERTANIAN', N'25170', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2388, N'MARGONDA', N'MARGONDA', N'28500', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2389, N'NUSANTARA - DEPOK I', N'NUSANTARA - DEPOK I', N'28501', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2390, N'GRIYA DEPOK ASRI - DEPOK II', N'GRIYA DEPOK ASRI - DEPOK II', N'28502', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2391, N'PARUNG', N'PARUNG', N'28503', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2392, N'TRANSYOGI CIBUBUR', N'TRANSYOGI CIBUBUR', N'28505', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2393, N'CIBUBUR INDAH', N'CIBUBUR INDAH', N'28506', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2394, N'DEPOK TIMUR', N'DEPOK TIMUR', N'28507', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2395, N'PONDOK CINA D/H  R.S. SENTRA MEDIKA', N'PONDOK CINA D/H  R.S. SENTRA MEDIKA', N'28508', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2396, N'CIBUBUR ', N'', N'', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2397, N'DEPOK MAHARAJA', N'DEPOK MAHARAJA', N'28560', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2398, N'PESONA KHAYANGAN', N'PESONA KHAYANGAN', N'28561', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2399, N'CISALAK', N'CISALAK', N'28562', NULL)
GO
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2400, N'SERANG', N'SERANG', N'04600', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2401, N'PANDEGLANG', N'PANDEGLANG', N'04601', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2402, N'KRAGILAN D/H. TAMBAK ', N'', N'', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2403, N'RANGKASBITUNG', N'RANGKASBITUNG', N'04606', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2404, N'LABUAN', N'LABUAN', N'04607', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2405, N'PASAR RAU', N'PASAR RAU', N'04660', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2406, N'UNTIRTA', N'UNTIRTA', N'04662', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2407, N'CIKANDE', N'CIKANDE', N'04663', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2408, N'SERANG CITY', N'SERANG CITY', N'04664', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2409, N'MALINGPING', N'MALINGPING', N'04667', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2410, N'TANGERANG', N'TANGERANG', N'08100', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2411, N'CIMONE INDAH', N'CIMONE INDAH', N'08101', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2412, N'MODERN LAND', N'MODERN LAND', N'08102', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2413, N'GAJAH TUNGGAL', N'GAJAH TUNGGAL', N'08107', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2414, N'WISMA NIAGA SOEWARNA', N'WISMA NIAGA SOEWARNA', N'08108', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2415, N'GMF BANDARA S-HATTA', N'GMF BANDARA S-HATTA', N'08109', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2416, N'CARGO AREA', N'CARGO AREA', N'08110', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2417, N'TANGERANG CITY', N'TANGERANG CITY', N'08117', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2418, N'GEDUNG GARUDA BSH', N'GEDUNG GARUDA BSH', N'08118', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2419, N'TERMINAL III BANDARA SOEKARNO - HATTA ', N'TERMINAL III BANDARA SOEKARNO - HATTA ', N'08119', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2420, N'CIPONDOH ', N'CIPONDOH ', N'08121', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2421, N'DUTA GARDENIA ', N'DUTA GARDENIA ', N'08122', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2422, N'KUTABUMI', N'KUTABUMI', N'08123', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2423, N'TERMINAL B BANDARA S-H *)', N'TERMINAL B BANDARA S-H *)', N'08160', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2424, N'TERMINAL F BANDARA S-H *)', N'TERMINAL F BANDARA S-H *)', N'08161', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2425, N'PASAR BARU TANGERANG DH/ TKI SELAPAJANG BANDARA', N'PASAR BARU TANGERANG DH/ TKI SELAPAJANG BANDARA', N'08162', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2426, N'IMAM BONJOL TANGERANG', N'IMAM BONJOL TANGERANG', N'08164', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2427, N'PORIS INDAH', N'PORIS INDAH', N'08165', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2428, N'KI SAMAUN', N'KI SAMAUN', N'08167', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2429, N'KARANG TENGAH', N'KARANG TENGAH', N'08170', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2430, N'PASAR MUTIARA KARAWACI D/H BOROBUDUR', N'PASAR MUTIARA KARAWACI D/H BOROBUDUR', N'08171', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2431, N'CITRA RAYA', N'CITRA RAYA', N'08172', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2432, N'CIMONE CITI MALL', N'CIMONE CITI MALL', N'08173', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2433, N'SRIWIJAYA AIR', N'SRIWIJAYA AIR', N'08174', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2434, N'CURUG', N'CURUG', N'08175', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2435, N'UI  DEPOK', N'UI  DEPOK', N'27300', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2436, N'UI SALEMBA ', N'', N'', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2437, N'UNIVERSITAS PANCASILA', N'UNIVERSITAS PANCASILA', N'27303', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2438, N'JAGAKARSA', N'JAGAKARSA', N'27305', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2439, N'KELAPA DUA', N'KELAPA DUA', N'27306', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2440, N'TANJUNG BARAT', N'TANJUNG BARAT', N'27307', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2441, N'CIGANJUR', N'CIGANJUR', N'27308', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2442, N'UNIVERSITAR GUNADHARMA', N'UNIVERSITAR GUNADHARMA', N'27360', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2443, N'WILAYAH  15 - JAKARTA KEMAYORAN', N'WILAYAH  15 - JAKARTA KEMAYORAN', N'615', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2444, N'BEKASI', N'BEKASI', N'18100', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2445, N'JUANDA D/H COMMERCIAL CENTRE', N'JUANDA D/H COMMERCIAL CENTRE', N'18102', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2446, N'PONDOK GEDE ', N'PONDOK GEDE ', N'18105', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2447, N'TAMAN GALAXY', N'TAMAN GALAXY', N'18106', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2448, N'PONDOK UNGU ', N'', N'', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2449, N'KEMANG PRATAMA', N'KEMANG PRATAMA', N'18110', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2450, N'CITRAGRAND', N'CITRAGRAND', N'18113', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2451, N'HARAPAN INDAH', N'HARAPAN INDAH', N'18114', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2452, N'SUMBER ARTA KALIMALANG', N'SUMBER ARTA KALIMALANG', N'18115', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2453, N'KOTA WISATA', N'KOTA WISATA', N'18116', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2454, N'JATIASIH', N'JATIASIH', N'18117', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2455, N'JATIWARINGIN', N'JATIWARINGIN', N'18118', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2456, N'SUMARECON BEKASI DH/BEKASI SQUARE', N'SUMARECON BEKASI DH/BEKASI SQUARE', N'18119', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2457, N'RAYA HANKAM D/H PLAZA PONDOK GEDE ', N'RAYA HANKAM D/H PLAZA PONDOK GEDE ', N'18120', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2458, N'BOULEVAR HIJAU', N'BOULEVAR HIJAU', N'18123', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2459, N'RAWA LUMBU DH/ PLN RAWA SEMUT', N'RAWA LUMBU DH/ PLN RAWA SEMUT', N'18160', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2460, N'GRAND MALL BEKASI', N'GRAND MALL BEKASI', N'18161', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2461, N'GRAND GALAXY', N'GRAND GALAXY', N'18163', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2462, N'BINTARA', N'BINTARA', N'18165', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2463, N'UNIVERSITAS MERCUBUANA D/H JATI MURNI D/H KRANGGAN', N'UNIVERSITAS MERCUBUANA D/H JATI MURNI D/H KRANGGAN', N'18166', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2464, N'JATI MAKMUR', N'JATI MAKMUR', N'18167', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2465, N'BANTAR GEBANG', N'BANTAR GEBANG', N'18168', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2466, N'JATIBENING', N'JATIBENING', N'18172', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2467, N'JAKARTA GARDEN CITY', N'JAKARTA GARDEN CITY', N'18175', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2468, N'GAMBIR', N'GAMBIR', N'08900', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2469, N'MERDEKA SELATAN', N'MERDEKA SELATAN', N'08901', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2470, N'MNC PLAZA D/H BIMANTARA', N'MNC PLAZA D/H BIMANTARA', N'08902', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2471, N'PERTAMINA PUSAT', N'PERTAMINA PUSAT', N'08903', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2472, N'MH. THAMRIN', N'MH. THAMRIN', N'08904', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2473, N'KWITANG', N'KWITANG', N'08906', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2474, N'KEMENTRIAN KELAUTAN DAN PERIKANAN', N'KEMENTRIAN KELAUTAN DAN PERIKANAN', N'08960', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2475, N'SOPO DEL', N'SOPO DEL', N'08961', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2476, N'JABABEKA', N'JABABEKA', N'31100', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2477, N'BULAK KAPAL', N'BULAK KAPAL', N'31101', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2478, N'CIKARANG', N'CIKARANG', N'31102', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2479, N'LIPPO CIKARANG', N'LIPPO CIKARANG', N'31103', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2480, N'KALIMAS', N'KALIMAS', N'31104', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2481, N'MUTIARA GADING', N'MUTIARA GADING', N'31105', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2482, N'CIKARANG BARU', N'CIKARANG BARU', N'31106', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2483, N'TAMBUN', N'TAMBUN', N'31107', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2484, N'CIKARANG CENTRAL CITY D/H PASAR SENTRAL CIKARANG', N'CIKARANG CENTRAL CITY D/H PASAR SENTRAL CIKARANG', N'31108', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2485, N'RE MARTADINATA D/H SENTRA GROSIR CIKARANG', N'RE MARTADINATA D/H SENTRA GROSIR CIKARANG', N'31160', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2486, N'MM 2100', N'MM 2100', N'31161', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2487, N'CIBITUNG', N'CIBITUNG', N'31162', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2488, N'GRAND WISATA D/H JATIMULYA', N'GRAND WISATA D/H JATIMULYA', N'31163', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2489, N'WISMA ASRI', N'WISMA ASRI', N'31165', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2490, N'DELTA MAS D/H SAKURA PARK', N'DELTA MAS D/H SAKURA PARK', N'31166', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2491, N'JATINEGARA', N'JATINEGARA', N'03700', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2492, N'BKN D/H  KOPERTIS', N'BKN D/H  KOPERTIS', N'03704', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2493, N'PASAR REBO D/H RSUD PASAR REBO', N'PASAR REBO D/H RSUD PASAR REBO', N'03705', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2494, N'JASAMARGA', N'JASAMARGA', N'03706', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2495, N'KANTOR LINGKUNGAN HIDUP', N'KANTOR LINGKUNGAN HIDUP', N'03707', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2496, N'PASAR INDUK KRAMAT JATI D/H  KRAMAT JATI D/H  TARAKANITA', N'PASAR INDUK KRAMAT JATI D/H  KRAMAT JATI D/H  TARAKANITA', N'03708', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2497, N'MATRAMAN', N'MATRAMAN', N'03709', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2498, N'CIPAYUNG D/H BP2TKI D/H. DEWI SARTIKA', N'CIPAYUNG D/H BP2TKI D/H. DEWI SARTIKA', N'03712', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2499, N'TAMINI SQUARE', N'TAMINI SQUARE', N'03713', NULL)
GO
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2500, N'CIPINANG JAYA', N'CIPINANG JAYA', N'03714', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2501, N'DEWI SARTIKA', N'DEWI SARTIKA', N'03715', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2502, N'CONDET RAYA', N'CONDET RAYA', N'03716', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2503, N'TAMAN MINI INDONESIA INDAH', N'TAMAN MINI INDONESIA INDAH', N'03717', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2504, N'JATINEGARA TRADE CENTRE ', N'', N'', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2505, N'PUSAT GROSIR CILILITAN ', N'', N'', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2506, N'JATINEGARA TIMUR D/H OTISTA', N'JATINEGARA TIMUR D/H OTISTA', N'03762', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2507, N'RS POLRI', N'RS POLRI', N'03763', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2508, N'WIJAYA KARYA', N'WIJAYA KARYA', N'03764', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2509, N'INDOMOBIL TOWER', N'INDOMOBIL TOWER', N'03765', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2510, N'KELAPA GADING', N'KELAPA GADING', N'30900', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2511, N'BOULEVARD RAYA', N'BOULEVARD RAYA', N'30901', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2512, N'GADING INDAH', N'GADING INDAH', N'30902', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2513, N'GADING RIVIERA', N'GADING RIVIERA', N'30903', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2514, N'WISMA MITRA SUNTER', N'WISMA MITRA SUNTER', N'30904', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2515, N'GADING PANDAWA D/H BUTIK KIRANA D/H. KELAPA GADING D/H . MERDEKA TIMUR', N'GADING PANDAWA D/H BUTIK KIRANA D/H. KELAPA GADING D/H . MERDEKA TIMUR', N'30905', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2516, N'MOI D/H BOULEVARD KELAPA GADING', N'MOI D/H BOULEVARD KELAPA GADING', N'30906', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2517, N'BOULEVARD MENARA GADING', N'BOULEVARD MENARA GADING', N'30907', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2518, N'BOULEVARD TIMUR KELAPA GADING', N'BOULEVARD TIMUR KELAPA GADING', N'30908', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2519, N'ARTHA GADING ', N'', N'', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2520, N'YOS SUDARSO BKI', N'YOS SUDARSO BKI', N'30960', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2521, N'BOULEVARD UTARA', N'BOULEVARD UTARA', N'30961', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2522, N'HERMINA OFFICE TOWER', N'HERMINA OFFICE TOWER', N'30964', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2523, N'KRAMAT', N'KRAMAT', N'01700', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2524, N'HALIM PERDANA KUSUMA', N'HALIM PERDANA KUSUMA', N'01701', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2525, N'ASKES', N'ASKES', N'01702', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2526, N'SENEN', N'SENEN', N'01703', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2527, N'CEMPAKA MAS', N'CEMPAKA MAS', N'01704', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2528, N'DEPARTEMEN SOSIAL D/H  CEMPAKA PUTIH', N'DEPARTEMEN SOSIAL D/H  CEMPAKA PUTIH', N'01707', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2529, N'KEMAYORAN AIRPORT', N'KEMAYORAN AIRPORT', N'01709', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2530, N'GARUDA GUNUNG SAHARI D/H GRAHA SEJAHTERA', N'GARUDA GUNUNG SAHARI D/H GRAHA SEJAHTERA', N'01710', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2531, N'PASAR SENEN JAYA', N'PASAR SENEN JAYA', N'01711', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2532, N'PERCETAKAN NEGARA', N'PERCETAKAN NEGARA', N'01713', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2533, N'KENARI', N'KENARI', N'01760', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2534, N'GARUDA', N'GARUDA', N'01761', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2535, N'RSIA BERKAT IBU', N'RSIA BERKAT IBU', N'01762', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2536, N'RAWASARI', N'RAWASARI', N'01763', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2537, N'CEMPAKA PUTIH', N'CEMPAKA PUTIH', N'01764', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2538, N'PASAR JOHAR ', N'PASAR JOHAR ', N'01765', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2539, N'RSPAD GATOT SUBROTO', N'RSPAD GATOT SUBROTO', N'01766', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2540, N'CEMPAKA PUTIH PERMAI', N'CEMPAKA PUTIH PERMAI', N'01767', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2541, N'PASAR PRAMUKA', N'PASAR PRAMUKA', N'01768', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2542, N'GREEN PRAMUKA', N'GREEN PRAMUKA', N'01769', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2543, N'KARAWANG', N'KARAWANG', N'09500', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2544, N'KOSAMBI D/H. TELAGA SARI KRWG', N'KOSAMBI D/H. TELAGA SARI KRWG', N'09502', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2545, N'RENGASDENGKLOK', N'RENGASDENGKLOK', N'09503', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2546, N'CIKAMPEK', N'CIKAMPEK', N'09505', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2547, N'SUROTOKUNTO', N'SUROTOKUNTO', N'09507', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2548, N'PASAR CIKAMPEK', N'PASAR CIKAMPEK', N'09560', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2549, N'TELAGASARI', N'TELAGASARI', N'09561', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2550, N'KAWASAN INDUSTRI SURYA CIPTA', N'KAWASAN INDUSTRI SURYA CIPTA', N'09562', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2551, N'GALUH MAS', N'GALUH MAS', N'09563', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2552, N'GRAND TARUMA', N'GRAND TARUMA', N'09564', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2553, N'KIIC', N'KIIC', N'09565', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2554, N'RAWAMANGUN', N'RAWAMANGUN', N'24300', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2555, N'UNIV.NEGERI JAKARTA D/H IKIP JKT', N'UNIV.NEGERI JAKARTA D/H IKIP JKT', N'24301', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2556, N'CAKUNG', N'CAKUNG', N'24302', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2557, N'JL. PAUS RAWAMANGUN', N'JL. PAUS RAWAMANGUN', N'24304', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2558, N'PASAR INDUK CIPINANG', N'PASAR INDUK CIPINANG', N'24305', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2559, N'BUARAN', N'BUARAN', N'24306', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2560, N'STMT TRISAKTI D/H KAMPUS C UNIV. TRISAKTI', N'STMT TRISAKTI D/H KAMPUS C UNIV. TRISAKTI', N'24307', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2561, N'PONDOK BAMBU', N'PONDOK BAMBU', N'24308', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2562, N'UNIV. DHARMA PERSADA', N'UNIV. DHARMA PERSADA', N'24309', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2563, N'BALAI PUSTAKA', N'BALAI PUSTAKA', N'24310', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2564, N'PASAR KLENDER', N'PASAR KLENDER', N'24312', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2565, N'JKT. INDUST. ESTATE PL. GADUNG', N'JKT. INDUST. ESTATE PL. GADUNG', N'24313', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2566, N'PONDOK KELAPA', N'PONDOK KELAPA', N'24314', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2567, N'UTAN KAYU', N'UTAN KAYU', N'24315', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2568, N'BILLY MOON - KALIMALANG', N'BILLY MOON - KALIMALANG', N'24316', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2569, N'PASAR SUNAN GIRI', N'PASAR SUNAN GIRI', N'24360', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2570, N'KAMPUNG AMBON', N'KAMPUNG AMBON', N'24361', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2571, N'PENGGILINGAN CAKUNG', N'PENGGILINGAN CAKUNG', N'24362', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2572, N'DUREN SAWIT', N'DUREN SAWIT', N'24363', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2573, N'PAHLAWAN REVOLUSI', N'PAHLAWAN REVOLUSI', N'24364', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2574, N'BIZ PARK', N'BIZ PARK', N'24365', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2575, N'PULOGADUNG TRADE CENTRE', N'PULOGADUNG TRADE CENTRE', N'24366', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2576, N'WILAYAH  16 - PAPUA', N'WILAYAH  16 - PAPUA', N'616', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2577, N'BIAK', N'BIAK', N'29900', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2578, N'NABIRE', N'NABIRE', N'29901', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2579, N'WAROPEN', N'WAROPEN', N'29902', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2580, N'SERUI', N'SERUI', N'29903', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2581, N'PASAR SP NABIRE', N'PASAR SP NABIRE', N'29961', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2582, N'JAYAPURA', N'JAYAPURA', N'26800', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2583, N'SENTANI', N'SENTANI', N'26801', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2584, N'ABEPURA', N'ABEPURA', N'26802', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2585, N'TIMIKA', N'TIMIKA', N'26803', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2586, N'KEEROM', N'KEEROM', N'26804', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2587, N'SARMI', N'SARMI', N'26805', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2588, N'KOYA', N'KOYA', N'26806', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2589, N'WAMENA', N'WAMENA', N'26807', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2590, N'WAENA', N'WAENA', N'26860', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2591, N'KEMIRI SENTANI', N'KEMIRI SENTANI', N'26861', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2592, N'A YANI JAYAPURA', N'A YANI JAYAPURA', N'26862', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2593, N'ENTROP', N'ENTROP', N'26863', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2594, N'YOS SUDARSO', N'YOS SUDARSO', N'26864', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2595, N'KAMORO JAYA D/H SULTAN HASANUDDIN', N'KAMORO JAYA D/H SULTAN HASANUDDIN', N'26865', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2596, N'TANAH HITAM', N'TANAH HITAM', N'26867', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2597, N'DOK V D/H DOK IX', N'DOK V D/H DOK IX', N'26868', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2598, N'JALAN BARU', N'JALAN BARU', N'26869', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2599, N'MERAUKE', N'MERAUKE', N'30000', NULL)
GO
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2600, N'ASIKI', N'ASIKI', N'30001', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2601, N'UNIVERSITAS MUSAMUS', N'UNIVERSITAS MUSAMUS', N'30060', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2602, N'TANAH MERAH', N'TANAH MERAH', N'30061', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2603, N'MAM D/H MAAM', N'MAM D/H MAAM', N'30062', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2604, N'WAMANGGU', N'WAMANGGU', N'30063', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2605, N'BIA D/H BIO', N'BIA D/H BIO', N'30064', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2606, N'MANOKWARI', N'MANOKWARI', N'29800', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2607, N'BINTUNI', N'BINTUNI', N'29801', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2608, N'KAIMANA', N'KAIMANA', N'29802', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2609, N'PRAFI', N'PRAFI', N'29803', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2610, N'FAKFAK', N'FAKFAK', N'29804', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2611, N'WOSI', N'WOSI', N'29860', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2612, N'PEMDA PAPUA BARAT', N'PEMDA PAPUA BARAT', N'29862', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2613, N'SORONG', N'SORONG', N'27900', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2614, N'AIMAS', N'AIMAS', N'27901', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2615, N'WAISAI', N'WAISAI', N'27902', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2616, N'TEMINABUAN', N'TEMINABUAN', N'27903', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2617, N'A YANI SORONG', N'A YANI SORONG', N'27960', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2618, N'PASAR BOSWESEN', N'PASAR BOSWESEN', N'27961', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2619, N'WILAYAH 17 - YOGYAKARTA', N'WILAYAH 17 - YOGYAKARTA', N'617', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2620, N'BOYOLALI', N'BOYOLALI', N'31400', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2621, N'AMPEL', N'AMPEL', N'31460', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2622, N'PEMKAB BOYOLALI', N'PEMKAB BOYOLALI', N'31461', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2623, N'KARANG GEDE', N'KARANG GEDE', N'31462', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2624, N'CILACAP', N'CILACAP', N'04400', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2625, N'KROYA', N'KROYA', N'04401', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2626, N'MAJENANG', N'MAJENANG', N'04402', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2627, N'SIDAREJA', N'SIDAREJA', N'04403', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2628, N'GATOT SUBROTO CILACAP', N'GATOT SUBROTO CILACAP', N'04460', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2629, N'SAMPANG', N'SAMPANG', N'04461', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2630, N'KAWUNGANTEN', N'KAWUNGANTEN', N'04462', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2631, N'MT HARYONO', N'MT HARYONO', N'04463', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2632, N'ADIPALA', N'ADIPALA', N'04464', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2633, N'KEBUMEN', N'KEBUMEN', N'07300', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2634, N'GOMBONG', N'GOMBONG', N'07301', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2635, N'PREMBUN', N'PREMBUN', N'07302', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2636, N'SUMPIUH', N'SUMPIUH', N'07360', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2637, N'PETANAHAN', N'PETANAHAN', N'07361', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2638, N'PANJER', N'PANJER', N'07362', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2639, N'KLATEN', N'KLATEN', N'20700', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2640, N'DELANGGU', N'DELANGGU', N'20701', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2641, N'KLATEN KOTA', N'KLATEN KOTA', N'20760', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2642, N'PEDAN', N'PEDAN', N'20761', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2643, N'PRAMBANAN', N'PRAMBANAN', N'20762', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2644, N'JATINOM', N'JATINOM', N'20763', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2645, N'MAGELANG', N'MAGELANG', N'02100', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2646, N'MUNTILAN', N'MUNTILAN', N'02101', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2647, N'MUNGKID', N'MUNGKID', N'02102', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2648, N'TANJUNG', N'TANJUNG', N'02109', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2649, N'REJOWINANGUN', N'REJOWINANGUN', N'02160', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2650, N'METROSQUARE', N'METROSQUARE', N'02161', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2651, N'GRABAG', N'GRABAG', N'02162', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2652, N'PURBALINGGA', N'PURBALINGGA', N'08400', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2653, N'BANJARNEGARA', N'BANJARNEGARA', N'08401', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2654, N'BOBOTSARI D/H KK BOBOT SARI', N'BOBOTSARI D/H KK BOBOT SARI', N'08402', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2655, N'KLAMPOK', N'KLAMPOK', N'08460', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2656, N'PURWOKERTO', N'PURWOKERTO', N'02800', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2657, N'UNSOED', N'UNSOED', N'02801', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2658, N'PASAR WAGE', N'PASAR WAGE', N'02802', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2659, N'WANGON', N'WANGON', N'02803', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2660, N'BUMIAYU', N'BUMIAYU', N'02804', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2661, N'SOKARAJA', N'SOKARAJA', N'02805', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2662, N'AJIBARANG', N'AJIBARANG', N'02806', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2663, N'DUKUHWALUH D/H UNIV. MUHAMMADIYAH PURWOKERTO', N'DUKUHWALUH D/H UNIV. MUHAMMADIYAH PURWOKERTO', N'02861', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2664, N'OVERSTE ISDIMAN D/H RS ELISABETH ', N'OVERSTE ISDIMAN D/H RS ELISABETH ', N'02862', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2665, N'KARANGLEWAS', N'KARANGLEWAS', N'02863', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2666, N'PURWOREJO', N'PURWOREJO', N'13800', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2667, N'KUTOARJO', N'KUTOARJO', N'13801', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2668, N'SURAKARTA', N'SURAKARTA', N'01100', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2669, N'KARANGANYAR', N'KARANGANYAR', N'01101', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2670, N'NUSUKAN', N'NUSUKAN', N'01102', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2671, N'UNIV SEBELAS MARET', N'UNIV SEBELAS MARET', N'01103', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2672, N'SRAGEN', N'SRAGEN', N'01104', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2673, N'KARTASURA', N'KARTASURA', N'01105', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2674, N'KAMPUS UNS', N'KAMPUS UNS', N'01107', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2675, N'SUKOWATI', N'SUKOWATI', N'01109', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2676, N'KK ADI SUCIPTO D/H BANDARA ADI SUMARMO', N'KK ADI SUCIPTO D/H BANDARA ADI SUMARMO', N'01108', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2677, N'GEMOLONG', N'GEMOLONG', N'01161', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2678, N'JATEN', N'JATEN', N'01163', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2679, N'MOJOSONGO', N'MOJOSONGO', N'01165', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2680, N'ADI SOEMARMO', N'ADI SOEMARMO', N'01166', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2681, N'SLAMET RIYADI SOLO D/H PSR. KLEWER', N'SLAMET RIYADI SOLO D/H PSR. KLEWER', N'22700', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2682, N'PASAR LEGI', N'PASAR LEGI', N'22701', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2683, N'PASAR KLEWER', N'PASAR KLEWER', N'22702', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2684, N'UNIV. MUHAMMADIYAH D/H KK. UNIV.MUHAMMADIYAH', N'UNIV. MUHAMMADIYAH D/H KK. UNIV.MUHAMMADIYAH', N'22703', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2685, N'RSI KUSTATI', N'RSI KUSTATI', N'22704', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2686, N'SOLO BARU', N'SOLO BARU', N'22705', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2687, N'SUKOHARJO', N'SUKOHARJO', N'22707', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2688, N'PALUR', N'PALUR', N'22712', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2689, N'VETERAN', N'VETERAN', N'22762', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2690, N'GENTAN', N'GENTAN', N'22764', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2691, N'TEMANGGUNG', N'TEMANGGUNG', N'09600', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2692, N'PARAKAN', N'PARAKAN', N'09601', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2693, N'NGADIREJO', N'NGADIREJO', N'09660', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2694, N'UNIV. GAJAH MADA YOGYAKARTA', N'UNIV. GAJAH MADA YOGYAKARTA', N'22800', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2695, N'SARJANA WIYATA D/H  KUSUMANEGARA', N'SARJANA WIYATA D/H  KUSUMANEGARA', N'22801', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2696, N'SLEMAN', N'SLEMAN', N'22802', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2697, N'JL. GODEAN', N'JL. GODEAN', N'22803', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2698, N'WATES', N'WATES', N'22804', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2699, N'UGM YOGYAKARTA', N'UGM YOGYAKARTA', N'22805', NULL)
GO
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2700, N'PASAR KOLOMBO', N'PASAR KOLOMBO', N'22806', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2701, N'UNIV. NEGERI YOGYAKARTA', N'UNIV. NEGERI YOGYAKARTA', N'22807', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2702, N'UPN VETERAN', N'UPN VETERAN', N'22808', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2703, N'JL. DIPONEGORO D/H  DIPONEGORO D/H PRIMAGAMA', N'JL. DIPONEGORO D/H  DIPONEGORO D/H PRIMAGAMA', N'22809', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2704, N'PASCA SARJANA UGM D/H PASCA SARJANA UGM', N'PASCA SARJANA UGM D/H PASCA SARJANA UGM', N'22810', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2705, N'UNIV. KRISTEN DUTA WACANA ', N'', N'', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2706, N'KALASAN', N'KALASAN', N'22812', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2707, N'PALAGAN', N'PALAGAN', N'22860', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2708, N'TAJEM', N'TAJEM', N'22861', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2709, N'SUDIRMAN YOGYAKARTA', N'SUDIRMAN YOGYAKARTA', N'22862', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2710, N'SIDOLUHUR', N'SIDOLUHUR', N'22863', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2711, N'DIGITAL BRANCH HARTONO MALL', N'DIGITAL BRANCH HARTONO MALL', N'22864', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2712, N'SENTOLO', N'SENTOLO', N'22865', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2713, N'WONOGIRI', N'WONOGIRI', N'19100', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2714, N'BATURETNO', N'BATURETNO', N'19101', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2715, N'JATISRONO', N'JATISRONO', N'19102', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2716, N'WONOSOBO', N'WONOSOBO', N'07200', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2717, N'KERTEK', N'KERTEK', N'07201', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2718, N'YOGYAKARTA', N'YOGYAKARTA', N'00400', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2719, N'K.H. A. DAHLAN', N'K.H. A. DAHLAN', N'00401', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2720, N'ADISUCIPTO', N'ADISUCIPTO', N'00402', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2721, N'AMBARUKMO YOGYAKARTA', N'AMBARUKMO YOGYAKARTA', N'00403', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2722, N'WONOSARI', N'WONOSARI', N'00404', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2723, N'JL. PARANGTRITIS D/H. STIE KERJASAMA', N'JL. PARANGTRITIS D/H. STIE KERJASAMA', N'00405', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2724, N'BANTUL', N'BANTUL', N'00406', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2725, N'JL. SUTOYO D/H KK GEDUNG KEUANGAN  NEGARA D/H PBB', N'JL. SUTOYO D/H KK GEDUNG KEUANGAN  NEGARA D/H PBB', N'00407', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2726, N'KOTAGEDE', N'KOTAGEDE', N'00408', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2727, N'JL. MAGELANG', N'JL. MAGELANG', N'00409', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2728, N'BERINGHARJO', N'BERINGHARJO', N'00460', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2729, N'JOGJATRONIK', N'JOGJATRONIK', N'00461', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2730, N'HOS COKROAMINOTO', N'HOS COKROAMINOTO', N'00462', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2731, N'GAMPING', N'GAMPING', N'00463', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2732, N'PIYUNGAN', N'PIYUNGAN', N'00464', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2733, N'TEMON', N'TEMON', N'00465', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2734, N'IMOGIRI TIMUR', N'IMOGIRI TIMUR', N'00466', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2735, N'WILAYAH 18 - MALANG', N'WILAYAH 18 - MALANG', N'618', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2736, N'BRAWIJAYA', N'BRAWIJAYA', N'25300', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2737, N'UNEMA MALANG', N'UNEMA MALANG', N'25301', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2738, N'UNIV. MERDEKA', N'UNIV. MERDEKA', N'25302', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2739, N'ITN-2 TASIKMADU', N'ITN-2 TASIKMADU', N'25303', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2740, N'MALANG TOWN SQUARE', N'MALANG TOWN SQUARE', N'25304', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2741, N'SOEKARNO HATTA MALANG D/H ITN MALANG', N'SOEKARNO HATTA MALANG D/H ITN MALANG', N'25305', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2742, N'PAKIS', N'PAKIS', N'25361', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2743, N'GADANG', N'GADANG', N'25362', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2744, N'LUMAJANG', N'LUMAJANG', N'29200', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2745, N'PASIRIAN', N'PASIRIAN', N'29201', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2746, N'MALANG', N'MALANG', N'12100', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2747, N'UNIV.MUHAMMADYAH', N'UNIV.MUHAMMADYAH', N'12103', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2748, N'BATU', N'BATU', N'12104', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2749, N'KEPANJEN ', N'KEPANJEN ', N'12105', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2750, N'SINGOSARI', N'SINGOSARI', N'12109', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2751, N'PASAR BESAR ', N'PASAR BESAR ', N'12110', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2752, N'BLIMBING', N'BLIMBING', N'12112', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2753, N'SAWOJAJAR', N'SAWOJAJAR', N'12113', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2754, N'LAWANG', N'LAWANG', N'12114', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2755, N'DAMPIT', N'DAMPIT', N'12115', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2756, N'TUREN', N'TUREN', N'12116', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2757, N'SUKUN', N'SUKUN', N'12164', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2758, N'GONDANGLEGI', N'GONDANGLEGI', N'12165', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2759, N'SUNANDAR PS', N'SUNANDAR PS', N'12166', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2760, N'BULULAWANG', N'BULULAWANG', N'12167', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2761, N'PACITAN', N'PACITAN', N'31500', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2762, N'BALE HARJO', N'BALE HARJO', N'31560', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2763, N'PONOROGO', N'PONOROGO', N'28800', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2764, N'SOMOROTO', N'SOMOROTO', N'28805', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2765, N'JETIS', N'JETIS', N'28860', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2766, N'BALONG', N'BALONG', N'28861', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2767, N'PROBOLINGGO', N'PROBOLINGGO', N'10900', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2768, N'KRAKSAAN', N'KRAKSAAN', N'10901', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2769, N'PAITON', N'PAITON', N'10961', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2770, N'PASURUAN', N'PASURUAN', N'21600', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2771, N'BANGIL', N'BANGIL', N'21601', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2772, N'PANDAAN', N'PANDAAN', N'21602', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2773, N'KEJAPANAN', N'KEJAPANAN', N'21603', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2774, N'PURWOSARI', N'PURWOSARI', N'21661', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2775, N'TULUNGAGUNG', N'TULUNGAGUNG', N'24200', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2776, N'TRENGGALEK', N'TRENGGALEK', N'24201', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2777, N'NGUNUT', N'NGUNUT', N'24202', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2778, N'BANDUNG TULUNGAGUNG', N'BANDUNG TULUNGAGUNG', N'24260', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2779, N'IAIN TULUNGAGUNG', N'IAIN TULUNGAGUNG', N'24261', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2780, N'BLITAR', N'BLITAR', N'18300', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2781, N'WLINGI', N'WLINGI', N'18301', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2782, N'SRENGAT', N'SRENGAT', N'18360', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2783, N'SUTOJAYAN', N'SUTOJAYAN', N'18361', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2784, N'KESAMBEN', N'KESAMBEN', N'18362', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2785, N'BANYUWANGI', N'BANYUWANGI', N'09100', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2786, N'GENTENG', N'GENTENG', N'09101', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2787, N'BANTERANG D/H PELABUHAN KETAPANG', N'BANTERANG D/H PELABUHAN KETAPANG', N'09102', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2788, N'MUNCAR', N'MUNCAR', N'09103', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2789, N'ROGOJAMPI', N'ROGOJAMPI', N'09104', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2790, N'JAJAG', N'JAJAG', N'09160', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2791, N'KETAPANG', N'KETAPANG', N'09161', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2792, N'JEMBER', N'JEMBER', N'03000', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2793, N'UNIV. JEMBER', N'UNIV. JEMBER', N'03001', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2794, N'TANGGUL', N'TANGGUL', N'03002', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2795, N'BONDOWOSO', N'BONDOWOSO', N'03004', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2796, N'BALUNG', N'BALUNG', N'03005', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2797, N'PASAR TANJUNG', N'PASAR TANJUNG', N'03006', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2798, N'RAMBIPUJI', N'RAMBIPUJI', N'03062', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2799, N'AMBULU', N'AMBULU', N'03063', NULL)
GO
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2800, N'KALISAT', N'KALISAT', N'03064', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2801, N'KEDIRI', N'KEDIRI', N'11300', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2802, N'NGANJUK', N'NGANJUK', N'11301', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2803, N'PARE', N'PARE', N'11302', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2804, N'KERTOSONO', N'KERTOSONO', N'11303', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2805, N'REJOSO', N'REJOSO', N'11304', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2806, N'MOJOROTO', N'MOJOROTO', N'11305', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2807, N'PASAR PAHING', N'PASAR PAHING', N'11306', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2808, N'PASAR WATES', N'PASAR WATES', N'11361', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2809, N'WARUJAYENG', N'WARUJAYENG', N'11362', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2810, N'KANDANGAN', N'KANDANGAN', N'11363', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2811, N'GUDANG GARAM', N'GUDANG GARAM', N'11364', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2812, N'MADIUN', N'MADIUN', N'11900', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2813, N'NGAWI', N'NGAWI', N'11901', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2814, N'MAGETAN', N'MAGETAN', N'11902', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2815, N'PAHLAWAN', N'PAHLAWAN', N'11903', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2816, N'CARUBAN', N'CARUBAN', N'11904', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2817, N'DOLOPO', N'DOLOPO', N'11961', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2818, N'MANTINGAN', N'MANTINGAN', N'11962', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2819, N'SITUBONDO', N'SITUBONDO', N'08200', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2820, N'BESUKI', N'BESUKI', N'08260', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2821, N'', N'', N'', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2822, N'DIV TBS', N'', N'', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2823, N'DIV DGO', N'', N'', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2824, N'BNI SYARIAH', N'', N'', NULL)
INSERT [dbo].[Cabang] ([Id], [Nama], [KodeCabang], [Sandi], [isDeleted]) VALUES (2825, N'-', N'', N'', NULL)
SET IDENTITY_INSERT [dbo].[Cabang] OFF
GO
SET IDENTITY_INSERT [dbo].[Kelompok] ON 

INSERT [dbo].[Kelompok] ([Id], [Nama], [Singkatan], [Createdate], [Updatedate], [IsDeleted]) VALUES (1, N'KKR', N'KKR', CAST(N'2022-06-09T00:00:00.0000000' AS DateTime2), CAST(N'2022-06-09T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[Kelompok] ([Id], [Nama], [Singkatan], [Createdate], [Updatedate], [IsDeleted]) VALUES (2, N'PGO', N'PGO', CAST(N'2022-06-09T00:00:00.0000000' AS DateTime2), CAST(N'2022-06-09T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[Kelompok] ([Id], [Nama], [Singkatan], [Createdate], [Updatedate], [IsDeleted]) VALUES (3, N'CST', N'CST', CAST(N'2022-06-09T00:00:00.0000000' AS DateTime2), CAST(N'2022-06-09T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[Kelompok] ([Id], [Nama], [Singkatan], [Createdate], [Updatedate], [IsDeleted]) VALUES (5, N'PST', N'PST', CAST(N'2022-06-09T00:00:00.0000000' AS DateTime2), CAST(N'2022-06-09T00:00:00.0000000' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[Kelompok] OFF
GO
SET IDENTITY_INSERT [dbo].[Keterangan] ON 

INSERT [dbo].[Keterangan] ([Id], [Nama]) VALUES (1, N'Pengembalian Dana')
INSERT [dbo].[Keterangan] ([Id], [Nama]) VALUES (2, N'Bilateral')
INSERT [dbo].[Keterangan] ([Id], [Nama]) VALUES (3, N'Dana Tidak tertagih')
SET IDENTITY_INSERT [dbo].[Keterangan] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([Id], [Nama], [Warna]) VALUES (1, N'On Progres', N'Biru')
INSERT [dbo].[Status] ([Id], [Nama], [Warna]) VALUES (2, N'2', N'Hijau')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeTrans] ON 

INSERT [dbo].[TypeTrans] ([Id], [Type], [UnitId]) VALUES (1, N'Surat Masuk', 1)
INSERT [dbo].[TypeTrans] ([Id], [Type], [UnitId]) VALUES (2, N'Surat Keluar', 1)
INSERT [dbo].[TypeTrans] ([Id], [Type], [UnitId]) VALUES (3, N'RTGS Masuk', 2)
INSERT [dbo].[TypeTrans] ([Id], [Type], [UnitId]) VALUES (4, N'RTGS Keluar', 2)
SET IDENTITY_INSERT [dbo].[TypeTrans] OFF
GO
SET IDENTITY_INSERT [dbo].[Unit] ON 

INSERT [dbo].[Unit] ([Id], [Nama], [KelompokId], [Createdate], [Updatedate], [IsDeleted]) VALUES (1, N'Kliring', 1, NULL, NULL, NULL)
INSERT [dbo].[Unit] ([Id], [Nama], [KelompokId], [Createdate], [Updatedate], [IsDeleted]) VALUES (2, N'RTGS', 1, NULL, NULL, NULL)
INSERT [dbo].[Unit] ([Id], [Nama], [KelompokId], [Createdate], [Updatedate], [IsDeleted]) VALUES (3, N'Admin', 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Unit] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 07/09/2022 16:34:15 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 07/09/2022 16:34:15 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 07/09/2022 16:34:15 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 07/09/2022 16:34:15 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 07/09/2022 16:34:15 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 07/09/2022 16:34:15 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetUsers_KelompokId]    Script Date: 07/09/2022 16:34:15 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUsers_KelompokId] ON [dbo].[AspNetUsers]
(
	[KelompokId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetUsers_UnitId]    Script Date: 07/09/2022 16:34:15 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUsers_UnitId] ON [dbo].[AspNetUsers]
(
	[UnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 07/09/2022 16:34:15 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DataToken_KelompokId]    Script Date: 07/09/2022 16:34:15 ******/
CREATE NONCLUSTERED INDEX [IX_DataToken_KelompokId] ON [dbo].[DataToken]
(
	[KelompokId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DataToken_ModulId]    Script Date: 07/09/2022 16:34:15 ******/
CREATE NONCLUSTERED INDEX [IX_DataToken_ModulId] ON [dbo].[DataToken]
(
	[ModulId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_T_Kliring_AcceptorId]    Script Date: 07/09/2022 16:34:15 ******/
CREATE NONCLUSTERED INDEX [IX_T_Kliring_AcceptorId] ON [dbo].[T_Kliring]
(
	[AcceptorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_T_Kliring_AlasanId]    Script Date: 07/09/2022 16:34:15 ******/
CREATE NONCLUSTERED INDEX [IX_T_Kliring_AlasanId] ON [dbo].[T_Kliring]
(
	[AlasanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_T_Kliring_BankId]    Script Date: 07/09/2022 16:34:15 ******/
CREATE NONCLUSTERED INDEX [IX_T_Kliring_BankId] ON [dbo].[T_Kliring]
(
	[BankId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_T_Kliring_CabangId]    Script Date: 07/09/2022 16:34:15 ******/
CREATE NONCLUSTERED INDEX [IX_T_Kliring_CabangId] ON [dbo].[T_Kliring]
(
	[CabangId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_T_Kliring_CreaterId]    Script Date: 07/09/2022 16:34:15 ******/
CREATE NONCLUSTERED INDEX [IX_T_Kliring_CreaterId] ON [dbo].[T_Kliring]
(
	[CreaterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_T_Kliring_KeteranganId]    Script Date: 07/09/2022 16:34:15 ******/
CREATE NONCLUSTERED INDEX [IX_T_Kliring_KeteranganId] ON [dbo].[T_Kliring]
(
	[KeteranganId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_T_Kliring_StatusId]    Script Date: 07/09/2022 16:34:15 ******/
CREATE NONCLUSTERED INDEX [IX_T_Kliring_StatusId] ON [dbo].[T_Kliring]
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_T_Kliring_TestkeyId]    Script Date: 07/09/2022 16:34:15 ******/
CREATE NONCLUSTERED INDEX [IX_T_Kliring_TestkeyId] ON [dbo].[T_Kliring]
(
	[TestkeyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_T_Kliring_TypeId]    Script Date: 07/09/2022 16:34:15 ******/
CREATE NONCLUSTERED INDEX [IX_T_Kliring_TypeId] ON [dbo].[T_Kliring]
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_T_RTGS_BankId]    Script Date: 07/09/2022 16:34:15 ******/
CREATE NONCLUSTERED INDEX [IX_T_RTGS_BankId] ON [dbo].[T_RTGS]
(
	[BankId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_T_RTGS_CabangId]    Script Date: 07/09/2022 16:34:15 ******/
CREATE NONCLUSTERED INDEX [IX_T_RTGS_CabangId] ON [dbo].[T_RTGS]
(
	[CabangId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_T_RTGS_KeteranganId]    Script Date: 07/09/2022 16:34:15 ******/
CREATE NONCLUSTERED INDEX [IX_T_RTGS_KeteranganId] ON [dbo].[T_RTGS]
(
	[KeteranganId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_T_RTGS_StatusId]    Script Date: 07/09/2022 16:34:15 ******/
CREATE NONCLUSTERED INDEX [IX_T_RTGS_StatusId] ON [dbo].[T_RTGS]
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_T_RTGS_TestkeyId]    Script Date: 07/09/2022 16:34:15 ******/
CREATE NONCLUSTERED INDEX [IX_T_RTGS_TestkeyId] ON [dbo].[T_RTGS]
(
	[TestkeyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_T_RTGS_TypeId]    Script Date: 07/09/2022 16:34:15 ******/
CREATE NONCLUSTERED INDEX [IX_T_RTGS_TypeId] ON [dbo].[T_RTGS]
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Testkey_KeteranganId]    Script Date: 07/09/2022 16:34:15 ******/
CREATE NONCLUSTERED INDEX [IX_Testkey_KeteranganId] ON [dbo].[Testkey]
(
	[KeteranganId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Testkey_UnitId]    Script Date: 07/09/2022 16:34:15 ******/
CREATE NONCLUSTERED INDEX [IX_Testkey_UnitId] ON [dbo].[Testkey]
(
	[UnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TypeTrans_UnitId]    Script Date: 07/09/2022 16:34:15 ******/
CREATE NONCLUSTERED INDEX [IX_TypeTrans_UnitId] ON [dbo].[TypeTrans]
(
	[UnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Unit_KelompokId]    Script Date: 07/09/2022 16:34:15 ******/
CREATE NONCLUSTERED INDEX [IX_Unit_KelompokId] ON [dbo].[Unit]
(
	[KelompokId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[T_Kliring] ADD  DEFAULT ((0)) FOR [BankId]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUsers]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUsers_Kelompok_KelompokId] FOREIGN KEY([KelompokId])
REFERENCES [dbo].[Kelompok] ([Id])
GO
ALTER TABLE [dbo].[AspNetUsers] CHECK CONSTRAINT [FK_AspNetUsers_Kelompok_KelompokId]
GO
ALTER TABLE [dbo].[AspNetUsers]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUsers_Unit_UnitId] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Unit] ([Id])
GO
ALTER TABLE [dbo].[AspNetUsers] CHECK CONSTRAINT [FK_AspNetUsers_Unit_UnitId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[DataToken]  WITH CHECK ADD  CONSTRAINT [FK_DataToken_Kelompok_KelompokId] FOREIGN KEY([KelompokId])
REFERENCES [dbo].[Kelompok] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DataToken] CHECK CONSTRAINT [FK_DataToken_Kelompok_KelompokId]
GO
ALTER TABLE [dbo].[DataToken]  WITH CHECK ADD  CONSTRAINT [FK_DataToken_Modul_ModulId] FOREIGN KEY([ModulId])
REFERENCES [dbo].[Modul] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DataToken] CHECK CONSTRAINT [FK_DataToken_Modul_ModulId]
GO
ALTER TABLE [dbo].[T_Kliring]  WITH CHECK ADD  CONSTRAINT [FK_T_Kliring_Alasan_AlasanId] FOREIGN KEY([AlasanId])
REFERENCES [dbo].[Alasan] ([Id])
GO
ALTER TABLE [dbo].[T_Kliring] CHECK CONSTRAINT [FK_T_Kliring_Alasan_AlasanId]
GO
ALTER TABLE [dbo].[T_Kliring]  WITH CHECK ADD  CONSTRAINT [FK_T_Kliring_AspNetUsers_AcceptorId] FOREIGN KEY([AcceptorId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[T_Kliring] CHECK CONSTRAINT [FK_T_Kliring_AspNetUsers_AcceptorId]
GO
ALTER TABLE [dbo].[T_Kliring]  WITH CHECK ADD  CONSTRAINT [FK_T_Kliring_AspNetUsers_CreaterId] FOREIGN KEY([CreaterId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[T_Kliring] CHECK CONSTRAINT [FK_T_Kliring_AspNetUsers_CreaterId]
GO
ALTER TABLE [dbo].[T_Kliring]  WITH CHECK ADD  CONSTRAINT [FK_T_Kliring_Bank_BankId] FOREIGN KEY([BankId])
REFERENCES [dbo].[Bank] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[T_Kliring] CHECK CONSTRAINT [FK_T_Kliring_Bank_BankId]
GO
ALTER TABLE [dbo].[T_Kliring]  WITH CHECK ADD  CONSTRAINT [FK_T_Kliring_Cabang_CabangId] FOREIGN KEY([CabangId])
REFERENCES [dbo].[Cabang] ([Id])
GO
ALTER TABLE [dbo].[T_Kliring] CHECK CONSTRAINT [FK_T_Kliring_Cabang_CabangId]
GO
ALTER TABLE [dbo].[T_Kliring]  WITH CHECK ADD  CONSTRAINT [FK_T_Kliring_Keterangan_KeteranganId] FOREIGN KEY([KeteranganId])
REFERENCES [dbo].[Keterangan] ([Id])
GO
ALTER TABLE [dbo].[T_Kliring] CHECK CONSTRAINT [FK_T_Kliring_Keterangan_KeteranganId]
GO
ALTER TABLE [dbo].[T_Kliring]  WITH CHECK ADD  CONSTRAINT [FK_T_Kliring_Status_StatusId] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[T_Kliring] CHECK CONSTRAINT [FK_T_Kliring_Status_StatusId]
GO
ALTER TABLE [dbo].[T_Kliring]  WITH CHECK ADD  CONSTRAINT [FK_T_Kliring_Testkey_TestkeyId] FOREIGN KEY([TestkeyId])
REFERENCES [dbo].[Testkey] ([Id])
GO
ALTER TABLE [dbo].[T_Kliring] CHECK CONSTRAINT [FK_T_Kliring_Testkey_TestkeyId]
GO
ALTER TABLE [dbo].[T_Kliring]  WITH CHECK ADD  CONSTRAINT [FK_T_Kliring_TypeTrans_TypeId] FOREIGN KEY([TypeId])
REFERENCES [dbo].[TypeTrans] ([Id])
GO
ALTER TABLE [dbo].[T_Kliring] CHECK CONSTRAINT [FK_T_Kliring_TypeTrans_TypeId]
GO
ALTER TABLE [dbo].[T_RTGS]  WITH CHECK ADD  CONSTRAINT [FK_T_RTGS_Bank_BankId] FOREIGN KEY([BankId])
REFERENCES [dbo].[Bank] ([Id])
GO
ALTER TABLE [dbo].[T_RTGS] CHECK CONSTRAINT [FK_T_RTGS_Bank_BankId]
GO
ALTER TABLE [dbo].[T_RTGS]  WITH CHECK ADD  CONSTRAINT [FK_T_RTGS_Cabang_CabangId] FOREIGN KEY([CabangId])
REFERENCES [dbo].[Cabang] ([Id])
GO
ALTER TABLE [dbo].[T_RTGS] CHECK CONSTRAINT [FK_T_RTGS_Cabang_CabangId]
GO
ALTER TABLE [dbo].[T_RTGS]  WITH CHECK ADD  CONSTRAINT [FK_T_RTGS_Keterangan_KeteranganId] FOREIGN KEY([KeteranganId])
REFERENCES [dbo].[Keterangan] ([Id])
GO
ALTER TABLE [dbo].[T_RTGS] CHECK CONSTRAINT [FK_T_RTGS_Keterangan_KeteranganId]
GO
ALTER TABLE [dbo].[T_RTGS]  WITH CHECK ADD  CONSTRAINT [FK_T_RTGS_Status_StatusId] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[T_RTGS] CHECK CONSTRAINT [FK_T_RTGS_Status_StatusId]
GO
ALTER TABLE [dbo].[T_RTGS]  WITH CHECK ADD  CONSTRAINT [FK_T_RTGS_Testkey_TestkeyId] FOREIGN KEY([TestkeyId])
REFERENCES [dbo].[Testkey] ([Id])
GO
ALTER TABLE [dbo].[T_RTGS] CHECK CONSTRAINT [FK_T_RTGS_Testkey_TestkeyId]
GO
ALTER TABLE [dbo].[T_RTGS]  WITH CHECK ADD  CONSTRAINT [FK_T_RTGS_TypeTrans_TypeId] FOREIGN KEY([TypeId])
REFERENCES [dbo].[TypeTrans] ([Id])
GO
ALTER TABLE [dbo].[T_RTGS] CHECK CONSTRAINT [FK_T_RTGS_TypeTrans_TypeId]
GO
ALTER TABLE [dbo].[Testkey]  WITH CHECK ADD  CONSTRAINT [FK_Testkey_Keterangan_KeteranganId] FOREIGN KEY([KeteranganId])
REFERENCES [dbo].[Keterangan] ([Id])
GO
ALTER TABLE [dbo].[Testkey] CHECK CONSTRAINT [FK_Testkey_Keterangan_KeteranganId]
GO
ALTER TABLE [dbo].[Testkey]  WITH CHECK ADD  CONSTRAINT [FK_Testkey_Unit_UnitId] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Unit] ([Id])
GO
ALTER TABLE [dbo].[Testkey] CHECK CONSTRAINT [FK_Testkey_Unit_UnitId]
GO
ALTER TABLE [dbo].[TypeTrans]  WITH CHECK ADD  CONSTRAINT [FK_TypeTrans_Unit_UnitId] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Unit] ([Id])
GO
ALTER TABLE [dbo].[TypeTrans] CHECK CONSTRAINT [FK_TypeTrans_Unit_UnitId]
GO
ALTER TABLE [dbo].[Unit]  WITH CHECK ADD  CONSTRAINT [FK_Unit_Kelompok_KelompokId] FOREIGN KEY([KelompokId])
REFERENCES [dbo].[Kelompok] ([Id])
GO
ALTER TABLE [dbo].[Unit] CHECK CONSTRAINT [FK_Unit_Kelompok_KelompokId]
GO
USE [master]
GO
ALTER DATABASE [MonitoringRK] SET  READ_WRITE 
GO
