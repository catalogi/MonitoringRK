using Ririn.Models;
using Ririn.Models.Master;
using Ririn.Models.Transaksi;

namespace Ririn.Models.Master
{
    public class trans_surat : BaseModel
    {
        public int Id { get; set; }
        public Surat surat { get; set; }
        public int? suratId { get; set; }
        public T_Kliring kliring { get; set; }
        public int? kliringId { get; set; }
        
    }
}
