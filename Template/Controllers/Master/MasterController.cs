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
        public IActionResult Alasan()
        {
            return View();
        }
        public IActionResult Keterangan()
        {
            return View();
        }

        public JsonResult GetAllKelompok()
        {
            var result = _context.Kelompok.ToList();
            return Json(new { data = result});
        }
        public JsonResult GetModul()
        {
            var result = _context.Modul.ToList();
            return Json(new { data = result });
        }
        public JsonResult GetAllUnit()
        {
            var result = _context.Unit.ToList();
            return Json(new { data = result });
        }

        public JsonResult GetUnitBy(int? Id)
        {
            var result = _context.Unit.Include(x => x.Kelompok).Where(x => x.KelompokId == Id);
            return Json(new { data = result });
        }

        public JsonResult GetType()
        {
            var result = _context.TypeTrans
                .Include(x => x.Unit).ToList();
            return Json(new { data = result });
        }
        public JsonResult GetCabang()
        {
            var result = _context.Cabang.ToList();
            return Json(new { data = result });
        }
        public JsonResult GetAlasan()
        {
            var result = _context.Alasan.ToList();
            return Json(new { data = result });
        }
        public JsonResult Keterangan1
        {
            get
            {
                var result = _context.Keterangan.ToList();
                return Json(new { data = result });
            }
        }

        public JsonResult GetBank()
        {
            var result = _context.Bank.ToList();
            return Json(new { data = result });
        }
        public JsonResult GetKeterangan()
        {
            var result = _context.Keterangan.ToList();
            return Json(new { data = result });
        }
        public JsonResult DeleteAlasan(int Id)
        {
            bool result = false;
            var data = _context.Alasan.Single(x => x.Id == Id);
            if (data != null)
            {
                //data.IsDelete = true;
                _context.Alasan.Remove(data);
                _context.SaveChanges();

            }
            return Json(result);
        }
        public JsonResult DeleteAllAlasan(List<int> Id)
        {
            bool result = false;
            foreach (var item in Id)
            {
                Alasan alasan = _context.Alasan.Single(x => x.Id == item);
                if (alasan != null)
                {
                    //keterangan.IsDeleted = true;
                    _context.Alasan.Remove(alasan);
                    _context.SaveChanges();
                    result = true;
                }
            }


            return Json(result);
        }
        public JsonResult DeleteKeterangan(int Id)
        {
            bool result = false;
            var data = _context.Keterangan.Single(x => x.Id == Id);
            if (data != null)
            {
                //data.IsDelete = true;
                _context.Keterangan.Remove(data);
                _context.SaveChanges();

            }
            return Json(result);
        }
        public JsonResult DeleteAllKeterangan(List<int> Id)
        {
            bool result = false;
            foreach (var item in Id)
            {
                Keterangan keterangan = _context.Keterangan.Single(x => x.Id == item);
                if (keterangan != null)
                {
                    //keterangan.IsDeleted = true;
                    _context.Keterangan.Remove(keterangan);
                    _context.SaveChanges();
                    result = true;
                }
            }


            return Json(result);
        }
    }



}
