using System;
using System.IO;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Ririn.Data;
using Ririn.Models.Master;
using Ririn.Models.Transaksi;
using Ririn.ViewModels;
using OfficeOpenXml;
using OfficeOpenXml.Style;
using Syncfusion.Pdf;
using Syncfusion.Pdf.Parsing;
using Syncfusion.DocIO;
using Syncfusion.DocIO.DLS;
using Syncfusion.DocIORenderer;
using Microsoft.AspNetCore.Http;
using System.Net.Mime;
using System.Net;

using SkiaSharp;
using Microsoft.AspNetCore.Authorization;

namespace Ririn.Controllers.Transaksi
{
    [Authorize]
    public class KliringController : Controller
    {
        private readonly AppDbContext _context;
        private readonly IWebHostEnvironment _webHostEnvironment;
        public KliringController(AppDbContext context, IWebHostEnvironment webHostEnvironment)
        {
            _context = context;
            _webHostEnvironment = webHostEnvironment;

        }

        //public private GetCurrentUser()
        //{

        //}


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
                .Include(x => x.Surat)
                .Include(x => x.Type).Where(x => x.IsDeleted == false && x.StatusId == 2);
            var data = result.Select(x => x.Id).ToList();


            foreach (var item in data)
            {
                GetLibur(item);

            }
            return Json(new { data = result });
        }


        public JsonResult GetType()
        {
            var result = _context.TypeTrans.Include(x => x.Unit).Where(x => x.UnitId == 1).ToList();
            return Json(new { data = result });
        }


        public JsonResult GetById(int Id)
        {
            var data = _context.T_Kliring
                .Include(x => x.Cabang)
                .Include(x => x.Bank)
                .Include(x => x.Alasan)
                .Include(x => x.Type)
                .Where(x => x.Type.UnitId == 1).Single(x => x.Id == Id);
            return Json(new { data = data });
        }
        #endregion

        #region Filter
        public IActionResult Filter(DateTime Awal, DateTime Akhir)
        {
            var result = _context.T_Kliring
                .Include(x => x.Bank)
                .Include(x => x.Cabang)
                .Include(x => x.Alasan)
                .Include(x => x.Type)
                .Include(x => x.Keterangan)
                .Include(x => x.Surat)
                .Where(x => x.IsDeleted == false && x.StatusId == 2 && (x.TanggalTRX > Awal.Date.AddDays(-1) && x.TanggalTRX < Akhir.Date)).ToList();
            return Json(new { data = result });
        }


