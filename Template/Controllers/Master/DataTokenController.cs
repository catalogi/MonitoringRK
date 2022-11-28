using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Ririn.Data;
using Ririn.Models.Master;
using Ririn.ViewModels;

namespace Ririn.Controllers.Master
{
    [Authorize]
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
            var result = _context.his_tgltoken
                .Include(x => x.datatoken)
                .Include(x => x.datatoken.Kelompok)
                .Include(x => x.datatoken.Modul)
                .ToList().OrderByDescending(x=>x.Id).DistinctBy(x => x.datatokenId);
            return Json(new { data = result });
        }
        public JsonResult GetById(int Id)
        {
            var data = _context.his_tgltoken
                .Include(x=>x.datatoken)
                .Include(x=>x.datatoken.Kelompok)
                .Include(x=>x.datatoken.Modul)
                .FirstOrDefault(x => x.datatokenId == Id);
            return Json(new { data = data });
        }
        public JsonResult Save(TokenVM datatoken)
        {
            var success = false;
            var tokenID = 0;
            if (datatoken.Id == 0)
            {
                var newModul = 0;

                if (datatoken.ModulId == null)
                {
                    if (datatoken.AddModul != null)
                    {
                        var mod = new Modul
                        {
                            Nama = datatoken.AddModul,
                        };
                        _context.Modul.Add(mod);
                        _context.SaveChanges();

                        newModul = mod.Id;
                    }
                }
                else
                {
                    newModul = datatoken.ModulId ?? 0;
                }
                var token = new DataToken
                {
                    KelompokId = datatoken.KelompokId,
                    ModulId = newModul,
                    NPP = datatoken.NPP,
                    UserId = datatoken.UserId,
                    Nama = datatoken.Nama,
                    Group = datatoken.Group,
                    ApprovalLimit = datatoken.ApprovalLimit,
                    UserIdToken = datatoken.UserIdToken,
                    Keterangan = datatoken.Keterangan,
                    IsDeleted = false,
                    CreateDate = DateTime.Now
                };
                _context.DataToken.Add(token);
                _context.SaveChanges();
                tokenID = token.Id;

                var result = new his_tgltoken
                {
                    DateToken = datatoken.DateToken,
                    Keterangant = "Tanggal Awal",
                    datatokenId = tokenID,
                    CreateDate = DateTime.Now
                };
                _context.his_tgltoken.Add(result);
                _context.SaveChanges();
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
                data.Keterangan = datatoken.Keterangan;
                data.IsDeleted = false;
                data.UpdateDate = DateTime.Now;
                _context.Entry(data).State = EntityState.Modified;
                _context.SaveChanges();
                tokenID = data.Id;

                var tgltoken = _context.his_tgltoken.Where(x => x.datatokenId == tokenID).FirstOrDefault();

                if (datatoken.DateToken != tgltoken.DateToken)
                {
                    tgltoken.DateToken = datatoken.DateToken;
                    tgltoken.datatokenId = tokenID;
                    tgltoken.UpdateDate = DateTime.Now;
                    _context.Entry(tgltoken).State = EntityState.Modified;
                    _context.SaveChanges();

                }

            }

            success = true;
            return Json(success);
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

        public IActionResult gethistoken(int Id, int datatokenId)
        {
            var result = _context.his_tgltoken.Include(x => x.datatoken).Where(x => x.datatokenId == datatokenId).ToList();

            return Ok(new { data = result });
        }
        public JsonResult Delete(int? Id)
        {
            bool result = false;
            var data = _context.his_tgltoken.Single(x => x.Id == Id);
            if (data != null)
            {
               
                _context.his_tgltoken.Remove(data);
                _context.SaveChanges();

            }
            return Json(result);
        }
        public IActionResult Filter(DateTime Awal, DateTime Akhir)
        {
            var filter = _context.his_tgltoken
                .Include(x => x.datatoken)
                .Include(x => x.datatoken.Kelompok)
                .Include(x => x.datatoken.Modul)

                .Where(x => x.datatoken.IsDeleted == false && (x.DateToken.Date >= Awal.Date
                && x.DateToken.Date <= Akhir.Date))
                .ToList();
            return Ok(new { data = filter });
        }
        public IActionResult PerpanjangToken(DateTime date, int idToken, string Keterangant, int datatokenId)
        {
            var success = false;
            if (date != null && idToken != null)
            {
                var dataTokenId = _context.his_tgltoken.Where(x => x.datatokenId == datatokenId).FirstOrDefault();
                var expired = new his_tgltoken
                {
                    DateToken = date,
                    Keterangant = Keterangant,
                    datatokenId = datatokenId,
                    CreateDate = DateTime.Now,

                };
                _context.his_tgltoken.Add(expired);
                _context.SaveChanges();
                success = true;
            }

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
