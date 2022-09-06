using Microsoft.AspNetCore.Mvc;

using Ririn.Data;

namespace Ririn.Controllers.Transaksi
{
    public class KliringController : Controller
    {
        private readonly AppDbContext _context;
        public KliringController (AppDbContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult Registrasi()
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
        public IActionResult Reports()
        {
            return View();
        }
        public IActionResult GetAll()
        {
            var result = _context.T_Kliring.ToList();
            return Ok(new { data = result });
        }
        public JsonResult GetTypes()
        {
            var data = _context.TypeTrans.Where(x => x.Type == "Kliring" +
            "").ToList();
            return Json(data);
        }
        public JsonResult GetBank()
        {
            var data = _context.Bank.ToList();
            return Json(data);
        }
        public JsonResult GetAlasan()
        {
            var data = _context.Alasan.ToList();
            return Json(data);
        }

        public JsonResult GetCabang()
        {
            var data = _context.Cabang.ToList();
            return Json(data);
        }
    }
}
