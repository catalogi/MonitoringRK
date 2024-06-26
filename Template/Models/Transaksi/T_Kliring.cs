﻿using Ririn.Models.Master;

namespace Ririn.Models.Transaksi
{
    public class T_Kliring : BaseModel
    {
        public int Id { get; set; }
        public string NomorSurat { get; set; }
        public DateTime TanggalSurat { get; set; }
        public string NoReferensi { get; set; }
        public string NamaPenerima { get; set; }
        public Bank Bank { get; set; }
        public int BankId { get; set; }
        public string NomorRekening { get; set; }
        public decimal Nominal { get; set; }
        public Cabang Cabang { get; set; }
        public int? CabangId { get; set; } 
        public DateTime TanggalTRX { get; set; }
        public DateTime TanggalTestkey { get; set; }
        public string NomorTestkey { get; set; }
        public Keterangan Keterangan { get; set; }
        public int? KeteranganId { get; set; }
        public Alasan Alasan { get; set; }
        public int? AlasanId { get; set; }
        public decimal? NominalSeharusnya { get; set; }
        public TypeTrans Type { get; set; }
        public int? TypeId { get; set; }
        public Status Status { get; set; }
        public int? StatusId { get; set; }
        public int Durasi { get; set; }
        public string? Path { get; set; }
        public DateTime? TanggalDone { get; set; }
        public User Creater { get; set; }
        public string? CreaterId { get; set; }
        public User Acceptor { get; set; }
        public string? AcceptorId { get; set; }
        //public Surat Surat { get; set; }
        //public int? SuratId { get; set; }


    }
}
