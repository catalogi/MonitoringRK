using Microsoft.AspNetCore.Mvc;
using Ririn.Data;
using Ririn.Models.Master;

namespace Ririn.Controllers.Master
{
    public class CabangController : Controller
    {
        private readonly AppDbContext _context;
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Save(Cabang cabang)
    }
}
