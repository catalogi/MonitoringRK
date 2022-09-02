using Ririn.Data;
using Ririn.Models.Master;
//using Ririn.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Ririn.ViewModels;

namespace Ririn.Controllers
{
    public class AccountController : Controller
    {
        private readonly SignInManager<User> _signInManager;
        private readonly UserManager<User> _userManager;
        private readonly AppDbContext _context;
        //private readonly RoleManager<IdentityRole> _roleManager;

        public AccountController(SignInManager<User> signInManager,
            UserManager<User> userManager, AppDbContext context,
            /*RoleManager<IdentityRole> roleManager*/)
        {
            _signInManager = signInManager;
            _userManager = userManager;
            //_roleManager = _roleManager;
            _context = context;
        }

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
                var UserDb = _context.User.Single(x=>x.NPP == data.NPP);
                UserDb.Nama = data.Nama;
                UserDb.NPP = data.NPP;
                UserDb.KelompokId = data.KelompokId;
                UserDb.UnitId = data.UnitId;

                var result = await _userManager.UpdateAsync(UserDb);
                if (result.Succeeded)
                {
                    var role = _userManager.GetRolesAsync(UserDb);

                    //Remove Role From USer
                    foreach(var item in role.Result)
                    {
                        await _userManager.RemoveFromRoleAsync(UserDb, item);
                    }

                    //Add Role to User
                    foreach(var item in data.Roles)
                    {
                        var userResult = await _userManager.AddToRoleAsync(UserDb, item.RoleName);
                    }
                }
                    success = true;
            }

            return Json(success);
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
