using ASK_Core.Migrations;
using DocumentFormat.OpenXml.Office.CustomUI;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Ririn.Data;
using Ririn.Models.Master;
using Ririn.Models.Transaksi;
using Ririn.ViewModels;

namespace Ririn.Controllers.Transaksi
{
    public class KliringController : Controller
    {
        private readonly AppDbContext _context;
        private readonly IWebHostEnvironment _webHostEnvironment;
        public KliringController(AppDbContext context, IWebHostEnvironment webHostEnvironment)
        {
            _context = context;
            _webHostEnvironment = webHostEnvironment;
        }


        #region View
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult Registrasi()
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
        public IActionResult Reports()
        {
            return View();
        }
        #endregion

        #region GET Data
        [HttpGet]
        public IActionResult GetAll()
        {
            var result = _context.T_Kliring.Include(x => x.BankId)
                .Include(x => x.Keterangan)
                .Include(x => x.Alasan)
                .Include(x => x.Testkey)
                .Include(x => x.Bank)
                .Include(x => x.Cabang).ToList();
            return Ok(new { data = result });
        }

        public JsonResult GetType()
        {
            var result = _context.TypeTrans
                .Include(x => x.Unit).Where(x => x.UnitId == 1).ToList();
            return Json(new { data = result });
        }

       

        public JsonResult SaveReason(string reason)
        {
            int data = 0;
            var exist = _context.Alasan.Where(x => x.Nama== reason).Count();
            if (exist == 0)
            {
                Alasan reasons = new Alasan();
                reasons.Nama = reason;
                //reasons.Createdate = DateTime.Now;
                _context.Alasan.Add(reasons);
                _context.SaveChanges();
                data = reasons.Id;
            }
            else
            {
                var id = _context.Alasan.Single(x => x.Nama== reason).Id;
                data = id;
            }

            return Json(data);
        }

        #endregion

        #region Save Data
        [HttpPost]
        public IActionResult Save(KliringVM data)
        {
            var success = false;
            //var user = GetCurrentUser();
            #region upload File Lampiran
            if (string.IsNullOrWhiteSpace(_webHostEnvironment.WebRootPath))
            {
                _webHostEnvironment.WebRootPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot");
            }
            string webRootPath = _webHostEnvironment.WebRootPath;
            string path = Path.Combine(webRootPath, "File/Lampiran/");
            string generateNamaFile = "Kliring" + "_" + DateTime.Now.ToString("ddMMyy") + "_" + data.Path.FileName;
            Byte[] bytes = Convert.FromBase64String(data.Path.Base64.Substring(data.Path.Base64.LastIndexOf(",") + 1));
            Lib.Lib.SaveBase64(bytes, Path.Combine(path, generateNamaFile));
            #endregion
           if(data.Id == null)
            {
                foreach(var item in data.Testkeys)
                {
                    var teskey = new Testkey
                    {
                        NomorTestkey = item.NomorTestKey,
                        Tanggal = item.TanggalTestKey
                    };
                    _context.Testkey.Add(teskey);
                    _context.SaveChanges();
                }
                var kliring = new T_Kliring
                {
                    NomorSurat = data.NomorSurat,
                    TanggalSurat = data.TanggalSurat,
                    NoReferensi = data.NoReferensi,
                    NamaPenerima = data.NamaPenerima,
                    NomorRekening = data.NomorRekening,
                    Nominal = data.Nominal,
                    TanggalTRX = data.TanggalTRX,
                    NominalSeharusnya = data.NominalSeharusnya,
                    path = generateNamaFile,
                    BankId = data.BankId,
                    CabangId = data.CabangId,
                    AlasanId = data.AlasanId,
                    TypeId = data.TypeId,
                    StatusId =1,
                    Durasi =0

                };
            }
            return Ok(success);
            #endregion
        }
    }
}