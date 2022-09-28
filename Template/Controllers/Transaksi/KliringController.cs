

using System;
using System.IO;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Ririn.Data;
using Ririn.Models.Master;
using Ririn.Models.Transaksi;
using Ririn.ViewModels;
//using Syncfusion.Pdf.Parsing;
using Syncfusion.Pdf;
using Syncfusion.Pdf.Parsing;
using Microsoft.AspNetCore.Http;
using System.Net.Mime;
using System.Net;

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
        public IActionResult Surat()
        {
            return View();
        }
        #endregion

        #region GET Data

        [HttpGet]
        public JsonResult GetAll()
        {
            var result = _context.T_Kliring
                .Include(x => x.Keterangan)
                .Include(x => x.Alasan)
                .Include(x => x.Bank)
                .Include(x => x.Cabang)
                .Include(x => x.Type).Where(x => x.IsDeleted == false && x.StatusId == 1);

            var data = result.Select(x => x.Id).ToList();


            foreach (var item in data)
            {
                GetLibur(item);

            }
            return Json(new { data = result });
        }
        public JsonResult GetMonitoring()
        {
            var result = _context.T_Kliring
                .Include(x => x.Keterangan)
                .Include(x => x.Alasan)
                .Include(x => x.Bank)
                .Include(x => x.Cabang)
                .Include(x => x.Type)
                .Where(x => x.IsDeleted == false && x.StatusId == 2)
                .Select(x => new
                {
                    Id = x.Id,
                    Bank = x.Bank.Nama,
                    cabang = x.Cabang.Nama,
                    type = x.Type.Nama,
                    alasan = x.Alasan.Nama,
                    Keterangan = x.Keterangan.Nama,
                    nosurat = x.NomorSurat,
                    tanggalTRX = x.TanggalTRX,
                    norek = x.NomorRekening,
                    namaPenerima = x.NamaPenerima,
                    durasi = GetLibur(x.Id)

                })
                .ToList();
            return Json(new { data = result });
        }

        //public JsonResult Get()
        //{
        //    var result = _context.T_Kliring
        //        .Include(x=> x.KeteranganId)
        //        .Include()
        //}

        public JsonResult GetType()
        {
            var result = _context.TypeTrans
                .Include(x => x.Unit).Where(x => x.UnitId == 1).ToList();
            return Json(new { data = result });
        }


        public JsonResult GetById(int Id)
        {
            var data = _context.T_Kliring
                .Include(x => x.Cabang)
                .Include(x => x.Bank)
                .Include(x => x.Alasan)
                .Include(x => x.Type)
                .Where(x => x.Type.UnitId == 1)
                .Select(x => new
                {
                    Id = x.Id,
                    BankId = x.Bank.Id,
                    cabangId = x.Cabang.Id,
                    typeId = x.Type.Id,
                    alasanId = x.Alasan.Id,
                    nomorSurat = x.NomorSurat,
                    tanggalTRX = x.TanggalTRX,
                    tanggalSurat = x.TanggalSurat,
                    tanggaltestkey = x.TanggalTestkey,
                    nomorTestkey = x.NomorTestkey,
                    nominalSeharusnya = x.NominalSeharusnya,
                    nomorRekening = x.NomorRekening,
                    namaPenerima = x.NamaPenerima,
                    nominal = x.Nominal,
                    noReferensi = x.NoReferensi,
                }).Single(x => x.Id == Id);
            return Json(new { data = data });
        }
        #endregion

        #region Save Data
        public IActionResult Done(DoneVM data)
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
                    else
                    {
                        ket = data.KeteranganId ?? 0;
                    }
                }

                var dat = _context.T_Kliring.Where(x => x.Id == data.Id).FirstOrDefault();

                dat.AlasanId = data.AlasanId;
                dat.KeteranganId = ket;
                dat.StatusId = 2;
                dat.TanggalDone = DateTime.Now;

                _context.Entry(dat).State = EntityState.Modified;
                _context.SaveChanges();
                success = true;
            }

            return Ok(success);
        }

        public IActionResult Surat(int Id)
        {
            var data = _context.T_Kliring
                .Include(x => x.Type)
                .Include(x => x.Alasan)
                .Include(x => x.Bank)
                .Include(x => x.Keterangan)
                .Where(x => x.Id == Id).FirstOrDefault();
            return View();
        }



        public JsonResult SaveReason(string alasan)
        {
            int data = 0;
            var exist = _context.Alasan.Where(x => x.Nama == alasan).Count();
            if (exist == 0)
            {
                Alasan alasans = new Alasan();
                alasans.Nama = alasan;
                //reasons.Createdate = DateTime.Now;
                _context.Alasan.Add(alasans);
                _context.SaveChanges();
                data = alasans.Id;
            }
            else
            {
                var id = _context.Alasan.Single(x => x.Nama == alasan).Id;
                data = id;
            }

            return Json(data);
        }


        [HttpPost]
        public JsonResult Save(KliringVM data)
        {
            var success = false;
            //var user = GetCurrentUser();

            #region upload File Lampiran
            if (string.IsNullOrWhiteSpace(_webHostEnvironment.WebRootPath))
            {
                _webHostEnvironment.WebRootPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot");
            }
            string webRootPath = _webHostEnvironment.WebRootPath;
            string path = Path.Combine(webRootPath, "File", "Kliring");
            string generateNameFile = "Kliring" + "_" + DateTime.Now.ToString("ddMMyyyy") + "_" + data.Path.FileName;
            Byte[] bytes = Convert.FromBase64String(data.Path.Base64.Substring(data.Path.Base64.LastIndexOf(",") + 1));
            Lib.Lib.SaveBase64(bytes, Path.Combine(path, generateNameFile));

            #endregion

            if (data.Id == null)
            {
                var alasanLain = 0;

                if (data.AlasanId == null)


                {
                    if (data.AlasanLain != null)
                    {
                        var newalasan = new Alasan
                        {

                            Nama = data.AlasanLain,
                        };
                        _context.Add(newalasan);
                        _context.SaveChanges();

                        alasanLain = newalasan.Id;
                    }

                }
                else
                {

                    alasanLain = data.AlasanId ?? 0;
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
                    TanggalTestkey = data.TanggalTestKey,
                    NomorTestkey = data.NomorTestKey,
                    NominalSeharusnya = data.NominalSeharusnya,
                    Path = generateNameFile,
                    BankId = data.BankId,
                    CabangId = data.CabangId,
                    AlasanId = alasanLain,
                    TypeId = data.TypeId,
                    StatusId = 1,
                    Durasi = 0

                };
                _context.T_Kliring.Add(kliring);
                _context.SaveChanges();

                var hk = GetLibur(kliring.Id);
                kliring.Durasi = hk;
                _context.Entry(kliring).State = EntityState.Modified;
                _context.SaveChanges();

            }
            else
            {

                //if (data.NomorTestKey != null && data.TanggalTestKey != null)
                //{

                var result = _context.T_Kliring.Where(x => x.Id == data.Id).FirstOrDefault();

                result.NomorSurat = data.NomorSurat;
                result.TanggalSurat = data.TanggalSurat;
                result.NoReferensi = data.NoReferensi;
                result.NamaPenerima = data.NamaPenerima;
                result.NomorRekening = data.NomorRekening;
                result.Nominal = data.Nominal;
                result.TanggalTRX = data.TanggalTRX;
                result.TanggalTestkey = data.TanggalTestKey;
                result.NomorTestkey = data.NomorTestKey;
                result.NominalSeharusnya = data.NominalSeharusnya;
                result.Path = generateNameFile;
                result.BankId = data.BankId;
                result.CabangId = data.CabangId;
                if (data.AlasanId == null)
                {
                    if (data.AlasanLain != null)
                    {
                        var newalasan = new Alasan
                        {

                            Nama = data.AlasanLain,
                        };
                        _context.Add(newalasan);
                        _context.SaveChanges();
                        result.AlasanId = newalasan.Id;
                    };
                }
                else
                {
                    result.AlasanId = data.AlasanId;
                }
                result.TypeId = data.TypeId;
                result.UpdateDate = DateTime.Now;

                _context.Entry(result).State = EntityState.Modified;
                _context.SaveChanges();
                success = true;
            }
            return Json(success);

        }
        #endregion

        public int GetLibur(int Id)
        {
            var count = 0;
            var data = _context.T_Kliring.Where(x =>x.Id == Id).FirstOrDefault();
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
        public  int DateCount(this DateTime start, DateTime? end, params DateTime[] holidays)
        {
            DateTime startDate = start;
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