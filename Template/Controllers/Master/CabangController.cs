using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Ririn.Data;
using Ririn.Models.Master;

namespace Ririn.Controllers.Master
{
    public class CabangController : Controller
    {
        private readonly AppDbContext _context;

        public CabangController(AppDbContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            return View();
        }
<<<<<<< HEAD
        public JsonResult Get()
        {
            var data = _context.Cabang.ToList();
            return Json(new { data = data });
        }
        public JsonResult GetById(int Id)
        {
            var data = _context.Cabang.Single(x => x.Id == Id);
            return Json(new { data = data });
=======
        public JsonResult GetAll()
        {
            var result = _context.Cabang.ToList();
            return Json(new { data = result });
>>>>>>> 578c1a2cd60608e95790b07704cba8346f10834e
        }

        public JsonResult Save(Cabang cabang)
        {
            if (cabang.Id == 0)
            {
                _context.Cabang.Add(cabang);
            }
            else
            {
                var data = _context.Cabang.Where(x=>x.Id == cabang.Id).FirstOrDefault();
                data.Nama = cabang.Nama;
                data.KodeCabang = cabang.KodeCabang;
                data.Sandi = cabang.Sandi;
                data.isDeleted = false;
<<<<<<< HEAD
                _context.Entry(data).State = Microsoft.EntityFrameworkCore.EntityState.Modified;

=======
                _context.Entry(data).State= EntityState.Modified;
>>>>>>> 578c1a2cd60608e95790b07704cba8346f10834e
            }
            _context.SaveChanges();

            return Json(cabang);
        }
        public JsonResult Delete(int Id)
        {
            bool result = false;
<<<<<<< HEAD
            var data = _context.Cabang.Single(x => x.Id == Id);
            if (data != null)
            {
                _context.Cabang.Remove(data);
                _context.SaveChanges();
                result = true;
            }
            return Json(data);
=======
            var data = _context.Cabang.Single(x=>x.Id==Id);
            if (data != null)
            {
                data.isDeleted=true;
                _context.Entry(data).State = EntityState.Modified;
                _context.SaveChanges();
                result = true;
            }
            return Json(result);
>>>>>>> 578c1a2cd60608e95790b07704cba8346f10834e
        }
    }
}
