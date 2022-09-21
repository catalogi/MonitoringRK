using Ririn.Models.Master;
using System.Text.Json.Serialization;

namespace Ririn.Models.Transaksi
{
    public class T_RTGS : BaseModel
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

        public string? FollowUp { get; set; }
        //public Testkey Testkey { get; set; }
        //public int? TestkeyId { get; set; }
        public DateTime Tanggal { get; set; }
        public string? NomorTestkey { get; set; }
        public TypeTrans Type { get; set; }
        public int TypeId { get; set; }
        public Keterangan Keterangan { get; set; }
        public int? KeteranganId { get; set; }
        public Status Status { get; set; }
        public int? StatusId { get; set; }
        public string? Path { get; set; }
        public int? Durasi { get; set; }
        public User Creater { get; set; }
        public string? CreatorId { get; set; }
        [JsonIgnore]
        public User Acceptor { get; set; }
        public string? AcceptorId { get; set; }


    }
}
