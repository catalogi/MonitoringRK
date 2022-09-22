using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Ririn.Data;
using Ririn.Models.Master;
using Ririn.ViewModels;

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
        //public JsonResult PerpanjangTanggal(int Id)
        //{
        //    try
        //    {
        //        var data = _context.DataToken.Single(x => x.Id == Id);
        //        if(data)
        //    }
        //    catch(Exception ex)
        //    {

        //    }
        //}
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
        public IActionResult Filter(DateTime Awal, DateTime Akhir)
        {
            var filter = _context.DataToken
                .Include(x=>x.Kelompok)
                .Include(x=>x.Modul)
               
                .Where(x => x.IsDeleted == false && (x.TokenExpired.Date >= Awal.Date
                && x.TokenExpired.Date <= Akhir.Date))
                .ToList();
            return Ok(new { data = filter });
        }
        public IActionResult PerpanjangToken(DateTime date, int idToken)
        {
            var success = false;
            if (date != null && idToken != null)
            {
                var expired = _context.DataToken.Where(x => x.Id == idToken).FirstOrDefault();
                expired.TokenExpired = date;
                _context.Entry(expired).State = EntityState.Modified;
                success = true;
            }
            _context.SaveChanges();
            return Ok(success);
        }
        //public IActionResult PerpanjangToken(TokenVM data)
        //{
        //    var success = false;
        //    if (data.Id != null)
        //    {
        //        var expired = _context.DataToken.Where(x => x.Id == data.Id).FirstOrDefault();
        //        expired.TokenExpired = data.TokenExpired;
        //        _context.Entry(expired).State = EntityState.Modified;
        //    }
        //    _context.SaveChanges();
        //    return Ok(data);
        //}
    }
}
