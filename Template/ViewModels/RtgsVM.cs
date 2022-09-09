using Ririn.ViewModels;

namespace ASK_Core.ViewModels
{
    public class RtgsVM
    {
        public int Id { get; set; }
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
        public List<TestKeyVM> testKeys { get; set; }

    }
}
