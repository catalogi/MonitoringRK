namespace Template.Models
{
    public class BaseModel
    {
        public DateTime? Createdate { get; set; }
        public DateTime? Updatedate { get; set; }
        public DateTime? Deletedate { get; set; }
        public bool? IsDeleted { get; set; }
    }
}
