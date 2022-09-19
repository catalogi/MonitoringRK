using DocumentFormat.OpenXml.Office2010.Excel;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Ririn.Data;
using Ririn.Models.Master;
using Ririn.Models.Transaksi;
using Ririn.ViewModels;
using IHostingEnvironment = Microsoft.AspNetCore.Hosting.IHostingEnvironment;

namespace Ririn.Controllers.Transaksi
{
    public class RTGSController : Controller
    {
        private readonly AppDbContext _context;
        private readonly IHostingEnvironment _host;
        public RTGSController(AppDbContext context, IHostingEnvironment host)
         
        {
            _context = context;
            _host = host;
        }

        public IActionResult Index()
        {
            return View();
        }
        public IActionResult Register()
        {
            return View();
        }
        public IActionResult Proses()
        {
            return View();
        }
        public IActionResult editProses()
        {
            return View();
        }
        public IActionResult Monitoring()
        {
            return View();
        }
        public IActionResult Report()
        {
            return View();
        }

        #region Get Data
        public JsonResult GetAll()
        {
            var result = _context.T_RTGS
                .Include(x => x.Bank)
                .Include(x => x.Cabang)
                .Include(x => x.Keterangan)
                
                .Include(x=>x.Type)
                .Where(x=>x.IsDeleted == false && x.StatusId == 1 && x.Type.UnitId==2)
                .ToList();
            return Json(new { data = result });
        }
        public JsonResult GetType()
        {
            var result = _context.TypeTrans
                .Include(x => x.Unit).Where(x => x.UnitId == 2).ToList();
            return Json(new { data = result });
        }

        public JsonResult GetById(int Id)
        {
            var data = _context.T_RTGS
                .Include(x => x.Type.Unit)
                .Where(x=>x.Type.UnitId == 2).Single(x => x.Id == Id);
            return Json(new { data = data });
        }
        #endregion


        //public IActionResult Save(TranshVM rtgs)
        //{
        //    var success = false;
        //    if (rtgs == null)
        //    {
        //        var testkey = new Testkey
        //        {
        //            NomorTestkey = rtgs.NomorTestkey,
        //            TanggalTestKey = rtgs.TanggalTestkey,
        //            KeteranganId = rtgs.KeteranganId,
        //            UnitId = rtgs.UnitId,
        //        };
        //        success = true;
        //    }
        //    return Ok(success);
        //}

        public IActionResult Save(KliringVM data)
        {
            var success = false;
            if (data == null)
            {
                
                success = true;
            }
            return Ok(success);
        }

    }
}