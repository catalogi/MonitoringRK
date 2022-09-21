using ASK_Core.ViewModels;
using DocumentFormat.OpenXml.Office2010.Excel;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Ririn.Data;
using Ririn.Models.Master;
using Ririn.Models.Transaksi;
using Ririn.ViewModels;


namespace Ririn.Controllers.Transaksi
{
    public class RTGSController : Controller
    {
        private readonly AppDbContext _context;
        private readonly IWebHostEnvironment _webHostEnvironment;
        public RTGSController(AppDbContext context, IWebHostEnvironment webHostEnvironment)

        {
            _context = context;
            _webHostEnvironment = webHostEnvironment;
        }

        #region View
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
        #endregion

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
        
        public JsonResult GetMonitoring()
        {
            var result = _context.T_RTGS
                .Include(x => x.Bank)
                .Include(x => x.Cabang)
                .Include(x => x.Keterangan)
                .Include(x=>x.Type)
                .Include(x=>x.Status)
                .Where(x=>x.IsDeleted == false && x.StatusId == 2 && x.Type.UnitId==2)

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

        #region Save Post
        [HttpPut]
        public JsonResult DoneSaved(DoneRVM data)
        {
            bool success = false;
            if(data.Id != null)
            {
                var dat = _context.T_RTGS.Where(x => x.Id == data.Id).FirstOrDefault();
                dat.KeteranganId = data.KeteranganId;
                dat.FollowUp = data.FollowUp;
                dat.StatusId = 2;
                dat.TanggalDone = DateTime.Now;
                _context.Entry(dat).State = EntityState.Modified;
                _context.SaveChanges();
                success = true;
            }

            return Json(success);
        }
        [HttpPost]
        public JsonResult Save(RtgsVM data)
        {
            var success = false;
            //var user = GetCurrentUSer();
            #region Upload file
            #endregion
            if (data.Id == null)
            {
                var rtgs = new T_RTGS
                {
                    TypeId = data.TypeId,
                    BankId = data.BankId,
                    CabangId = data.CabangId,
                    //KeteranganId = data.KeteranganId,
                    RelTRN = data.RelTRN,
                    TRN = data.TRN,
                    Nominal = data.Nominal,
                    NomorSurat = data.NomorSurat,
                    NomorTestkey = data.NomorTestkey,
                    TanggalProses = data.TanggalProses,
                    Path = null,
                    StatusId = 1,
                    Durasi = 0
                };
                _context.T_RTGS.Add(rtgs);
                _context.SaveChanges();
                success = true;
            }
            else
            {
                var result = _context.T_RTGS.Where(x => x.Id == data.Id).FirstOrDefault();
                result.TypeId = data.TypeId;
                result.BankId = data.BankId;
                result.CabangId = data.CabangId;
               
                result.RelTRN = data.RelTRN;
                result.TRN = data.TRN;
                result.Nominal = data.Nominal;
                result.NomorSurat = data.NomorSurat;
                result.NomorTestkey = data.NomorTestkey;
                result.TanggalProses = data.TanggalProses;
                _context.Entry(result).State = EntityState.Modified;
                _context.SaveChanges();
                success = true;
            }
            return Json(success);
        }
        #endregion

        #region Delete
        public JsonResult Delete(int Id)
        {
            bool status = false;
            var data = _context.T_RTGS.Single(x => x.Id == Id); 
            if (data != null)
            {
                _context.T_RTGS.Remove(data);
                _context.SaveChanges();
                status = true;
            }
            else
            {
                status = false;
            }
            return Json(status);
        }
        #endregion
    }
}