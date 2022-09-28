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
using DocumentFormat.OpenXml.Office2010.Excel;
using DocumentFormat.OpenXml.Packaging;

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
                .Include(x => x.Type).Where(x => x.IsDeleted == false && x.StatusId == 1).ToList();
            return Json(new { data = result });
        }

        public JsonResult GetMonitoring()
        {
            var result = _context.T_Kliring
                .Include(x => x.Keterangan)
                .Include(x => x.Alasan)
                .Include(x => x.Bank)
                .Include(x => x.Cabang)
                .Include(x => x.Type).Where(x => x.IsDeleted == false && x.StatusId == 2).ToList();
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

        public IActionResult TemplateSuratKeluar(int Id)
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
            var KETERANGAN="";
            if (data.KeteranganId == null)
            {
                 KETERANGAN = "-";
            }
            else
            {
                 KETERANGAN = data.Keterangan.Nama;
            }
            var TANGGALTRX = data.TanggalTRX;
            var NOMOREFERENSI = data.NoReferensi;
            var NOMINAL = Convert.ToInt64(data.Nominal);
            var NOREK = data.NomorRekening;
            var PENGIRIM = data.Bank.Nama;
            var PENERIMA = data.NamaPenerima;
            var ALASAN = data.Alasan.Nama;

            string webRootPath = _webHostEnvironment.WebRootPath;
            string path = Path.Combine(webRootPath, "Template");
            string filename = "SURAT_RETUR_Keluar";

            //FileStream fileStreamPath = new FileStream(Path.Combine(path, filename), FileMode.Open, FileAccess.Read, FileShare.ReadWrite);
            //WordDocument docs = new WordDocument(fileStreamPath, FormatType.Docx);
            FileStream fileStreamPath = new FileStream(Path.Combine(path, filename + ".docx"), FileMode.Open, FileAccess.Read, FileShare.ReadWrite);
            WordDocument docs = new WordDocument(fileStreamPath, FormatType.Docx);
            docs.Replace("%TANGGALSEKARANG%", TANGGALSEKARANG.ToString("dd MMMM yyyy", new System.Globalization.CultureInfo("id-ID")), false, true);
            docs.Replace("%NOSURAT%", NOSURAT.ToString(), false, true);
            //if (data.KeteranganId == null)
            //{
            //    docs.Replace("-", KETERANGAN.ToString(), false, true);
            //}
            //else
            //{
                docs.Replace("%KETERANGAN%", KETERANGAN.ToString(), false, true);
            //}
            docs.Replace("%TANGGALTRX%", TANGGALTRX.ToString("dd MMMM yyyy", new System.Globalization.CultureInfo("id-ID")), false, true);
            docs.Replace("%NOMOREFERENSI%", NOMOREFERENSI.ToString(), false, true);
            docs.Replace("%NOMINAL%", NOMINAL.ToString(), false, true);
            docs.Replace("%NOREK%", NOREK.ToString(), false, true);
            docs.Replace("%PENGIRIM%", PENGIRIM.ToString(), false, true);
            docs.Replace("%PENERIMA%", PENERIMA.ToString(), false, true);
            docs.Replace("%ALASAN%", ALASAN.ToString(), false, true);

            DocIORenderer render = new DocIORenderer();
            //PdfDocument pdfdoc = render.ConvertToPDF(docs);

            MemoryStream stream = new MemoryStream();

            docs.Save(stream, FormatType.Docx);
            stream.Position = 0;


            string contentType = "application/docx";
            string filenamed = "Surat Retur " + DateTime.Now.ToString("dd MMMM yyyy", new System.Globalization.CultureInfo("id-ID")) + ".docx";
            return File(stream, contentType, filenamed);
            docs.Dispose();
            docs.Close();
        }

        public IActionResult MemoKeluar(int Id)
        {
            var data = _context.T_Kliring
                        .Include(x => x.Bank)
                        .Include(x => x.Cabang)
                        .Include(x => x.Type)
                        .Include(x => x.Keterangan)
                        .Include(x => x.Type)
                        .Include(x => x.Alasan)
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

            string webRootPath = _webHostEnvironment.WebRootPath;
            string path = Path.Combine(webRootPath, "Template");
            string filename = "Memo_Keluar";

            FileStream fileStreamPath = new FileStream(Path.Combine(path,filename + ".docx"), FileMode.Open, FileAccess.Read, FileShare.ReadWrite);
            WordDocument docs = new WordDocument(fileStreamPath, FormatType.Docx);

            docs.Replace("%TanggalSEKARANG%", TanggalSEKARANG.ToString("dd MMM yyyy", new System.Globalization.CultureInfo("id-ID")), false, true );
            docs.Replace("%NOSURAT%", NOSURAT.ToString(), false, true );
            docs.Replace("%TANGGALTRX%", TanggalSEKARANG.ToString("dd MM yyyy", new System.Globalization.CultureInfo("id-ID")), false, true );
            docs.Replace("%NOMORREFERENSI%", NOMORREFERENSI.ToString(), false, true );
            docs.Replace("%PENERIMA%", PENERIMA.ToString(), false, true );
            docs.Replace("%PENGIRIM%", PENGIRIM.ToString(), false, true );
            docs.Replace("%NOREK%", NOREK.ToString(), false, true );
            docs.Replace("%NOMINAL%", NOMINAL.ToString(), false, true );
            docs.Replace("%ALASAN%", ALASAN.ToString(), false, true);

            DocIORenderer render = new DocIORenderer();
            //PdfDocument pdfDoc = render.ConvertToPDF(docs);

            MemoryStream stream = new MemoryStream();

            //pdfDoc.Save(stream);
            docs.Save(stream, FormatType.Docx);
            stream.Position = 0;
            //pdfDoc.Close();
            docs.Close();
            string contentType = "application/docx";
            string filenamed = "Memo Keluar " + DateTime.Now.ToString("dd MMM yyyy", new System.Globalization.CultureInfo("id-ID")) + ".docx";
            return File(stream, contentType, filenamed);
        }

        public IActionResult Filter(DateTime Awal, DateTime Akhir)
        {
            var filter = _context.T_Kliring
                .Include(x => x.Type)
                .Include(x => x.Bank)
                .Include(x => x.Cabang)
                .Include(x => x.Alasan)
                .Include(x => x.Keterangan)
                .Where(x => x.IsDeleted == false && x.StatusId == 2 && (x.CreateDate > Awal.Date.AddDays(-1) && x.CreateDate < Akhir.Date))
                .ToList();
            return Ok(new { data = filter });
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

        #region
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

        //public IActionResult Surat(int Id)
        //{
        //    var data = _context.T_Kliring
        //        .Include(x => x.Type)
        //        .Include(x => x.Alasan)
        //        .Include(x => x.Bank)
        //        .Include(x => x.Keterangan)
        //        .Where(x => x.Id == Id).FirstOrDefault();
        //    return View();
        //}



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
            string generateNameFile = "Kliring" + "_" + data.NomorTestKey + "_" + DateTime.Now.ToString("ddMMyyyy") + "_" + data.Path.FileName;
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

    }

}