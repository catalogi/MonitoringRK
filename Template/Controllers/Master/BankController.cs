using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Ririn.Data;
using Ririn.Models.Master;

namespace Ririn.Controllers.Master
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
            var result = _context.Bank.ToList();
            return Json(new {data = result});
        }
        public JsonResult GetById(int Id)
        {
            var data = _context.Bank.Single(x => x.Id == Id);
            return Json(new { data = data });
        }

        public JsonResult Save(Bank bank)
        {
            if(bank.Id == 0)
            {
                bank.IsDeleted = false;
                _context.Bank.Add(bank);
            }
            else
            {
                var data = _context.Bank.Where(x=>x.Id == bank.Id).FirstOrDefault();
                data.Nama = bank.Nama;
                data.KodeBIC = bank.KodeBIC;
                data.KodeKliring = bank.KodeKliring;
                data.IsDeleted = false;
                _context.Entry(data).State = EntityState.Modified;
                _context.Entry(data).State = EntityState.Modified;

            }
            _context.SaveChanges();

            return Json(bank);
        }

        public JsonResult Delete(int Id)
        {
            bool result = false;
            Bank bank = _context.Bank.Single(x => x.Id == Id);
            if(bank != null)
            {
                bank.IsDeleted = true;
                _context.Entry(bank).State = EntityState.Modified;
                _context.SaveChanges();
                result = true;
            }
            return Json(result);
        }
    }

    
}
