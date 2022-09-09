﻿

using Ririn.Models.Master;
using System.Net.Mail;

namespace Ririn.ViewModels
{
    public class TranshVM
    {
        public int? Id { get; set; }
        public string NomorTestKey { get; set; }
        public DateTime TanggalTestkey { get; set; }
        public int KeteranganId { get; set; }
        public int UnitId { get; set; }
        public List<KliringVM> klirings { get; set; }
        public List<RtgsVM> Rtgss { get; set; }
    }
    public class KliringVM
    {
        //public int? Id { get; set; }
        public string NomorSurat { get; set; }
        public DateTime TanggalSurat { get; set; }
        public string NoReferensi { get; set; }
        public string NamaPenerima { get; set; }
        public int BankId { get; set; }
        public string NomorRekening { get; set; }
        public decimal Nominal { get; set; }
        public int CabangId { get; set; }
        public DateTime TanggalTRX { get; set; }
        public int? KeteranganId { get; set; }
        public int? AlasanId { get; set; }
        public decimal? NominalSeharusnya { get; set; }
        public int TypeId { get; set; }
        public int StatusId { get; set; }
        public int Durasi { get; set; }
        public Attachment Path { get; set; }
        public DateTime? TanggalDone { get; set; }
        public string? CreaterId { get; set; }
        public string? AcceptorId { get; set; }
    }

    public class RtgsVM
    {
        public string NomorSurat { get; set; }
        public DateTime TanggalProses { get; set; }
        public string RelRTN { get; set; }
        public string RTN { get; set; }
        public int CabangId { get; set; }
        public int BankId { get; set; }
        public decimal Nominal { get; set; }
        public DateTime? TanggalDone { get; set; }
        public string? FollowUp { get; set; }
        public int TypeId { get; set; }
        public int KeteranganId { get; set; }
        public int StatusId { get; set; }
        public Attachment Patch { get; set; }

        public string CreatorId { get; set; }
        public string AcceptorId { get; set; }


    }

    public class Attachment
    {
        public string Base64 { get; set; }
        public string FileName { get; set; }
    }
}
