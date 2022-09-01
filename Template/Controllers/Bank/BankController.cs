using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Template.Data;
using Template.Models.Master;

namespace Template.Controllers.Bank
{
    public class BankController : Controller
    {
        private readonly AppDbContext _context;
        public BankController(AppDbContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            return View();
        }
        public JsonResult Get()
        {
            var data = _context.Bank.ToList();
            return Json(new { data = data });
        }
        public JsonResult GetById(int Id)
        {
            var data = _context.Bank.Single(x => x.Id == Id);
            return Json(new { data = data });
        }
        public IActionResult Save(Bank bank)
        {
            bool result = false;
            if (data.Id == 0)
            {
                _context.Bank.Add(data);
                _context.SaveChanges();
                result = true;
            }
            else
            {
                Bank bank = _context.Bank.Single(x => x.Id == data.Id);
                bank.BankName = data.BankName;
                bank.KodeBank = data.KodeBank;
                bank.KodeKliring = data.KodeKliring;
                _context.Entry(bank).State = EntityState.Modified;
                _context.SaveChanges();
                result = true;
            }
            return Json(result);
        }
    }
}
