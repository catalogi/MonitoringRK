namespace Ririn.Models
{
    public class BaseModel
    {
        public DateTime? CreateDate { get; set; }
        public DateTime? UpdateDate { get; set; }
        public bool? IsDeleted { get; set; }

        public BaseModel()
        {
            this.CreateDate = DateTime.UtcNow;
            this.IsDeleted = false;
        }
    }
   

}
