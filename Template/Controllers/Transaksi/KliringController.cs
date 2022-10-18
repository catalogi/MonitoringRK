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
using DocumentFormat.OpenXml.Spreadsheet;
using System.Drawing;
using Color = System.Drawing.Color;
using Microsoft.AspNet.Identity;
using System.Data.Entity.Core.Common.CommandTrees.ExpressionBuilder;

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

        public User GetCurrentUser()
        {
            var user = _context.User
                        .Where(x => x.UserName == User.Identity!.Name)
                        .FirstOrDefault();
            return user!;
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
            var user = GetCurrentUser();

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
                dat.AcceptorId = user.Id;
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
            var user = GetCurrentUser();

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
                    Durasi = 0,
                    CreaterId = user.Id

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

        #region Report
        #region Report Masuk
        public IActionResult ReportMasuk(DateTime start, DateTime end, int? type)
        {
            var stream = new MemoryStream();
            ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
            var pack = new ExcelPackage();
            var sheetTitle = "Kliring Masuk";
            ExcelWorksheet worksheet = pack.Workbook.Worksheets.Add(sheetTitle);

            var cultureInfo = new System.Globalization.CultureInfo("id-ID");
            #region Create Judul
            worksheet.Cells[1, 1].Value = "REGISTER SURAT RETURN MASUK";
            worksheet.Cells[2, 1].Value = start.ToString("dd MMMM yyyy", new System.Globalization.CultureInfo("id-ID")) + "-" + end.ToString("dd MMMM yyyy", new System.Globalization.CultureInfo("id-ID"));

            #region Style Judul
            worksheet.Cells[1, 1, 1, 20].Merge = true;
            worksheet.Cells[2, 1, 2, 20].Merge = true;
            worksheet.Cells[1, 1, 2, 20].Style.Numberformat.Format = "@";
            worksheet.Cells[1, 1, 2, 20].Style.Font.Size = 15;
            worksheet.Cells[1, 1, 2, 20].Style.Font.Bold = true;
            worksheet.Cells[1, 1, 2, 20].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
            worksheet.Cells[1, 1, 2, 20].Style.VerticalAlignment = ExcelVerticalAlignment.Center;
            #endregion
            #endregion

            #region Table
            #region Create Thead
            worksheet.Cells[4, 1].Value = "NO";
            worksheet.Cells[4, 2].Value = "TANGGAL SURAT";
            worksheet.Cells[4, 3].Value = "BANK";
            worksheet.Cells[4, 4].Value = "TGL TRX";
            worksheet.Cells[4, 5].Value = "NOMINAL";
            worksheet.Cells[4, 6].Value = "NO.REKENING";
            worksheet.Cells[4, 7].Value = "NASABAH PENERIMA";
            worksheet.Cells[4, 8].Value = "ALASAN";
            worksheet.Cells[4, 9].Value = "CABANG";
            worksheet.Cells[4, 10].Value = "KODE CABANG";
            worksheet.Cells[4, 11].Value = "NO.TESTKEY 1";
            worksheet.Cells[4, 12].Value = "TANGGAL TESTKEY 1";
            worksheet.Cells[4, 13].Value = "NO TESTKEY 2 (BILATERAL)";
            worksheet.Cells[4, 14].Value = "TANGGAL TESTKEY 2 (BILATERAL)";
            worksheet.Cells[4, 15].Value = "TANGGAL SELESAI";
            worksheet.Cells[4, 16].Value = "WAKTU PENYELESAIAN";
            worksheet.Cells[4, 17].Value = "SUDAH SELESAI";
            worksheet.Cells[4, 18].Value = "BELUM SELESAI";
            worksheet.Cells[4, 19].Value = "KETERANGAN";
            worksheet.Cells[4, 20].Value = "PIC YANG MEMBUAT";
            #region Style THead
            worksheet.Cells[4, 1, 4, 20].Style.Numberformat.Format = "@";
            worksheet.Cells[4, 1, 4, 20].Style.Font.Size = 12;
            worksheet.Cells[4, 1, 4, 20].Style.Font.Bold = true;
            worksheet.Cells[4, 1, 4, 20].Style.Font.Color.SetColor(Color.White);
            worksheet.Cells[4, 1, 4, 20].Style.Fill.PatternType = ExcelFillStyle.Solid;
            worksheet.Cells[4, 1, 4, 20].Style.Fill.BackgroundColor.SetColor(ColorTranslator.FromHtml("#31869B"));
            worksheet.Cells[4, 1, 4, 20].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
            worksheet.Cells[4, 1, 4, 20].Style.VerticalAlignment = ExcelVerticalAlignment.Center;
            worksheet.Cells[4, 1, 4, 20].Style.WrapText = true;

            worksheet.Column(1).Width = 5;
            worksheet.Column(2).Width = 20;
            worksheet.Column(3).Width = 30;
            worksheet.Column(4).Width = 20;
            worksheet.Column(5).Width = 20;
            worksheet.Column(6).Width = 18;
            worksheet.Column(7).Width = 25;
            worksheet.Column(8).Width = 17;
            worksheet.Column(9).Width = 17;
            worksheet.Column(10).Width = 17;
            worksheet.Column(11).Width = 17;
            worksheet.Column(12).Width = 17;
            worksheet.Column(13).Width = 17;
            worksheet.Column(14).Width = 22;
            worksheet.Column(15).Width = 17;
            worksheet.Column(16).Width = 17;
            worksheet.Column(17).Width = 10;
            worksheet.Column(18).Width = 10;
            worksheet.Column(19).Width = 37;
            worksheet.Column(20).Width = 17;
            #endregion
            #endregion

            var recordIndex = 5;
            #region Create TBody
            var I = 0;
            var datareport = _context.T_Kliring.Include(x => x.Bank).Include(x => x.Alasan).Include(x => x.Keterangan).Include(x => x.Creater).Include(x => x.Type).Include(x => x.Cabang).Include(x => x.Status)
                .Where(x => x.CreateDate >= start.Date && x.CreateDate < end.Date.AddDays(1) && x.TypeId == type);

            if (datareport.Count() > 0)
            {
                #region Data Tersedia
                foreach (var item in datareport)
                {
                    I += 1;
                    worksheet.Cells[recordIndex, 1].Value = I;
                    worksheet.Cells[recordIndex, 2].Value = item.TanggalSurat;
                    worksheet.Cells[recordIndex, 2].Style.Numberformat.Format = "[$-421]DD MMMM YYYY";
                    worksheet.Cells[recordIndex, 3].Value = item.Bank.Nama;
                    worksheet.Cells[recordIndex, 4].Value = item.TanggalTRX;
                    worksheet.Cells[recordIndex, 4].Style.Numberformat.Format = "[$-421]DD MMMM YYYY";
                    worksheet.Cells[recordIndex, 5].Value = item.Nominal;
                    worksheet.Cells[recordIndex, 6].Value = item.NomorRekening;
                    worksheet.Cells[recordIndex, 7].Value = item.NamaPenerima;
                    worksheet.Cells[recordIndex, 8].Value = item.Alasan.Nama;
                    worksheet.Cells[recordIndex, 9].Value = item.Cabang.Nama;
                    worksheet.Cells[recordIndex, 10].Value = item.Cabang.Sandi;
                    if (item.KeteranganId == 2)
                    {
                        worksheet.Cells[recordIndex, 11].Value = "";
                        worksheet.Cells[recordIndex, 12].Value = "";
                        worksheet.Cells[recordIndex, 13].Value = item.NomorTestkey;
                        worksheet.Cells[recordIndex, 13].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                        worksheet.Cells[recordIndex, 13].Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                        worksheet.Cells[recordIndex, 14].Value = item.TanggalTestkey;
                        worksheet.Cells[recordIndex, 14].Style.Numberformat.Format = "[$-421]DD MMMM YYYY";
                    }
                    else
                    {
                        worksheet.Cells[recordIndex, 11].Value = item.NomorTestkey;
                        worksheet.Cells[recordIndex, 11].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                        worksheet.Cells[recordIndex, 11].Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                        worksheet.Cells[recordIndex, 12].Value = item.TanggalTestkey;
                        worksheet.Cells[recordIndex, 12].Style.Numberformat.Format = "[$-421]DD MMMM YYYY";
                        worksheet.Cells[recordIndex, 13].Value = "";
                        worksheet.Cells[recordIndex, 14].Value = "";
                    }
                    worksheet.Cells[recordIndex, 15].Value = item.TanggalDone;
                    worksheet.Cells[recordIndex, 15].Style.Numberformat.Format = "[$-421]DD MMMM YYYY";
                    worksheet.Cells[recordIndex, 16].Value = item.Durasi + " Hari";
                    worksheet.Cells[recordIndex, 16].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                    worksheet.Cells[recordIndex, 16].Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                    if (item.TanggalDone != null)
                    {
                        worksheet.Cells[recordIndex, 17].Value = "V";
                        worksheet.Cells[recordIndex, 17].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                        worksheet.Cells[recordIndex, 17].Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                    }
                    else
                    {
                        worksheet.Cells[recordIndex, 18].Value = "V";
                        worksheet.Cells[recordIndex, 18].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                        worksheet.Cells[recordIndex, 18].Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                    }
                    if (item.KeteranganId != null)
                    {
                        worksheet.Cells[recordIndex, 19].Value = item.Keterangan.Nama;
                    }
                    else
                    {
                        worksheet.Cells[recordIndex, 19].Value = "";
                    }
                    if (item.CreaterId != null)
                    {
                        worksheet.Cells[recordIndex, 20].Value = item.Creater.Nama;
                    }
                    else
                    {
                        worksheet.Cells[recordIndex, 20].Value = "";
                    }
                    recordIndex++;
                }
                #endregion
            }
            else
            {
                worksheet.Cells[recordIndex, 1].Value = "Data tidak tersedia";
                worksheet.Cells[recordIndex, 1].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                worksheet.Cells[recordIndex, 1].Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                worksheet.Cells[recordIndex, 1, recordIndex + 1, 20].Merge = true;

                worksheet.Cells[recordIndex, 1, recordIndex + 1, 20].Style.Border.Top.Style = ExcelBorderStyle.Thin;
                worksheet.Cells[recordIndex, 1, recordIndex + 1, 20].Style.Border.Right.Style = ExcelBorderStyle.Thin;
                worksheet.Cells[recordIndex, 1, recordIndex + 1, 20].Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
                worksheet.Cells[recordIndex, 1, recordIndex + 1, 20].Style.Border.Left.Style = ExcelBorderStyle.Thin;
            }
            #endregion
            #endregion

            string fileTitle = "Report Return Kliring Masuk - " + DateTime.Now.ToString("dd-MM-yyyy") + ".xls";
            string contentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";

            pack.SaveAs(stream);
            stream.Position = 0;
            return File(stream, contentType, fileTitle);
        }
        #endregion

        #region Report Keluar
        public IActionResult ReportKeluar(DateTime start, DateTime end, int? type)
        {
            var stream = new MemoryStream();
            ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
            var pack = new ExcelPackage();
            var sheetTitle = "Kliring Keluar";
            ExcelWorksheet worksheet = pack.Workbook.Worksheets.Add(sheetTitle);

            var cultureInfo = new System.Globalization.CultureInfo("id-ID");
            #region Create Judul
            worksheet.Cells[1, 1].Value = "REGISTER SURAT RETURN KELUAR";
            worksheet.Cells[2, 1].Value = start.ToString("dd MMMM yyyy", new System.Globalization.CultureInfo("id-ID")) + "-" + end.ToString("dd MMMM yyyy", new System.Globalization.CultureInfo("id-ID"));

            #region Style Judul
            worksheet.Cells[1, 1, 1, 19].Merge = true;
            worksheet.Cells[2, 1, 2, 19].Merge = true;
            worksheet.Cells[1, 1, 2, 19].Style.Numberformat.Format = "@";
            worksheet.Cells[1, 1, 2, 19].Style.Font.Size = 15;
            worksheet.Cells[1, 1, 2, 19].Style.Font.Bold = true;
            worksheet.Cells[1, 1, 2, 19].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
            worksheet.Cells[1, 1, 2, 19].Style.VerticalAlignment = ExcelVerticalAlignment.Center;
            #endregion
            #endregion

            #region Table
            #region Create Thead
            worksheet.Cells[4, 1].Value = "NO";
            worksheet.Cells[4, 2].Value = "TANGGAL TRX";
            worksheet.Cells[4, 3].Value = "CABANG";
            worksheet.Cells[4, 4].Value = "NO TESTKEY";
            worksheet.Cells[4, 5].Value = "NOMOR REFERENSI";
            worksheet.Cells[4, 6].Value = "NO.REKENING PENERIMA";
            worksheet.Cells[4, 7].Value = "NAMA PENERIMA";
            worksheet.Cells[4, 8].Value = "NOMINAL";
            worksheet.Cells[4, 9].Value = "BANK TUJUAN";
            worksheet.Cells[4, 10].Value = "ALASAN";
            worksheet.Cells[4, 11].Value = "NOMOR SURAT";
            worksheet.Cells[4, 12].Value = "TANGGAL SURAT";
            worksheet.Cells[4, 13].Value = "TANGGAL SELESAI";
            worksheet.Cells[4, 14].Value = "WAKTU PENYELESAIAN (HK)";
            worksheet.Cells[4, 15].Value = "SUDAH SELESAI";
            worksheet.Cells[4, 16].Value = "BELUM SELESAI";
            worksheet.Cells[4, 17].Value = "KETERANGAN";
            worksheet.Cells[4, 18].Value = "PIC YANG MEMBUAT";
            worksheet.Cells[4, 19].Value = "TANGGAL TERAKHIR CEK DI STPKL";
            //worksheet.Cells[4, 20].Value = "PIC YANG MEMBUAT";
            #region Style THead
            worksheet.Cells[4, 1, 4, 19].Style.Numberformat.Format = "@";
            worksheet.Cells[4, 1, 4, 19].Style.Font.Size = 12;
            worksheet.Cells[4, 1, 4, 19].Style.Font.Bold = true;
            worksheet.Cells[4, 1, 4, 19].Style.Font.Color.SetColor(Color.White);
            worksheet.Cells[4, 1, 4, 19].Style.Fill.PatternType = ExcelFillStyle.Solid;
            worksheet.Cells[4, 1, 4, 19].Style.Fill.BackgroundColor.SetColor(ColorTranslator.FromHtml("#31869B"));
            worksheet.Cells[4, 1, 4, 19].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
            worksheet.Cells[4, 1, 4, 19].Style.VerticalAlignment = ExcelVerticalAlignment.Center;
            worksheet.Cells[4, 1, 4, 19].Style.WrapText = true;

            worksheet.Column(1).Width = 5;
            worksheet.Column(2).Width = 20;
            worksheet.Column(3).Width = 20;
            worksheet.Column(4).Width = 20;
            worksheet.Column(5).Width = 20;
            worksheet.Column(6).Width = 25;
            worksheet.Column(7).Width = 20;
            worksheet.Column(8).Width = 17;
            worksheet.Column(9).Width = 37;
            worksheet.Column(10).Width = 20;
            worksheet.Column(11).Width = 17;
            worksheet.Column(12).Width = 20;
            worksheet.Column(13).Width = 20;
            worksheet.Column(14).Width = 22;
            worksheet.Column(15).Width = 17;
            worksheet.Column(16).Width = 17;
            worksheet.Column(17).Width = 30;
            worksheet.Column(18).Width = 17;
            worksheet.Column(19).Width = 20;
            //worksheet.Column(20).Width = 20;
            #endregion
            #endregion

            var recordIndex = 5;
            #region Create TBody
            var I = 0;
            var datareport = _context.T_Kliring.Include(x => x.Bank).Include(x => x.Alasan).Include(x => x.Keterangan).Include(x => x.Creater).Include(x => x.Type).Include(x => x.Cabang).Include(x => x.Status)
                .Where(x => x.CreateDate >= start.Date && x.CreateDate < end.Date.AddDays(1) && x.TypeId == type);

            if (datareport.Count() > 0)
            {
                #region Data Tersedia
                foreach (var item in datareport)
                {
                    I += 1;
                    worksheet.Cells[recordIndex, 1].Value = I;
                    worksheet.Cells[recordIndex, 2].Value = item.TanggalTRX;
                    worksheet.Cells[recordIndex, 2].Style.Numberformat.Format = "[$-421]DD MMMM YYYY";
                    worksheet.Cells[recordIndex, 3].Value = item.Cabang.Nama;
                    worksheet.Cells[recordIndex, 4].Value = item.NomorTestkey;
                    worksheet.Cells[recordIndex, 5].Value = item.NoReferensi;
                    worksheet.Cells[recordIndex, 6].Value = item.NomorRekening;
                    worksheet.Cells[recordIndex, 7].Value = item.NamaPenerima;
                    worksheet.Cells[recordIndex, 8].Value = item.Nominal;
                    worksheet.Cells[recordIndex, 9].Value = item.Bank.Nama;
                    worksheet.Cells[recordIndex, 10].Value = item.Alasan.Nama;
                    worksheet.Cells[recordIndex, 11].Value = item.NomorSurat;

                    worksheet.Cells[recordIndex, 12].Value = item.TanggalSurat;
                    worksheet.Cells[recordIndex, 12].Style.Numberformat.Format = "[$-421]DD MMMM YYYY";
                    worksheet.Cells[recordIndex, 13].Value = item.TanggalDone;
                    worksheet.Cells[recordIndex, 13].Style.Numberformat.Format = "[$-421]DD MMMM YYYY";
                    worksheet.Cells[recordIndex, 14].Value = item.Durasi + " Hari";
                    worksheet.Cells[recordIndex, 14].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                    worksheet.Cells[recordIndex, 14].Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                    if (item.TanggalDone != null)
                    {
                        worksheet.Cells[recordIndex, 15].Value = "V";
                        worksheet.Cells[recordIndex, 15].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                        worksheet.Cells[recordIndex, 15].Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                    }
                    else
                    {
                        worksheet.Cells[recordIndex, 16].Value = "V";
                        worksheet.Cells[recordIndex, 16].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                        worksheet.Cells[recordIndex, 16].Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                    }
                    if (item.KeteranganId != null)
                    {
                        worksheet.Cells[recordIndex, 17].Value = item.Keterangan.Nama;
                    }
                    else
                    {
                        worksheet.Cells[recordIndex, 17].Value = "";
                    }
                    if (item.CreaterId != null)
                    {
                        worksheet.Cells[recordIndex, 18].Value = item.Creater.Nama;
                    }
                    else
                    {
                        worksheet.Cells[recordIndex, 18].Value = "";
                    }
                    worksheet.Cells[recordIndex, 19].Value = "";
                    recordIndex++;
                }
                #endregion
            }
            else
            {
                worksheet.Cells[recordIndex, 1].Value = "Data tidak tersedia";
                worksheet.Cells[recordIndex, 1].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                worksheet.Cells[recordIndex, 1].Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                worksheet.Cells[recordIndex, 1, recordIndex + 1, 19].Merge = true;

                worksheet.Cells[recordIndex, 1, recordIndex + 1, 19].Style.Border.Top.Style = ExcelBorderStyle.Thin;
                worksheet.Cells[recordIndex, 1, recordIndex + 1, 19].Style.Border.Right.Style = ExcelBorderStyle.Thin;
                worksheet.Cells[recordIndex, 1, recordIndex + 1, 19].Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
                worksheet.Cells[recordIndex, 1, recordIndex + 1, 19].Style.Border.Left.Style = ExcelBorderStyle.Thin;
            }
            #endregion
            #endregion

            string fileTitle = "Report Return Kliring keluar - " + DateTime.Now.ToString("dd-MM-yyyy") + ".xls";
            string contentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";

            pack.SaveAs(stream);
            stream.Position = 0;
            return File(stream, contentType, fileTitle);
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