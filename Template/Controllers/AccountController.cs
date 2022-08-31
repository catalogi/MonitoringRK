using Template.Data;
using Template.Models.Master;
//using Template.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Template.ViewModels;

namespace Template.Controllers
{
    public class AccountController : Controller
    {
        private readonly SignInManager<User> _signInManager;
        private readonly UserManager<User> _userManager;
        private readonly AppDbContext _context;
        private readonly RoleManager<IdentityRole> _roleManager;

        public AccountController(SignInManager<User> signInManager,
            UserManager<User> userManager, AppDbContext context,
            RoleManager<IdentityRole> roleManager)
        {
            _signInManager = signInManager;
            _userManager = userManager;
            _roleManager = _roleManager;
            _context = context;
        }

        public void addUsers(){

            //insert KCP
            #region 
            //int index = 0;
            //var data = _context.KantorCabangPembantu.Where(x=>x.KantorCabangUtama.WilayahId == 1).ToList();

            //foreach(var item in data){
            //    string npp = "10";
            //    if(index.ToString().Length == 1){
            //         npp += "000" + index;
            //    }
            //    else if(index.ToString().Length == 2){
            //         npp += "00" + index;
            //    }
            //    else if(index.ToString().Length == 3){
            //         npp += "0" + index;
            //    }
            //    else{
            //        npp += index;
            //    }

            //    var kcu = _context.KantorCabangUtama.Where(x=>x.Id == item.KantorCabangUtamaId).FirstOrDefault();
            //    var wil = _context.Wilayah.Where(x=>x.Id == kcu!.WilayahId).FirstOrDefault();

            //    User user = new User{
            //        Nama = "KCP " + item.Nama,
            //        NPP = npp,
            //        UserName = npp,
            //        JabatanId = 1,
            //        KantorCabangPembantuId = item.Id,
            //        KantorCabangUtamaId = kcu!.Id,
            //        WilayahId = wil!.Id
            //    };
            //    var pwd = "BNI"+npp;
            //    _userManager.CreateAsync(user, pwd).Wait();
            //    index++;
            //}
            #endregion

            //insert KCU
            #region 
            //int index = 0;
            //var data = _context.KantorCabangUtama.ToList();

            //foreach (var item in data)
            //{
            //    string npp = "20";
            //    if (index.ToString().Length == 1)
            //    {
            //        npp += "000" + index;
            //    }
            //    else if (index.ToString().Length == 2)
            //    {
            //        npp += "00" + index;
            //    }
            //    else if (index.ToString().Length == 3)
            //    {
            //        npp += "0" + index;
            //    }
            //    else
            //    {
            //        npp += index;
            //    }

            //    var wil = _context.Wilayah.Where(x => x.Id == item.WilayahId).FirstOrDefault();
            //    //var wil = _context.Wilayah.Where(x => x.Id == kcu!.WilayahId).FirstOrDefault();

            //    User user = new User
            //    {
            //        Nama = "KCU " + item.Nama,
            //        NPP = npp,
            //        UserName = npp,
            //        JabatanId = 1,
            //        //KantorCabangPembantuId = item.Id,
            //        KantorCabangUtamaId = item.Id,
            //        WilayahId = wil!.Id
            //    };
            //    var pwd = "BNI" + npp;
            //    _userManager.CreateAsync(user, pwd).Wait();
            //    index++;
            //}
            #endregion

            //insert Wilayah
            #region 
            //int index = 0;
            //var data = _context.Wilayah.ToList();

            //foreach (var item in data)
            //{
            //    string npp = "30";
            //    if (index.ToString().Length == 1)
            //    {
            //        npp += "000" + index;
            //    }
            //    else if (index.ToString().Length == 2)
            //    {
            //        npp += "00" + index;
            //    }
            //    else if (index.ToString().Length == 3)
            //    {
            //        npp += "0" + index;
            //    }
            //    else
            //    {
            //        npp += index;
            //    }

            //    //var wil = _context.Wilayah.Where(x => x.Id == item.WilayahId).FirstOrDefault();
            //    //var wil = _context.Wilayah.Where(x => x.Id == kcu!.WilayahId).FirstOrDefault();

            //    User user = new User
            //    {
            //        Nama = item.Nama,
            //        NPP = npp,
            //        UserName = npp,
            //        JabatanId = 1,
            //        //KantorCabangPembantuId = item.Id,
            //        //KantorCabangUtamaId = item.Id,
            //       WilayahId = item.Id
            //    };
            //    var pwd = "BNI" + npp;
            //    _userManager.CreateAsync(user, pwd).Wait();
            //    index++;
            //}
            #endregion

            //insert OPR
            #region 

            User user = new User
            {
                Nama = "Admin",
                NPP = "80001",
                UserName = "80001",
                KelompokId = null,
                UnitId = null

            };
            var pwd = "BNI" + "80001";
            _userManager.CreateAsync(user, pwd).Wait();

            #endregion
        }

        public void addNewRole(){
            List<string> roleName = new List<string>{
                "Admin", "Inputer", "Penyelia", "Pengelola","Pimkel"
            };
            foreach(var item in roleName){
                var role = new IdentityRole();
                role.Name = item;
                role.NormalizedName = item;
                _context.Roles.Add(role);
                _context.SaveChanges();
            }
        }

        [HttpGet]
        [AllowAnonymous]
        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [AllowAnonymous]
        public async Task<IActionResult> Login(LoginVM user)
        {
            if (ModelState.IsValid)
            {
                //var userData = _context.User.SingleOrDefault(x => x.NPP == user.NPP);
                var result = await _signInManager.PasswordSignInAsync(user.NPP, user.Password, user.RememberMe, false);
                if (result.Succeeded!)
                {
                    return RedirectToAction("Index", "Home");
                }
                ModelState.AddModelError(string.Empty, "Invalid Login Attempt");

            }
            return View(user);
        }

        public async Task<IActionResult> Logout()
        {
            await _signInManager.SignOutAsync();
            return RedirectToAction("Login", "Account");
        }


    }
}
