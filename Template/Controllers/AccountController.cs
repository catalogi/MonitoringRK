using Ririn.Data;
using Ririn.Models.Master;
//using Ririn.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Ririn.ViewModels;
using Microsoft.EntityFrameworkCore;

namespace Ririn.Controllers
{
    [Authorize]
    public class AccountController : Controller
    {
        private readonly SignInManager<User> _signInManager;
        private readonly UserManager<User> _userManager;
        private readonly AppDbContext _context;
        private readonly IWebHostEnvironment _webHostEnvironment;
        //private readonly RoleManager<IdentityRole> _roleManager;

        public AccountController(SignInManager<User> signInManager,
            UserManager<User> userManager, AppDbContext context, IWebHostEnvironment webHostEnvironment
            /*RoleManager<IdentityRole> roleManager*/)
        {
            _webHostEnvironment = webHostEnvironment;
            _signInManager = signInManager;
            _userManager = userManager;
            
            _context = context;
            
        }

        public IActionResult Index()
        {
            return View();
        }
        //public IActionResult Login()
        //{
        //    return View();
        //}

        public async Task<JsonResult> Save(RegisterVM data)
        {
            var success = false;

            if (data.Id == null)
            {
                var user = new User
                {
                    Nama = data.Nama,
                    NPP = data.NPP,
                    UserName = data.NPP,
                    UnitId = data.UnitId,
                    KelompokId = data.KelompokId,
                    EmailConfirmed = false,
                    PhoneNumberConfirmed = false,
                    TwoFactorEnabled = false,
                    LockoutEnabled = false,
                    AccessFailedCount = 0,
                };
                var pwd = "BNI" + data.NPP;
                var result = await _userManager.CreateAsync(user, pwd);
                if (result.Succeeded)
                {
                    var createdUser = await _userManager.FindByNameAsync(data.NPP);

                    success = true;
                    foreach (var item in data.Roles)
                    {
                        var userResult = await _userManager.AddToRoleAsync(createdUser, item.RoleName);
                    }
                    return Json(success);
                }
            }
            else
            {
                var UserDb = _context.User.Single(x => x.Id == data.Id);
                UserDb.Nama = data.Nama;
                UserDb.NPP = data.NPP;
                UserDb.KelompokId = data.KelompokId;
                UserDb.UnitId = data.UnitId;

                var result = await _userManager.UpdateAsync(UserDb);
                if (result.Succeeded)
                {
                    var role = _userManager.GetRolesAsync(UserDb);

                    //Remove Role From User
                    foreach (var item in role.Result)
                    {
                        await _userManager.RemoveFromRoleAsync(UserDb, item);
                    }

                    //Add Role to User
                    foreach (var item in data.Roles)
                    {
                        var userResult = await _userManager.AddToRoleAsync(UserDb, item.RoleName);
                    }

                }
                success = true;
            }
            return Json(success);
        }

        public JsonResult Delete(string Id)
        {
            var result = 0;
            var data = _context.User.Where(x => x.Id == Id).FirstOrDefault();
            if (data != null)
            {
                _context.User.Remove(data);
                result = _context.SaveChanges();

            }
            return Json(result);
        }


        #region Get Data

        public JsonResult GetList(string? Id)
        {
            if (Id != null)
            {
                var result = _context.User.Include(x => x.Kelompok).Include(x => x.Unit).Where(x => x.Id == Id).SingleOrDefault();
                return Json(new { data = result });
            }
            else
            {
                var result = _context.User.Include(x => x.Kelompok).Include(x => x.Unit).ToList();
                return Json(new { data = result });
            }
        }

        public JsonResult GetById(string? id)
        {
            var result = _context.User.Where(x => x.Id == id).FirstOrDefault();
            return Json(new { data = result });
        }


        public IActionResult GetRoles(string? Id)
        {
            if (Id != null)
            {
                var result = _context.Roles.Where(x => x.Id == Id).SingleOrDefault();
                return Ok(new { data = result });
            }
            else
            {
                var result = _context.Roles.ToList();
                return Ok(new { data = result });
            }
        }

        #endregion
        [Authorize(Roles = "Admin")]
        public void addNewRole()
        {
            List<string> roleName = new List<string>() {
            "Admin","Kliring","RTGS","Helpdesk"
            };
            foreach (var item in roleName)
            {
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
            return View("Login", user);
        }

        public async Task<IActionResult> Logout()
        {
            await _signInManager.SignOutAsync();
            return RedirectToAction("Login", "Account");
        }


    }
}
