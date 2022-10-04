using Ririn.Models;
//using Ririn.ViewModels;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using Ririn.Data;
using Microsoft.AspNetCore.Authorization;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Identity;
using Ririn.Models.Master;
using Microsoft.Data.SqlClient;
using Dapper;

namespace Ririn.Controllers
{
    [Authorize]
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly UserManager<User> _userManager;
        private readonly AppDbContext _context;
        //private readonly SqlConnection _con;
        private readonly IConfiguration _configuration;

        public HomeController(ILogger<HomeController> logger,
            AppDbContext context, UserManager<User> userManager,
            IConfiguration configuration)
        {
            _context = context;
            _logger = logger;
            _userManager = userManager;
            _configuration = configuration;
            //_con = new SqlConnection(configuration.GetConnectionString("ASKAldi"));
        }

        #region RoleUser
        public IActionResult Index()
        {
            return View();

        }
        #endregion
        //private User GetCurrentUser()
        //{
        //    return _context.User.Where(x => x.NPP == User.Identity!.Name).FirstOrDefault()!;
        //}


        //    public IActionResult DashKcu(int? Id)
        //{
        //    var cuser = GetCurrentUser();
        //    if(Id != null){
        //        return View(Id);
        //    }
        //    else{
        //        return View(cuser.LayananId);
        //    }

        //}
        //public IActionResult Reports()
        //{
        //    return View();
        //}

        //public IActionResult DashWilayah(int? Id)
        //{
        //    var cuser = GetCurrentUser();
        //    if(Id != null){
        //        return View(Id);
        //    }
        //    else{
        //        return View(cuser.KelompokId);
        //    }
        //}
        //public IActionResult DashKcp()
        //{
        //    return View();
        //}

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
        public IActionResult Donat()
        {
            int kliringMasukCepat = 0;
            int kliringMasukLambat = 0;
            int kliringKeluarCepat = 0;
            int kliringKeluarLambat = 0;
            int rtgsMasukCepat = 0;
            int rtgsMasukLambat = 0;
            int rtgsKeluarCepat = 0;
            int rtgsKeluarLambat = 0;

            var data = _context.T_Kliring.ToList();
            kliringMasukCepat = data.Where(x => x.Durasi <= 5 && x.StatusId == 2 && x.TypeId == 1).Count();
            kliringMasukLambat = data.Where(x => x.Durasi > 5 && x.StatusId == 2 && x.TypeId == 1).Count();
            kliringKeluarCepat = data.Where(x => x.Durasi <= 5 && x.StatusId == 2 && x.TypeId == 2).Count();
            kliringKeluarLambat = data.Where(x => x.Durasi > 5 && x.StatusId == 2 && x.TypeId == 2).Count();
            var data1 = _context.T_RTGS.ToList();
            rtgsMasukCepat = data1.Where(x => x.Durasi <= 5 && x.StatusId == 2).Count();
            rtgsMasukLambat = data1.Where(x => x.Durasi > 5 && x.StatusId == 2).Count();

            dynamic result = new
            {
                KliringMasukCepat = kliringMasukCepat,
                KliringMasukLambat = kliringMasukLambat,
                KliringKeluarCepat = kliringKeluarCepat,
                KliringKeluarLambat = kliringKeluarLambat,
                RtgsMasukCepat = rtgsMasukCepat,
                RtgsMasukLambat = rtgsMasukLambat,
                RtgsKeluarCepat = rtgsKeluarCepat,
                RtgsKeluarLambat = rtgsKeluarLambat

            };

            return Ok(result);
        }
    }
}