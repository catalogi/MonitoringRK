namespace Ririn.ViewModels
{
    public class TranshVM
    {
        public int? Id { get; set; }
        public string NomorSurat { get; set; }
        public DateTime TanggalSurat { get; set; }
        public string NoReferensi { get; set; }
        public string NamaPenerima { get; set; }
        public int BankId { get; set; }
        public string NomorRekening { get; set; }
        public decimal Nominal { get; set; }
        public int CabangId { get; set; }
        public DateTime TanggalTRX { get; set; }
        public int? TestKeyId { get; set; }
        public int? KeternaganId { get; set; }
        public int? AlasanId { get; set; }
        public decimal? NominalSeharusnya { get; set; }
        public int TypeId { get; set; }
        public int Status { get; set; }
        public int Durasi { get; set; }
        public string? path { get; set; }
    }
}
