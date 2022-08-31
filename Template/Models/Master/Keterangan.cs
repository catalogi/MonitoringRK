using System.ComponentModel.DataAnnotations.Schema;

namespace Template.Models.Master
{
    [Table("Keterangan")]
    public class Keterangan 
    {
        public int Id { get; set; }
        public string Nama { get; set; }
    }

    [Table("Alasan")]

    public class Alasan 
    {
        public int Id { get; set; }
        public string Nama { get; set; }
    }
}