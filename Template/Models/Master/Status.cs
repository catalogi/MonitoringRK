using System.ComponentModel.DataAnnotations.Schema;

namespace Ririn.Models.Master
{
    [Table("Status")]
    public class Status
    {
        public int Id { get; set; }
        public string Nama { get; set; }
        public string Warna { get; set; }
        
    }

    
}
