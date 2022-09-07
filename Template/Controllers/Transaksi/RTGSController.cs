using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Ririn.Data;

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

        public IActionResult GetAll()
        {
            var result = _context.T_RTGS
                .Include(x=>x.Bank)
                .Include(x=>x.Cabang)
                .Include(x=>x.Keterangan)
                .Include(x=>x.Testkey)
                .ToList();
            return Ok(new { data = result });
        }
        
    }
}
