using Microsoft.AspNetCore.Mvc;

namespace ASK_Core.Controllers.Bank
{
    public class BankController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
