using Microsoft.AspNetCore.Mvc;

using Ririn.Data;
using Ririn.Models.Master;
using Ririn.Models.Transaksi;

namespace Ririn.Controllers.Transaksi
{
    public class RTGSController : Controller
    {
        private readonly AppDbContext _context;
        public RTGSController(AppDbContext context)
        {
            _context = context;
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

        public IActionResult GetAll()
        {
            var result = _context.T_RTGS
                .Include(x => x.Bank)
                .Include(x=>x.Cabang)
                .Include(x=>x.Keterangan)
                .Include(x=>x.Testkey)
                .ToList();
            return Ok(new { data = result });
        }
        public JsonResult GetType()
        {
            var result = _context.TypeTrans
                .Include(x => x.Unit).Where(x => x.UnitId == 2).ToList();
            return Json(new { data = result });
        }

        public IActionResult Save(T_RTGS rtgs)
        {
            if (rtgs.Id == 0)
            {
                rtgs.IsDeleted = false;
                _context.T_RTGS.Add(rtgs);
            }
            else
            {
                var data = _context.T_RTGS.Where(x => x.Id == rtgs.Id).FirstOrDefault();
                data.NomorSurat = rtgs.NomorSurat;
                data.TanggalProses= rtgs.TanggalProses;
                data.RelTRN = rtgs.RelTRN;
                data.TRN = rtgs.TRN;
                data.Cabang = rtgs.Cabang;
                data.Bank = rtgs.Bank;
                data.Nominal = rtgs.Nominal;
                data.TanggalDone = rtgs.TanggalDone;
                data.Testkey = rtgs.Testkey;
                data.Type = rtgs.Type;
                data.Keterangan = rtgs.Keterangan;
                data.Status = rtgs.Status;
            }
            _context.SaveChanges();

            return Json(rtgs);
        }
    }
}
