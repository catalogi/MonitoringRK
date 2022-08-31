using System.ComponentModel.DataAnnotations.Schema;

namespace Template.Models.Master
{
    [Table("Status")]
    public class Status
    {
        public int Id { get; set; }
        public string Nama { get; set; }
        public string Warna { get; set; }
        
    }

    
}
