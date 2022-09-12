using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Ririn.Data;
using Ririn.Models.Master;
using Ririn.Models.Transaksi;
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
        public IActionResult Monitoring()
        {
            return View();
        }
        public IActionResult Report()
        {
            return View();
        }

        public IActionResult GetAll()
        {
            var result = _context.T_RTGS
                .Include(x => x.Bank)
                .Include(x=>x.Cabang)
                .Include(x=>x.Keterangan)
                .Include(x=>x.Testkey)
                .ToList();
            return Ok(new { data = result });
        }
        public JsonResult GetType()
        {
            var result = _context.TypeTrans
                .Include(x => x.Unit).Where(x => x.UnitId == 2).ToList();
            return Json(new { data = result });
        }

        public JsonResult Save(T_RTGS rtgs)
        {
            bool status = false;
            string path = Path.Combine(_host.WebRootPath, "ScreenCapture");
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path); //Create directory if it doesn't exist
            }

            string imgName = rtgs.Testkey.Replace("/", "-") + ".jpg";
            string imgPath = Path.Combine(path, imgName);
            string converted = rtgs.Path.Replace("data:image/png;base64,", "");

            byte[] imageBytes = Convert.FromBase64String(converted);

            System.IO.File.WriteAllBytes(imgPath, imageBytes);
            if (rtgs.Id == 0)
            {
                rtgs.CreateDate = DateTime.Now;
                rtgs.TanggalDone = rtgs.CreateDate;
                rtgs.KeteranganId = 1;
                rtgs.IsDone = false;
                rtgs.Path = imgName;
                _context.T_RTGS.Add(rtgs);
                _context.SaveChanges();
                int rId = rtgs.Id;
                var tk = new TestKeyRTGS();
                tk.KeteranganTK = _context.Keterangan.Single(x => x.Id == data.KeteranganId).NamaKeterangan;
                tk.NomerTK = rtgs.NomerTestkey;
                tk.TglTestKey = rtgs.Tanggal;
                tk.MTGSId = dartgsta.Id;
                _context.TestKeyRTG.Add(tk);
                _context.SaveChanges();
                status = true;
            }
            else
            {
                var db = _context.MonitoringRTGS.Single(x => x.Id == rtgs.Id);
                db.TypeId = rtgs.TypeId;
                db.Tanggal = rtgs.Tanggal;
                db.CabangId = rtgs.CabangId;
                db.NomerSurat = rtgs.NomerSurat;
                db.RelTRN = rtgs.RelTRN;
                db.BankTujuanId = rtgs.BankTujuanId;
                db.Nominal = rtgs.Nominal;
                db.Keterangan = rtgs.Keterangan;
                db.NomerTestkey = rtgs.NomerTestkey;
                db.TRN = rtgs.TRN;
                _context.Entry(db).State = EntityState.Modified;
                _context.SaveChanges();
                status = true;
            }
            return Json(status);
        }
    }
}
