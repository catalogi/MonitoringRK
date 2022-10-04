using Ririn.ViewModels;
using DocumentFormat.OpenXml.Office2010.Excel;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Ririn.Data;
using Ririn.Models.Master;
using Ririn.Models.Transaksi;
using Ririn.ViewModels;
using Microsoft.AspNetCore.Authorization;

namespace Ririn.Controllers.Transaksi
{
    [Authorize]
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
                .Include(x => x.Type)
                .Where(x => x.IsDeleted == false && x.StatusId == 1 && x.Type.UnitId == 2);

            var data = result.Select(x => x.Id).ToList();


            foreach (var item in data)
            {
                GetLibur(item);

            }
            return Json(new { data = result });
        }

        public JsonResult GetMonitoring()
        {
            var result = _context.T_RTGS
                .Include(x => x.Bank)
                .Include(x => x.Cabang)
                .Include(x => x.Keterangan)
                .Include(x => x.Type)
                .Include(x => x.Status)
                .Where(x => x.IsDeleted == false && x.StatusId == 2 && x.Type.UnitId == 2);
            var data = result.Select(x => x.Id).ToList();


            foreach (var item in data)
            {
                GetLibur(item);

            }
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
                .Where(x => x.Type.UnitId == 2).Single(x => x.Id == Id);
            return Json(new { data = data });
        }
        #endregion

        #region Save Post
        [HttpPut]
        public JsonResult DoneSaved(DoneRVM data)
        {
            bool success = false;
            if (data.Id != null)
            {
                var ket = 0;

                if (data.KeteranganId == null)
                {
                    if (data.KeteranganLain != null)
                    {
                        var AddKet = new Keterangan
                        {
                            Nama = data.KeteranganLain,
                        };
                        _context.Keterangan.Add(AddKet);
                        _context.SaveChanges();

                        ket = AddKet.Id;

                    }

                }
                else
                {
                    ket = data.KeteranganId ?? 0;
                }
                var dat = _context.T_RTGS.Where(x => x.Id == data.Id).FirstOrDefault();
                dat.KeteranganId = ket;
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
            #region upload File Lampiran
            if (string.IsNullOrWhiteSpace(_webHostEnvironment.WebRootPath))
            {
                _webHostEnvironment.WebRootPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot");
            }
            string webRootPath = _webHostEnvironment.WebRootPath;
            string path = Path.Combine(webRootPath, "File", "RTGS");
            string generateNameFile = "RTGS" + "_" + data.NomorTestkey + "_" + DateTime.Now.ToString("ddMMyyyy") + "_" + ".png";
            Byte[] bytes = Convert.FromBase64String(data.Path.Replace("data:image/png;base64,", ""));
            Lib.Lib.SaveBase64(bytes, Path.Combine(path, generateNameFile));

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
                    Path = generateNameFile,
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
                result.Path = generateNameFile;
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

        public IActionResult Filter(DateTime Awal, DateTime Akhir)
        {
            var filter = _context.T_RTGS
                .Include(x => x.Bank)
                .Include(x => x.Cabang)
                .Include(x => x.Keterangan)
                .Include(x => x.Type)
                .Include(x => x.Status)
                .Where(x => x.IsDeleted == false && x.StatusId == 2 && (x.CreateDate >= Awal.Date.AddDays(-1)
                && x.CreateDate < Akhir.Date)).ToList();
            return Ok(new { data = filter });
        }

        public IActionResult GetTypeFilter(int Id)
        {
            var filter = _context.T_RTGS
                .Include(x => x.Bank)
                .Include(x => x.Cabang)
                .Include(x => x.Keterangan)
                .Include(x => x.Type)
                .Include(x => x.Status)
                .Where(x => x.IsDeleted == false && x.StatusId == 1 && x.TypeId == Id).ToList();
            return Ok(new { data = filter });
        }

        public JsonResult GetBankId(int tId)
        {
            var tName = _context.TypeTrans.Single(x => x.Id == tId).Nama;
            int bankId = 0;
            if (tName == "RTGS Keluar")
            {
                bankId = _context.Bank.Single(x => x.KodeBIC == "BNINIDJA").Id;
            }
            else
            {
                bankId = 0;
            }
            return Json(bankId);
        }

        public int GetLibur(int Id)
        {
            var count = 0;
            var data = _context.T_RTGS.Where(x => x.Id == Id).FirstOrDefault();
            if (data.StatusId == 1)
            {
                count = DateCount(data.CreateDate, DateTime.Now);
                data.Durasi = count;
                _context.Entry(data).State = EntityState.Modified;
                _context.SaveChanges();
            }
            if (data.StatusId == 2)
            {
                count = DateCount(data.CreateDate, data.TanggalDone);
                data.Durasi = count;
                _context.Entry(data).State = EntityState.Modified;
                _context.SaveChanges();
            }

            return count;
        }
        public int DateCount(DateTime? start, DateTime? end, params DateTime[] holidays)
        {
            DateTime startDate = start ?? DateTime.Now;
            DateTime endDate = (DateTime)end;

            if (startDate > endDate)
                throw new ArgumentException("Incorrect last day " + endDate);

            TimeSpan span = endDate - startDate;
            int countDuration = span.Days + 1;
            int fullWeekCount = countDuration / 7;

            if (countDuration > fullWeekCount * 7)
            {
                //int firstDayOfWeek = (int)startDate.DayOfWeek;
                //int lastDayOfWeek = (int)endDate.DayOfWeek;
                int firstDayOfWeek = startDate.DayOfWeek == DayOfWeek.Sunday
                    ? 7 : (int)startDate.DayOfWeek;
                int lastDayOfWeek = endDate.DayOfWeek == DayOfWeek.Sunday
                    ? 7 : (int)endDate.DayOfWeek;

                if (lastDayOfWeek < firstDayOfWeek)
                {
                    lastDayOfWeek += 7;
                }
                if (firstDayOfWeek <= 6)
                {
                    if (lastDayOfWeek >= 7)
                    {
                        countDuration -= 2;
                    }
                    else if (lastDayOfWeek >= 6)
                    {
                        countDuration -= 1;
                    }
                }
                else if (lastDayOfWeek <= 7 && lastDayOfWeek >= 7)
                {
                    countDuration -= 1;
                }
            }
            countDuration -= fullWeekCount + fullWeekCount;

            //DateTime[] liburs = _context.Libur.Select(x => x.TanggalLibur).ToArray();

            foreach (DateTime libur in holidays)
            {
                DateTime lb = libur.Date;
                if (startDate <= lb && lb <= endDate)
                {
                    --countDuration;
                }
            }


            return countDuration;
        }
    }
}