using System.ComponentModel.DataAnnotations.Schema;

namespace Ririn.Models.Master
{
    [Table("DataToken")]
    public class DataToken : BaseModel
    {
        public int Id { get; set; }
        public Kelompok Kelompok { get; set; }
        public int KelompokId { get; set; }
        public Modul Modul { get; set; }
        public int? ModulId { get; set; }
        public string? NPP { get; set; }
        public string? UserId { get; set; }
        public string? Nama { get; set; }
        public string? Group { get; set; }
        public decimal? ApprovalLimit { get; set; }
        public string UserIdToken { get; set; }
        public string? Keterangan { get; set; }
       

    }

    [Table("Modul")]
    public class Modul
    {
        public int Id { get; set; }
        public string Nama { get; set; }
        bool? IsDeleted { get; set; }
    }
}
