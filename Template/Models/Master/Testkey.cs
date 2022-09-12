namespace Ririn.Models.Master
{
    public class Testkey : BaseModel
    {
        public int Id { get; set; }
        public DateTime Tanggal { get; set; }
        public string NomorTestkey { get; set; }
        public Keterangan Keterangan { get; set; }
        public int? KeteranganId { get; set; }
        public Unit Unit { get; set; }
        public int? UnitId { get; set; }

        internal string Replace(string v1, string v2)
        {
            throw new NotImplementedException();
        }
    }
}
