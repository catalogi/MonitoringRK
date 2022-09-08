using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Ririn.Data;
using Ririn.Models.Master;

namespace Ririn.Controllers.Master
{
    public class MasterController : Controller
    {
        private readonly AppDbContext _context;

        public MasterController(AppDbContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            return View();
        }

        public JsonResult GetAllKelompok()
        {
            var result = _context.Kelompok.ToList();
            return Json(new { data = result });
        }
        public JsonResult GetAllUnit()
        {
            var result = _context.Unit.ToList();
            return Json(result);
        }

        public JsonResult GetUnitBy(int? Id)
        {
            var result = _context.Unit.Include(x => x.Kelompok).Where(x => x.KelompokId == Id);
            return Json(result);
        }

        public JsonResult GetType()
        {
            var result = _context.TypeTrans
                .Include(x => x.Unit).Where(x => x.UnitId == 1).ToList();
            return Json(new { data = result });
        }
        public JsonResult GetCabang()
        {
            var result = _context.Cabang.ToList();
            return Json(new { data = result });
        }
        public JsonResult GetBank()
        {
            var result = _context.Bank.ToList();
            return Json(new { data = result });
        }
        public JsonResult GetAlasan()
        {
            var result = _context.Alasan.ToList();
            return Json(new { data = result });
        }
    }



}
