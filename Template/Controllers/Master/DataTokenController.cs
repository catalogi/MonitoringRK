using Microsoft.AspNetCore.Mvc;
using Ririn.Data;

namespace ASK_Core.Controllers.Master
{
    public class DataTokenController : Controller
    {
        private readonly AppDbContext _context;
        public DataTokenController(AppDbContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            return View();
        }
        public JsonResult Get()
        {
            var result = _context.Bank.ToList();
            return Json(new { data = result });
        }
    }
}
