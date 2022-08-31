using Template.Data;
using Template.Models.Master;
using Template.ViewModels;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using System.Threading.Tasks;

namespace Template.Controllers.Transaction
{
    public class MasAccountsController : Controller
    {
        private readonly AppDbContext _context;
        private readonly UserManager<User> _userManager;
        private readonly SignInManager<User> _signInManager;

        public MasAccountsController(UserManager<User> userManager, AppDbContext context)
        {
            _userManager = userManager;
            _context = context;
        }
        public IActionResult Index()
        {
            
            return View();
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
                    KelompokId = data.KelompokId,
                    UnitId = data.UnitId,
                    EmailConfirmed = false,
                    PhoneNumberConfirmed = false,
                    TwoFactorEnabled = false,
                    LockoutEnabled = false,
                    AccessFailedCount = 0
                };
                var pwd = "BNI" + data.NPP;
                var result = await _userManager.CreateAsync(user, pwd);
                if (result.Succeeded)
                {
                    //var createdUser = await _userManager.FindByNameAsync(data.NPP);

                    success = true;
                    return Json(success);
                }
            }

            else
            {
                var passwordHaser = new PasswordHasher<User>();
                var pass = "BNI" + data.NPP;
                var UserDb = _context.User.Single(x => x.NPP == data.NPP);
                UserDb.Nama = data.Nama;
                UserDb.NPP = data.NPP;
                UserDb.UserName = data.NPP;
                UserDb.KelompokId = data.KelompokId;
                UserDb.UnitId = data.UnitId;
                UserDb.PasswordHash = passwordHaser.HashPassword(UserDb, pass);
                _context.Entry(UserDb).State = EntityState.Modified;
                await _context.SaveChangesAsync();

                //var result = await _userManager.UpdateAsync(UserDb);
                //if (result.Succeeded)
                //{
                //    var role = _userManager.GetRolesAsync(UserDb);

                //    //remove Role from user
                //    foreach (var item in role.Result)
                //    {
                //        await _userManager.RemoveFromRoleAsync(UserDb, item);
                //    }
                    
                //}          
                success = true;
            }
            return Json(success);
        }


        public JsonResult Delete(string Id)
        {
            var result = false;
            var data = _context.Users.Single(x => x.Id == Id);
            if (data != null)
            {
                _context.Users.Remove(data);
                _context.SaveChanges();
                result = true;
            }
            return Json(result);
        }

        public IActionResult GetList(string? id)
        {
            if (id != null)
            {
                var result = _context.User.Include(x => x.Kelompok)
              .Include(x => x.Unit).Where(x => x.Id == id).SingleOrDefault();
                return Ok(new { data = result });
            }
            else
            {
                var result = _context.User.Include(x => x.Kelompok)
                              .Include(x => x.Unit).ToList();
                return Ok(new { data = result });
            }


        }

        public IActionResult GetById(string id)
        {

            var result = _context.User.Where(x => x.Id == id).FirstOrDefault();
            return Ok(result);
        }
        //public IActionResult Delete(int id)
        //{
        //    var result = 0;
        //    var data = _context.Kartu.Where(x => x.Id == id).FirstOrDefault();
        //    if (data != null)
        //    {
        //        _context.Remove(data);
        //        result = _context.SaveChanges();
        //    }

        //    return Ok(data);
        //}


        #region Get Data
       

        public IActionResult GetUnit(int? Id)
        {
            var result = _context.Unit.Where(x => x.KelompokId == Id).ToList();
            return Ok(new { data = result });
            //if (Id != null)
            //{
            //    var result = _context.KantorCabangUtama.ToList();
            //    return Ok(new { data = result });
            //}
            //else
            //{
            //    var result = _context.KantorCabangUtama.Where(x => x.WilayahId == Id).ToList();
            //    return Ok(new { data = result });
            //}

        }

        public IActionResult GetKelompok(int? id)
        {
            var result = _context.Kelompok.ToList();
            return Ok(new { data = result });
            //if (id !=null)
            //{
            //    var result = _context.Wilayah.Where(x => x.Id ==id).ToList();
            //    return Ok(new { data = result });
            //}
            //else
            //{
            //    var result = _context.Wilayah.ToList();
            //    return Ok(new { data = result });
            //}


        }
        #endregion
    }
}
