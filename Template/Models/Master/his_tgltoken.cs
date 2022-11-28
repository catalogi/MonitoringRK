using Ririn.Models;
using Ririn.Models.Master;

namespace Ririn.Models.Master
{
    public class his_tgltoken
    {
        public int Id { get; set; }
        public DateTime DateToken{ get; set; }
        public string? Keterangant { get; set; }
        public DataToken datatoken { get; set; }
        public int? datatokenId { get; set; }
        public DateTime CreateDate { get; set; }
        public DateTime? UpdateDate { get; set; }
 
    }
}
