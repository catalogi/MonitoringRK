namespace Ririn.ViewModels
{
    public class TokenVM
    {
        public int Id { get; set; }
        public int KelompokId { get; set; }
        public int? ModulId {get; set; }
        public string AddModul { get; set; }
        public string NPP { get; set; }
        public string Keterangan { get; set; }
        public string UserId { get; set; }
        public string Nama { get; set; }
        public string Group { get; set; }
        public decimal ApprovalLimit { get; set; }
        public string UserIdToken { get; set; }
        public DateTime TokenExpired { get; set; }

    }



}