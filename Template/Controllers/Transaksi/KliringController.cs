

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
        //public IActionResult Surat()
        //{
        //    return View();
        //}
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
                .Where(x => x.Type.UnitId == 1).Single(x => x.Id == Id);
            return Json(new { data = data });
        }


        public IActionResult Done(DoneVM data)
        {
            bool success = false;

            if (data.Id != 0)
            {
                var dat = _context.T_Kliring.Where(x => x.Id == data.Id).FirstOrDefault();

                dat.AlasanId = data.AlasanId;
                dat.KeteranganId = data.KeteranganId;
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



        public JsonResult SaveReason(string reason)
        {
            int data = 0;
            var exist = _context.Alasan.Where(x => x.Nama == reason).Count();
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
                var id = _context.Alasan.Single(x => x.Nama == reason).Id;
                data = id;
            }

            return Json(data);
        }

        public JsonResult Delete(int Id)
        {
            bool result = false;
            var kliring = _context.T_Kliring.Single(x => x.Id == Id);
            if (kliring != null)
            {
                kliring.IsDeleted = true;
                _context.Entry(kliring).State = EntityState.Modified;
                _context.SaveChanges();
                result = true;
            }
            return Json(result);
        }

        #endregion

        #region Save Data
        [HttpPost]
        public JsonResult Save(KliringVM data)
        {
            var success = false;
            //var user = GetCurrentUser();

            //#region upload File Lampiran

            if (data.Id == null)
            {
                //#region Tambah Data Testkey
                //var teskey = new Testkey
                //{
                //    NomorTestkey = data.NomorTestKey,
                //    Tanggal = data.TanggalTestKey
                //};
                //_context.Testkey.Add(teskey);
                //_context.SaveChanges();
                //#endregion


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
                    Path = null,
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
                result.Path = null;
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

    }
    #endregion
}