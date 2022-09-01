using Microsoft.AspNetCore.Mvc;

namespace ASK_Core.Controllers.UserManagement
{
    public class UsermanagementController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
