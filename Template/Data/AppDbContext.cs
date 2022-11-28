﻿
using Ririn.Models.Master;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Ririn.Models.Transaksi;


namespace Ririn.Data
{
    public class AppDbContext : IdentityDbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options)
            : base(options)
        {
        }

        #region Master 
        public DbSet<Bank> Bank { get; set; }
        public DbSet<Cabang> Cabang { get; set; }
        public DbSet<Type_Dept> Type_Dept { get; set; }
        public DbSet<Kelompok> Kelompok { get; set; }
        public DbSet<Unit> Unit { get; set; }
        public DbSet<Keterangan> Keterangan { get; set; }
        public DbSet<Alasan> Alasan { get; set; }
        public DbSet<trans_surat> Trans_Surat { get; set; }
        public DbSet<Status> Status { get; set; }
        public DbSet<User> User { get; set; }
        public DbSet<TypeTrans> TypeTrans { get; set; }
        public DbSet<Modul> Modul { get; set; }
        public DbSet<Libur> Libur { get; set; }
        public DbSet<DataToken> DataToken { get; set; }
        public DbSet<his_tgltoken> his_tgltoken { get; set; }
        public DbSet<Surat> Surat { get; set; }
        public DbSet<JenisSurat> JenisSurat { get; set; }
     
        #endregion

        #region Transaksi
        public DbSet<T_Kliring> T_Kliring {get; set; }
        public DbSet<T_RTGS> T_RTGS { get; set; }
        #endregion
    }
}