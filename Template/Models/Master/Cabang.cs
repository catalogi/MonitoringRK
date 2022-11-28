
using System.ComponentModel.DataAnnotations.Schema;

namespace Ririn.Models.Master
{
    [Table("Cabang")]
    public class Cabang
    {
        public int Id { get; set; }
        public string Nama { get; set; }
        public string? KodeCabang { get; set; }
        public string? Sandi { get; set; }
        public Type_Dept Type_Dept { get; set; }
        public int? Type_DeptId { get; set; }
        public bool? isDeleted { get; set; }
    }
   
}
