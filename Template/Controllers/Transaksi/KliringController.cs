using ASK_Core.Migrations;
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
                .Include(x => x.Unit).Where(x => x.UnitId == 3).ToList();
            return Json(new { data = result });
        }
        #endregion

        #region Save Data
        [HttpPost]
        public IActionResult Save(TranshVM data)
        {
            var success = false;
            //var user = GetCurrentUser();

            if (data.Id == null)
            {
                var testkey = new Testkey
                {
                    NomorTestkey = data.NomorTestKey,
                    TanggalTestKey = data.TanggalTestkey,
                    KeteranganId = data.KeteranganId,
                    UnitId = data.UnitId
                };
                _context.Testkey.Add(testkey);
                _context.SaveChanges();
                foreach (var item in data.klirings)
                {
                    if (string.IsNullOrWhiteSpace(_webHostEnvironment.WebRootPath))
                    {
                        _webHostEnvironment.WebRootPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot");
                    }
                    string webRootPath = _webHostEnvironment.WebRootPath;
                    string path = Path.Combine(webRootPath, "File/Lampiran/");
                    string generateNamaFile = "Kliring" + "_" + DateTime.Now.ToString("ddMMyy") + "_" + item.Path.FileName;
                    Byte[] bytes = Convert.FromBase64String(item.Path.Base64.Substring(item.Path.Base64.LastIndexOf(",") + 1));
                    Lib.Lib.SaveBase64(bytes, Path.Combine(path, generateNamaFile));
                    var kliring = new T_Kliring
                    {
                        NomorSurat = item.NomorSurat,
                        TanggalSurat = item.TanggalSurat,
                        NoReferensi = item.NoReferensi,
                        NamaPenerima = item.NamaPenerima,
                        BankId = item.BankId,
                        NomorRekening = item.NomorRekening,
                        Nominal = item.Nominal,
                        CabangId = item.CabangId,
                        TanggalTRX = item.TanggalTRX,
                        TestkeyId = testkey.Id,
                        KeteranganId = item.KeteranganId,
                        AlasanId = item.AlasanId,
                        NominalSeharusnya = item.NominalSeharusnya,
                        TypeId = item.TypeId,
                        path = generateNamaFile,
                        StatusId = 1,
                        Durasi = 0,
                        //CreaterId= User.Id

                    };
                    _context.T_Kliring.Add(kliring);
                }
                _context.SaveChanges();
                success = true;
            }
            else
            {
                var kliring = new T_Kliring
                {
                    NomorSurat = item.NomorSurat,
                    TanggalSurat = item.TanggalSurat,
                    NoReferensi = item.NoReferensi,
                    NamaPenerima = item.NamaPenerima,
                    BankId = item.BankId,
                    NomorRekening = item.NomorRekening,
                    Nominal = item.Nominal,
                    CabangId = item.CabangId,
                    TanggalTRX = item.TanggalTRX,
                    TestkeyId = testkey.Id,
                    KeteranganId = item.KeteranganId,
                    AlasanId = item.AlasanId,
                    NominalSeharusnya = item.NominalSeharusnya,
                    

                };
                _context.Entry(kliring).State = EntityState.Modified;
            }
            return Ok(success);

        }
        #endregion

    }
}
