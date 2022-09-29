using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Ririn.Data;
using Ririn.Models.Master;

namespace Ririn.Controllers.Master
{
    [Authorize]
    public class LiburController : Controller
    {

        private readonly AppDbContext _context;
        public LiburController(AppDbContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            return View();
        }
        public JsonResult Get()
        {
            var result = _context.Libur.ToList();
            return Json(new { data = result });
        }
        public JsonResult GetById(int Id)
        {
            var data = _context.Libur.Single(x => x.Id == Id);
            return Json(new { data = data });
        }
        public JsonResult Save(Libur libur)
        {
            if (libur.Id == 0)
            {
              
                _context.Libur.Add(libur);
            }
            else
            {
                var data = _context.Libur.Where(x => x.Id == libur.Id).FirstOrDefault();
                data.Hari = libur.Hari;
                data.TanggalLibur = libur.TanggalLibur;
                data.Keterangan = libur.Keterangan;
                
                _context.Entry(data).State = EntityState.Modified;


            }
            _context.SaveChanges();

            return Json(libur);
        }
        public JsonResult Delete(int Id)
        {
            bool result = false;
            Libur libur = _context.Libur.Single(x => x.Id == Id);
            if (libur != null)
            {
                
                _context.Libur.Remove(libur);
                _context.SaveChanges();
                result = true;
            }
            return Json(result);
        }
        public JsonResult DeleteAll(List<int> Id)
        {
            bool result = false;
            foreach (var item in Id)
            {
                Libur libur = _context.Libur.Single(x => x.Id == item);
                if (libur != null)
                {
                   
                    _context.Libur.Remove(libur);
                    _context.SaveChanges();
                    result = true;
                }
            }
            
            
            return Json(result);
        }
    }
}
