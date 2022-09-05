using Microsoft.AspNetCore.Mvc;
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

        public IActionResult GetAll()
        {
            var result = _context.Bank.ToList();
            return Ok(new {data = result});
        }

        public IActionResult Save(Bank bank)
        {
            if(bank.Id == 0)
            {
                _context.Bank.Add(bank);
            }
            else
            {
                var data = _context.Bank.Where(x=>x.Id == bank.Id).FirstOrDefault();
                data.Nama = bank.Nama;
                data.KodeBIC = bank.KodeBIC;
                data.KodeKliring = bank.KodeKliring;
                data.IsDeleted = false;
            }
            _context.SaveChanges();

            return Ok(bank);
        }

        public IActionResult Delete(int Id)
        {
            //_context.Entry(del).state = entitystate.modified
            return Ok();
        }
    }

    
}
