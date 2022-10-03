using System.ComponentModel.DataAnnotations.Schema;

namespace Ririn.Models.Master
{
    [Table("Surat")]
    public class Surat
    {
        public int Id { get; set; }
        public string? TujuanSurat { get; set; }
        public string? AsalSurat { get; set; }

        public string? perihal { get; set; }

        public int? lampiran { get; set; }
        public string? nomorSurat { get; set; }
        public JenisSurat JenisSurat { get; set; }
        public int? JenisSuratId { get; set; }
    }

    [Table("JenisSurat")]
    public class JenisSurat
    {
        public int Id { get; set; }
        public string Nama { get; set; }
        public TypeTrans Type { get; set; }
        public int? TypeId { get; set; }
    }
}