        public IActionResult FilterType(int Id)
        {
            var data = _context.T_Kliring
                        .Include(x => x.Bank)
                        .Include(x => x.Alasan)
                        .Include(x => x.Type)
                        .Include(x => x.Cabang)
                        .Where(x => x.IsDeleted == false && x.StatusId == 1 && x.TypeId == Id)
                        .ToList();
            return Ok(new { data = data });
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

                }
                else
                {
                    ket = data.KeteranganId ?? 0;
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

        public IActionResult SaveSurat(SuratVM data)
        {
            var noReg = _context.T_Kliring.Where(x => x.Id == data.sId).FirstOrDefault();

            var success = false;
            if (data.Id == null)
            {
                if (data.JenisId == 1 || data.JenisId == 2)
                {

                    var surat = new Surat
                    {
                        JenisSuratId = data.JenisId,
                        TujuanSurat = data.TujuanSurat,
                        AsalSurat = data.AsalSurat,
                        Lampiran = data.Lampiran,
                        Perihal = data.Perihal,
                        NomorSurat = data.NomorSurat,
                        Sor = data.Sor,
                    };
                    _context.Surat.Add(surat);
                    _context.SaveChanges();

                    noReg.SuratId = surat.Id;
                    _context.Entry(noReg).State = EntityState.Modified;
                    _context.SaveChanges();
                }
                else
                {
                    var surat = new Surat
                    {
                        JenisSuratId = data.JenisId,
                        TujuanSurat = data.TujuanSurat,
                        Sor = data.Sor,

                    };
                    _context.Surat.Add(surat);
                    _context.SaveChanges();

                    noReg.SuratId = surat.Id;
                    _context.Entry(noReg).State = EntityState.Modified;
                    _context.SaveChanges();
                }

                success = true;
            }
            return Json(success);
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
            //}
            //catch (NullReferenceException e)
            //{
            //   return BadRequest(e.Message);
            //}
        }
        #endregion

        #region Hitung Durasi
        public int GetLibur(int Id)
        {
            var count = 0;
            var data = _context.T_Kliring.Where(x => x.Id == Id).FirstOrDefault();
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
        #endregion

        #region Surat dan Memo
        #region Surat keluar
        public IActionResult TemplateSuratKeluar(int? Id)
        {
            var data = _context.T_Kliring
                .Include(x => x.Type)
                .Include(x => x.Bank)
                .Include(x => x.Alasan)
                .Include(x => x.Cabang)
                .Include(x => x.Keterangan)
                .Include(x => x.Surat)
                .Where(x => x.Id == Id && x.StatusId == 2).FirstOrDefault();
            var TANGGALSEKARANG = DateTime.Now;
            var NOSURAT = data.NomorSurat;
            var KETERANGAN = "";
            if (data.KeteranganId == null)
            {
                KETERANGAN = "-";
            }
            else
            {
                KETERANGAN = data.Keterangan.Nama;
            }
            var TANGGALTRX = data.TanggalTRX;
            var NOMORREFERENSI = data.NoReferensi;
            var NOMINAL = Convert.ToInt64(data.Nominal);
            var NOREK = data.NomorRekening;
            var PENGIRIM = data.Bank.Nama;
            var PENERIMA = data.NamaPenerima;
            var ALASAN = data.Alasan.Nama;
            var KEPADA = data.Surat.TujuanSurat;

            string webRootPath = _webHostEnvironment.WebRootPath;
            string path = Path.Combine(webRootPath, "Template");
            string filename = "SURAT_RETUR_KELUAR1";

            FileStream fileStreamPath = new FileStream(Path.Combine(path, filename + ".docx"), FileMode.Open, FileAccess.Read, FileShare.ReadWrite);
            WordDocument docs = new WordDocument(fileStreamPath, FormatType.Docx);
            docs.Replace("%TANGGALSEKARANG%", TANGGALSEKARANG.ToString("dd MMMM yyyy", new System.Globalization.CultureInfo("id-ID")), false, true);
            docs.Replace("%NOSURAT%", NOSURAT.ToString(), false, true);
            docs.Replace("%KETERANGAN%", KETERANGAN.ToString(), false, true);
            docs.Replace("%TANGGALTRX%", TANGGALTRX.ToString("dd MMMM yyyy", new System.Globalization.CultureInfo("id-ID")), false, true);
            docs.Replace("%NOMOREFERENSI%", NOMORREFERENSI.ToString(), false, true);
            docs.Replace("%NOMINAL%", NOMINAL.ToString(), false, true);
            docs.Replace("%NOREK%", NOREK.ToString(), false, true);
            docs.Replace("%PENGIRIM%", PENGIRIM.ToString(), false, true);
            docs.Replace("%PENERIMA%", PENERIMA.ToString(), false, true);
            docs.Replace("%ALASAN%", ALASAN.ToString(), false, true);
            docs.Replace("%KEPADA%", KEPADA.ToString(), false, true);

            DocIORenderer render = new DocIORenderer();
            MemoryStream stream = new MemoryStream();


            docs.Save(stream, FormatType.Docx);
            stream.Position = 0;

            string contentType = "application/docx";
            string filenamed = "Surat Retur  " + DateTime.Now.ToString("dd MMMM yyyy", new System.Globalization.CultureInfo("id-ID")) + ".docx";
            return File(stream, contentType, filenamed);
            docs.Dispose();
            docs.Close();

        }
        #endregion

        #region Surat Masuk
        public IActionResult TemplateSuratMasuk(int? Id)
        {
            var data = _context.T_Kliring
                .Include(x => x.Type)
                .Include(x => x.Bank)
                .Include(x => x.Alasan)
                .Include(x => x.Cabang)
                .Include(x => x.Keterangan)
                .Where(x => x.Id == Id && x.StatusId == 2).FirstOrDefault();
            var TANGGALSEKARANG = DateTime.Now;
            var NOSURAT = data.NomorSurat;
            var KETERANGAN = "";
            if (data.KeteranganId == null)
            {
                KETERANGAN = "-";
            }
            else
            {
                KETERANGAN = data.Keterangan.Nama;
            }
            var TESTKEY = data.NomorTestkey;
            var TANGGALTRX = data.TanggalTRX;
            var NOMORREFERENSI = data.NoReferensi;
            var NOMINAL = Convert.ToInt64(data.Nominal);
            var NOREK = data.NomorRekening;
            var PENGIRIM = data.Bank.Nama;
            var PENERIMA = data.NamaPenerima;
            var ALASAN = data.Alasan.Nama;

            string webRootPath = _webHostEnvironment.WebRootPath;
            string path = Path.Combine(webRootPath, "Template");
            string filename = "template_surat_masuk";

            FileStream fileStreamPath = new FileStream(Path.Combine(path, filename + ".docx"), FileMode.Open, FileAccess.Read, FileShare.ReadWrite);
            WordDocument docs = new WordDocument(fileStreamPath, FormatType.Docx);
            docs.Replace("%TANGGALSEKARANG%", TANGGALSEKARANG.ToString("dd MMMM yyyy", new System.Globalization.CultureInfo("id-ID")), false, true);
            docs.Replace("%NOSURAT%", NOSURAT.ToString(), false, true);
            docs.Replace("%KETERANGAN%", KETERANGAN.ToString(), false, true);
            docs.Replace("%TANGGALTRX%", TANGGALTRX.ToString("dd MMMM yyyy", new System.Globalization.CultureInfo("id-ID")), false, true);
            docs.Replace("%HARI%", TANGGALTRX.ToString("ddd", new System.Globalization.CultureInfo("id-ID")), false, true);
            docs.Replace("%NOMORREFERENSI%", NOMORREFERENSI.ToString(), false, true);
            docs.Replace("%NOMINAL%", NOMINAL.ToString(), false, true);
            docs.Replace("%NOREK%", NOREK.ToString(), false, true);
            docs.Replace("%PENGIRIM%", PENGIRIM.ToString(), false, true);
            docs.Replace("%PENERIMA%", PENERIMA.ToString(), false, true);
            docs.Replace("%ALASAN%", ALASAN.ToString(), false, true);
            docs.Replace("%TESTKEY%", TESTKEY.ToString(), false, true);


            DocIORenderer render = new DocIORenderer();
            MemoryStream stream = new MemoryStream();


            docs.Save(stream, FormatType.Docx);
            stream.Position = 0;

            string contentType = "application/docx";
            string filenamed = "Surat Retur Masuk " + DateTime.Now.ToString("dd MMMM yyyy", new System.Globalization.CultureInfo("id-ID")) + ".docx";
            return File(stream, contentType, filenamed);
            docs.Dispose();
            docs.Close();

        }
        #endregion

        #region Memo
        public IActionResult MemoMasuk(int? Id)
        {
            var data = _context.T_Kliring
                        .Include(x => x.Bank)
                        .Include(x => x.Cabang)
                        .Include(x => x.Type)
                        .Include(x => x.Keterangan)
                        .Include(x => x.Type)
                        .Include(x => x.Alasan)
                        .Include(x => x.Surat)
                        .Where(x => x.Id == Id && x.StatusId == 2).FirstOrDefault();
            var TanggalSEKARANG = DateTime.Now;
            var NOSURAT = data.NomorSurat;
            var TANGGALTRX = data.TanggalTRX;
            var NOMORREFERENSI = data.NoReferensi;
            var PENERIMA = data.NamaPenerima;
            var PENGIRIM = data.Bank.Nama;
            var NOREK = data.NomorRekening;
            var NOMINAL = data.Nominal;
            var ALASAN = data.Alasan.Nama;
            var KEPADA = data.Surat.TujuanSurat;
            var DARI = data.Surat.AsalSurat;
            var HAL = data.Surat.Perihal;
            var LAMPIRAN = data.Surat.Lampiran;

            string webRootPath = _webHostEnvironment.WebRootPath;
            string path = Path.Combine(webRootPath, "Template");
            string filename = "Memo_Masuk";

            FileStream fileStreamPath = new FileStream(Path.Combine(path, filename + ".docx"), FileMode.Open, FileAccess.Read, FileShare.ReadWrite);
            WordDocument docs = new WordDocument(fileStreamPath, FormatType.Docx);

            docs.Replace("%TanggalSEKARANG%", TanggalSEKARANG.ToString("dd MMM yyyy", new System.Globalization.CultureInfo("id-ID")), false, true);
            docs.Replace("%NOSURAT%", NOSURAT.ToString(), false, true);
            docs.Replace("%TANGGALTRX%", TanggalSEKARANG.ToString("dd MM yyyy", new System.Globalization.CultureInfo("id-ID")), false, true);
            docs.Replace("%NOMORREFERENSI%", NOMORREFERENSI.ToString(), false, true);
            docs.Replace("%PENERIMA%", PENERIMA.ToString(), false, true);
            docs.Replace("%PENGIRIM%", PENGIRIM.ToString(), false, true);
            docs.Replace("%NOREK%", NOREK.ToString(), false, true);
            docs.Replace("%NOMINAL%", NOMINAL.ToString(), false, true);
            docs.Replace("%ALASAN%", ALASAN.ToString(), false, true);
            docs.Replace("%KEPADA%", KEPADA.ToString(), false, true);
            docs.Replace("%DARI%", DARI.ToString(), false, true);
            docs.Replace("%PERIHAL%", HAL.ToString(), false, true);
            docs.Replace("%LAMPIRAN%", LAMPIRAN.ToString(), false, true);

            DocIORenderer render = new DocIORenderer();
            //PdfDocument pdfDoc = render.ConvertToPDF(docs);

            MemoryStream stream = new MemoryStream();

            //pdfDoc.Save(stream);
            docs.Save(stream, FormatType.Docx);
            stream.Position = 0;
            //pdfDoc.Close();
            docs.Close();
            string contentType = "application/docx";
            string filenamed = "Memo Masuk " + DateTime.Now.ToString("dd MMM yyyy", new System.Globalization.CultureInfo("id-ID")) + ".docx";
            return File(stream, contentType, filenamed);
        }
        #endregion
        #endregion


        public JsonResult Delete(int Id)
        {
            bool result = false;
            T_Kliring bank = _context.T_Kliring.Single(x => x.Id == Id);
            if (bank != null)
            {
                bank.IsDeleted = true;
                _context.Entry(bank).State = EntityState.Modified;
                _context.SaveChanges();
                result = true;
            }
            return Json(result);
        }
    }


}