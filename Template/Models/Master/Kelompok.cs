using System.ComponentModel.DataAnnotations.Schema;

namespace Ririn.Models.Master
{
    [Table("Kelompok")]
    public class Kelompok : BaseModel
    {
        public int Id { get; set; }
        public string Nama { get; set; }
        public string Singkatan { get; set; }
    }

    [Table("Unit")]
    public class Unit : BaseModel
    {
        public int Id { get; set; }
        public string Nama { get; set; }
        public Kelompok Kelompok { get; set; }
        public int? KelompokId { get; set; }

    }
}
