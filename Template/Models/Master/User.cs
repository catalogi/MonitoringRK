using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Template.Models.Master
{
    public class User : IdentityUser
    {
        public string? Nama { get; set; }
        public string? NPP { get; set; }
        public virtual Kelompok? Kelompok { get; set; } 
        public int? KelompokId { get; set; }
        public virtual Unit? Unit { get; set; }
        public int? UnitId { get; set; }
        
    }
}
