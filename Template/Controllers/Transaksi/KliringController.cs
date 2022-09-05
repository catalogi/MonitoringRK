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

    }
}
