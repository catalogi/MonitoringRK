namespace Ririn.Models.Master
{
    public class Bank 
    {
        public int Id { get; set; }

        public string Nama { get; set; }
        public string KodeBIC { get; set; }
        public string KodeKliring { get; set; }

        public bool? IsDeleted { get; set; }
    }
}
