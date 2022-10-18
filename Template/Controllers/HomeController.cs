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
using Ririn.ViewModels;

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

        private User GetCurrentUser()
        {
            return _context.User.Where(x => x.NPP == User.Identity!.Name).FirstOrDefault()!;
        }

        
        public IActionResult Index()
        {
            ReminderVM result = new ReminderVM();

            var DurasiKliring = _context.T_Kliring.Where(x => x.StatusId == 1).ToList();
            var hariHK = DurasiKliring.Select(x => x.Durasi).ToList();
            var DurasiRTGS = _context.T_RTGS.Where(x => x.StatusId == 1).ToList();
            var hariHR = DurasiRTGS.Select(x => x.Durasi).ToList();
            var TanggalToken = _context.DataToken.ToList();

            foreach (var harihk in hariHK)
            {
                if(harihk == 5)
                {
                    result.HariHk += 1;
                }else if(harihk > 5)
                {
                    result.Hplus1k +=1;
                }
                else
                {
                    result.HariHk = 0;
                    result.Hplus1k = 0;
                }

                result.MessageHariHk = "Anda Memiliki Data yang belum di proses dalam waktu 5 Hari";
                result.MessageHplus1k = "Anda Memiliki Data yang belum di proses dalam waktu lebih dari 5 Hari";
            }

            foreach (var harihr in hariHR)
            {
                if (harihr == 5)
                {
                    result.HariHr += 1;
                }
                else if (harihr > 5)
                {
                    result.Hplus1r += 1;
                }
                else
                {
                    result.HariHr = 0;
                    result.Hplus1r = 0;
                }

                result.MessageHariHr = "Anda Memiliki Data yang belum di proses dalam waktu 5 Hari";
                result.MessageHplus1r = "Anda Memiliki Data yang belum di proses dalam waktu lebih dari 5 Hari";
            }



            return View(result);

        }

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
            var user = GetCurrentUser();
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
            rtgsMasukCepat = data1.Where(x => x.Durasi <= 5 && x.StatusId == 2 && x.TypeId == 3).Count();
            rtgsMasukLambat = data1.Where(x => x.Durasi > 5 && x.StatusId == 2 && x.TypeId == 3).Count(); 
            rtgsKeluarCepat = data1.Where(x => x.Durasi <= 5 && x.StatusId == 2 && x.TypeId == 4).Count();
            rtgsKeluarLambat = data1.Where(x => x.Durasi > 5 && x.StatusId == 2 && x.TypeId == 4).Count();
            //var type = _context.

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

        public IActionResult Reminder()
        {
            return Ok();
        }
    }
}