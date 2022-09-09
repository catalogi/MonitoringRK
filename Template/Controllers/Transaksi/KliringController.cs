﻿using Microsoft.AspNetCore.Mvc;
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
        public KliringController (AppDbContext context)
        {
            _context = context;
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
                .Include(x=>x.Alasan)
                .Include(x=>x.Testkey)
                .Include(x=>x.Bank)
                .Include(x=>x.Cabang).ToList();
            return Ok(new { data = result });
        }

        public JsonResult GetType()
        {
            var result = _context.TypeTrans
                .Include(x => x.Unit).Where(x => x.UnitId == 3).ToList();
            return Json(new { data = result });
        }
        #endregion
        //[HttpPost]
        //public Task<JsonResult> Save(TranshVM data)
        //{
        //    var success = false;
        //    try
        //    {
        //        if (data.Id == null)
        //        {

        //            var teskey = new Testkey
        //            {
        //                NomorTestkey = data.NomorTe
        //            }
        //            var kliring = new T_Kliring
        //            {
        //                TypeId = data.TypeId,
        //                BankId = data.BankId,
        //                CabangId = data.CabangId,
        //                TestkeyId = data.TestKeyId,
        //                TanggalSurat = data.TanggalSurat,
        //                TanggalTRX = data.TanggalTRX,
        //                NomorRekening = data.NomorRekening,




        //            }
        //            success = true;
        //        }
        //    }
        //    catch
        //    {

        //    }
        //}

    }
}
