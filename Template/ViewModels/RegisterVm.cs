
using System.ComponentModel.DataAnnotations;

namespace Ririn.ViewModels
{
    public class RegisterVM
    {
        public string Id { get; set; }
        public string? Nama { get; set; }
        public string? NPP { get; set; }
        public int KelompokId { get; set; }
        public int UnitId { get; set; }
        //public ICollection<RoleVM> Roles { get; set; }

    }

    //public class RoleVM
    //{
    //    public string RoleName { get; set; }
    //}
    public class LoginVM
    {
        [Required]
        public string NPP { get; set; }
        [Required]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [Display(Name = "Remember Me")]
        public bool RememberMe { get; set; }
    }
}
