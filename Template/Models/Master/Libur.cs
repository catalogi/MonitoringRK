namespace Ririn.Models.Master
{
    public class Libur
    {
        public int Id { get; set; }
        public string? Hari {get; set;} 
        public DateTime TanggalLibur { get; set; }
        public string? Keterangan { get; set; }
    }
}
