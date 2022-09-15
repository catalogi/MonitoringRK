

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



        public JsonResult SaveAlasan(string alasan)
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
            if (data.Id == null)
            {
                foreach (var item in data.Testkeys)
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
                    path = null,
                    BankId = data.BankId,
                    CabangId = data.CabangId,
                    AlasanId = data.AlasanId,
                    TypeId = data.TypeId,
                    StatusId = 1,
                    Durasi = 0

                };
                _context.T_Kliring.Add(kliring);
                _context.SaveChanges();
                

            }
            else
            {
                foreach (var item in data.Testkeys)
                {
                    var teskey = new Testkey
                    {
                        NomorTestkey = item.NomorTestKey,
                        Tanggal = item.TanggalTestKey,
                    };
                    _context.Entry(teskey).State = EntityState.Modified;
                    _context.SaveChanges();
                }
                var result = _context.T_Kliring.Where(x => x.Id == data.Id).FirstOrDefault();

                result.NomorSurat = data.NomorSurat;
                result.TanggalSurat = data.TanggalSurat;
                result.NoReferensi = data.NoReferensi;
                result.NamaPenerima = data.NamaPenerima;
                result.NomorRekening = data.NomorRekening;
                result.Nominal = data.Nominal;
                result.TanggalTRX = data.TanggalTRX;
                result.NominalSeharusnya = data.NominalSeharusnya;
                //result.path = generateNamaFile;
                result.BankId = data.BankId;
                result.CabangId = data.CabangId;
                result.AlasanId = data.AlasanId;
                result.TypeId = data.TypeId;
                result.Durasi = data.Durasi;

                _context.Entry(result).State = EntityState.Modified;
                _context.SaveChanges();

            }
            return Ok(success);
            #endregion
        }

        //#region compres to upload pdf
        //public IActionResult PdfCompress(IFormFile file, string noRek)
        //{
        //    try
        //    {
        //        var pathFile = "";
        //        if (file != null)
        //        {
        //            if (string.IsNullOrWhiteSpace(_webHostEnvironment.WebRootPath))
        //            {
        //                _webHostEnvironment.WebRootPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot");
        //            }
        //            string wwwPath = this._webHostEnvironment.WebRootPath;
        //            //string wwwPath ="";
        //            string contentPath = this._webHostEnvironment.ContentRootPath;
        //            string path = Path.Combine(wwwPath, "File/Lampiran/");
        //            if (!Directory.Exists(path))
        //            {
        //                Directory.CreateDirectory(path);
        //            }

        //            if (file.FileName.EndsWith("pdf") || file.FileName.EndsWith("PDF"))
        //            {
        //                var ext = Path.GetExtension(file.FileName);
        //                pathFile = noRek + ext;
        //                var fileNames = Path.Combine(path, pathFile);
        //                using (FileStream stream = new FileStream(fileNames, FileMode.Create, FileAccess.Write))
        //                {
        //                    file.CopyTo(stream);
        //                }
        //                FileStream inputDocument = new FileStream(fileNames, FileMode.Open, FileAccess.Read);
        //                PdfLoadedDocument loadedDocument = new PdfLoadedDocument(inputDocument);
        //                PdfCompressionOptions options = new PdfCompressionOptions();
        //                options.CompressImages = true;
        //                options.ImageQuality = 20;
        //                loadedDocument.Compress(options);
        //                //loadedDocument.FileStructure.IncrementalUpdate = false;
        //                //loadedDocument.Compression = PdfCompressionLevel.Normal;
        //                using (MemoryStream outputDocument = new MemoryStream())
        //                {

        //                    loadedDocument.Save(outputDocument);
        //                    loadedDocument.Close(true);
        //                    loadedDocument.Dispose();
        //                    outputDocument.Position = 0;
        //                    using (FileStream stream = new FileStream(fileNames, FileMode.Create, FileAccess.Write))
        //                    {
        //                        outputDocument.CopyTo(stream);
        //                    }

        //                }
        //            }
        //        }
        //        return Ok(pathFile);
        //    }catch(Exception e)
        //    {
        //        return BadRequest(e);
        //    }
        //}
        //#endregion
    }



}


