namespace Ririn.ViewModels
{
    public class BankVM
    {
        public int? Id { get; set; }
        public string  Nama { get; set; }
        public string KodeBIC { get; set; }
        public string KodeKliring { get; set; }
    }
     public class CabangVM
    {
         public int? Id { get; set; }
        public string Nama { get; set; }
        public string? KodeCabang { get; set; }
        public string? Sandi { get; set; }
    }
}
