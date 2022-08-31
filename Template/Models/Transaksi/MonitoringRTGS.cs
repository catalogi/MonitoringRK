using Template.Models.Master;

namespace Template.Models.Transaksi
{
    public class MonitoringRTGS : BaseModel
    {
        public int Id { get; set; }
        public string NomorSurat { get; set; }
        public DateTime TanggalProses { get; set; }
        public string RelTRN { get; set; }
        public string TRN { get; set; }
        public Cabang Cabang { get; set; }
        public int? CabangId { get; set; }
        public Bank Bank { get; set; }
        public int? BankId { get; set; }
        public decimal Nominal { get; set; }
        public DateTime? TanggalDone { get; set; }
        public string? Followup { get; set; }
        public Testkey Testkey { get; set; }
        public int? TestkeyId { get; set; }
        public TypeTrans Type { get; set; }
        public int? TypeId { get; set; }
        public Keterangan Keterangan { get; set; }
        public int? KeteranganId { get; set; }
        public Status Status { get; set; }
        public int? StatusId { get; set; }

    }
}
