using Microsoft.AspNetCore.Mvc;
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
        public IActionResult GetAll()
        {
            var result = _context.Cabang.ToList();
            return Ok(new { data = result });
        }

        public IActionResult Save(Cabang cabang)
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
            }
            _context.SaveChanges();

            return Ok(cabang);
        }
    }
}
