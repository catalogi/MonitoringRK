using Template.Models.Master;

using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Template.Models.Transaksi;

namespace Template.Data
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
        public DbSet<Kelompok> Kelompok { get; set; }
        public DbSet<Unit> Unit { get; set; }
        public DbSet<Keterangan> Keterangan { get; set; }
        public DbSet<Alasan> Alasan { get; set; }
        public DbSet<Testkey> Testkey { get; set; }
        public DbSet<Status> Status { get; set; }
        public DbSet<User> User { get; set; }
        public DbSet<TypeTrans> TypeTrans { get; set; }
        #endregion

        #region Transaksi
        public DbSet<MonitoringRK> MonitoringRK {get; set; }
        public DbSet<MonitoringRTGS> MonitoringRTGS { get; set; }
        #endregion
    }
}