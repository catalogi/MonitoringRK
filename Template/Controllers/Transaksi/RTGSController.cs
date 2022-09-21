using ASK_Core.ViewModels;
using DocumentFormat.OpenXml.Office2010.Excel;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Ririn.Data;
using Ririn.Models.Master;

using Ririn.ViewModels;
using IHostingEnvironment = Microsoft.AspNetCore.Hosting.IHostingEnvironment;

using Ririn.Models.Transaksi;


namespace Ririn.Controllers.Transaksi
{
    public class RTGSController : Controller
    {
        private readonly AppDbContext _context;
        private readonly IWebHostEnvironment _host;
        public RTGSController(AppDbContext context, IWebHostEnvironment host) 
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
                .ToList();
            return Json(new { data = result });
        }
        public JsonResult GetType()
        {
            var result = _context.TypeTrans
                .Include(x => x.Unit).Where(x => x.UnitId == 2).ToList();
            return Json(new { data = result });
        }

        #endregion

        public JsonResult Save(RtgsVM data)
        {
            var success = false;
            //var user = GetCurrentUSer();
            #region Upload file
            #endregion
            if (data == null)
            {
                var rtgs = new T_RTGS
                {
                    TypeId = data.TypeId,
                    BankId = data.BankId,
                    CabangId = data.CabangId,
                    KeteranganId = data.KeteranganId,
                    RelTRN = data.RelRTN,
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
                result.KeteranganId = data.KeteranganId;
                result.RelTRN = data.RelRTN;
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
    }
}