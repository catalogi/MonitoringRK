using Microsoft.AspNetCore.Mvc;
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
            var result = _context.T_RTGS.ToList();
            return Ok(new { data = result });
        }
    }
}
