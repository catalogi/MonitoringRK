using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Ririn.Data;
using Ririn.Models.Master;

using Ririn.ViewModels;

using Ririn.Models.Transaksi;


namespace Ririn.Controllers.Transaksi
{
    public class RTGSController : Controller
    {
        private readonly AppDbContext _context;
        private readonly IWebHostEnvironment _host;
        public RTGSController(AppDbContext context, IWebHostEnvironment host) 
        {
            _context = context;
            _host = host;
        }

        public IActionResult Index()
        {
            return View();
        }
        public IActionResult Register()
        {
            return View();
        } 
        public IActionResult Proses()
        {
            return View();
        }
        public IActionResult Monitoring()
        {
            return View();
        }
        public IActionResult Report()
        {
            return View();
        }

        #region Get Data
        public IActionResult GetAll()
        {
            var result = _context.T_RTGS
                .Include(x => x.Bank)
                .Include(x => x.Cabang)
                .Include(x => x.Keterangan)
                .ToList();
            return Ok(new { data = result });
        }
        public JsonResult GetType()
        {
            var result = _context.TypeTrans
                .Include(x => x.Unit).Where(x => x.UnitId == 2).ToList();
            return Json(new { data = result });
        }

        #endregion

        public IActionResult Save(KliringVM data)
        {
            var success = false;
            if (data == null)
            {
                
                success = true;
            }
            return Ok(success);
        }
    }
}
