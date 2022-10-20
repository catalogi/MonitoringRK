using System.ComponentModel.DataAnnotations.Schema;

namespace Ririn.Models.Master
{
    [Table("Surat")]
    public class Surat
    {
        public int Id { get; set; }
        public string? TujuanSurat { get; set; }
        public string? AsalSurat { get; set; }

        public string? Perihal { get; set; }

        public string? Lampiran { get; set; }
        public string? Sor { get; set; }
        public string? NomorSurat { get; set; }
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
