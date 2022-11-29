﻿using Ririn.ViewModels;

namespace Ririn.ViewModels
{
    public class RtgsVM
    {
        public int? Id { get; set; }
        public string NomorSurat { get; set; }
        public DateTime TanggalProses { get; set; }
        public string RelTRN { get; set; }
        public string TRN { get; set; }
        public int? CabangId { get; set; }
        public int BankId { get; set; }
        public decimal Nominal { get; set; }
        public DateTime? TanggalDone { get; set; }
        public string? FollowUp { get; set; }
        public string? Bor { get; set; }
        public int TypeId { get; set; }
        public int? KeteranganId { get; set; }
        public string? AlasanLain { get; set; }
        public string? CabangLain { get; set; }
        public string? KodeCabang { get; set; }
        public string? Sandi { get; set; }
        public int? Type_DeptId { get; set; }
        public int StatusId { get; set; }
        public string NomorTestkey { get; set; }
        public string? Path { get; set; }

        public string CreatorId { get; set; }
        public string AcceptorId { get; set; }
        //public List<TestKeyVM> testKeys { get; set; }

    }
}
