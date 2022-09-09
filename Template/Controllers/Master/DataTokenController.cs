using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Ririn.Data;
using Ririn.Models.Master;

namespace Ririn.Controllers.Master
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
        public JsonResult GetData()
        {
            var result = _context.DataToken
                .Include(x => x.Kelompok)
                .Include(x => x.Modul)
                .ToList();
            return Json(new { data = result });
        }
        public JsonResult GetById(int Id)
        {
            var data = _context.DataToken.Single(x => x.Id == Id);
            return Json(new { data = data });
        }
        public JsonResult Save(DataToken datatoken)
        {
            if (datatoken.Id == 0)
            {

                _context.DataToken.Add(datatoken);
            }
            else
            {
                var data = _context.DataToken.Where(x => x.Id == datatoken.Id).FirstOrDefault();
                data.KelompokId = datatoken.KelompokId;
                data.ModulId = datatoken.ModulId;
                data.NPP = datatoken.NPP;
                data.UserId = datatoken.UserId;
                data.Nama = datatoken.Nama;
                data.Group = datatoken.Group;
                data.ApprovalLimit = datatoken.ApprovalLimit;
                data.UserIdToken = datatoken.UserIdToken;
                data.TokenExpired = datatoken.TokenExpired;
                data.Keterangan = datatoken.Keterangan;
                data.IsDeleted = false;
                data.UpdateDate = DateTime.Now;
                _context.Entry(data).State = EntityState.Modified;
            }
            _context.SaveChanges();

            return Json(datatoken);
        }
        public JsonResult Delete(int Id)
        {
            bool result = false;
            var data = _context.DataToken.Single(x => x.Id == Id);
            if (data != null)
            {
                data.IsDeleted = true;
                _context.DataToken.Remove(data);               
                _context.SaveChanges();
                
            }
            return Json(result);
        }
    }
}
