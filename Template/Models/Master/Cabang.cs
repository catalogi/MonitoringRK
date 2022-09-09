namespace Ririn.Models.Master
{
    public class Cabang
    {
        public int Id { get; set; }
        public string Nama { get; set; }
        public string? KodeCabang { get; set; }
        public string? Sandi { get; set; }
        public bool? isDeleted { get; set; }
    }
}
