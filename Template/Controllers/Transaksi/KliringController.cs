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

        public  JsonResult GetType()
        {
            var result = _context.TypeTrans
                .Include(x => x.Unit).Where(x => x.UnitId == 1).ToList();
            return Json(new { data = result });
        }

        //public JsonResult Save(Models.Transaksi.T_Kliring data)
        //{

        //    bool status = false;
        //    if (data.Id == 0)
        //    {
        //        data.Createdate = DateTime.Now;
        //        data.path = data.path;
        //        data.TanggalDone = data.Createdate;
        //        //data.isDone = false;
        //        data.KeteranganId = 1;
        //        _context.T_Kliring.Add(data);
        //        _context.SaveChanges();
        //        var MrkId = data.Id;
        //        var tk = new Testkey();
        //        tk.KeteranganId = MrkId;
        //        tk.NomorTestkey = data.Testkey.NomorTestkey;
        //        tk.Tanggal = data.TanggalDone.Value;
        //        _context.Testkey.Add(tk);
        //        status = true;
        //    }
        //    else
        //    {
        //        var dataDb = _context.T_Kliring.Single(x => x.Id == data.Id);
        //        dataDb.NamaPenerima = data.NamaPenerima;
        //        dataDb.NomorRekening = data.NomorRekening;
        //        dataDb.AlasanId = data.AlasanId;
        //        dataDb.TanggalSurat = data.TanggalSurat;
        //        dataDb.BankId = data.BankId;
        //        dataDb.CabangId = data.CabangId;
        //        dataDb.TypeId = data.TypeId;
        //        dataDb.NomorSurat = data.NomorSurat;
        //        dataDb.Nominal = data.Nominal;
        //        dataDb.TanggalTRX = data.TanggalTRX;
        //        status = true;
        //    }
        //    _context.SaveChanges();
        //    return Json(status);
        //}

        public JsonResult Save(T_Kliring t_Kliring)
        {
            if (t_Kliring.Id == 0)
            {

                _context.T_Kliring.Add(t_Kliring);
            }
            else
            {
                var data = _context.T_Kliring.Where(x => x.Id == t_Kliring.Id).FirstOrDefault();
                data.TypeId = t_Kliring.TypeId;
                data.TanggalTRX = t_Kliring.TanggalTRX;
                data.NoReferensi = t_Kliring.NoReferensi;
                data.CabangId = t_Kliring.CabangId;
                data.TanggalSurat = t_Kliring.TanggalSurat;
                data.Testkey = t_Kliring.Testkey;
                data.NomorSurat = t_Kliring.NomorSurat;
                data.Testkey.NomorTestkey = t_Kliring.Testkey.NomorTestkey;
                data.NamaPenerima = t_Kliring.NamaPenerima;
                data.NomorRekening = t_Kliring.NomorRekening;
                data.Nominal = t_Kliring.Nominal;
                data.NominalSeharusnya = t_Kliring.NominalSeharusnya;
                data.BankId = t_Kliring.BankId;
                data.AlasanId = t_Kliring.AlasanId;
                data.IsDeleted = false;
                data.Updatedate = DateTime.Now;
                _context.Entry(data).State = EntityState.Modified;
            }
            _context.SaveChanges();

            return Json(t_Kliring);
        }

        public JsonResult SaveReason(string reason)
        {
            int data = 0;
            var exist = _context.Alasan.Where(x => x.Nama== reason).Count();
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
                var id = _context.Alasan.Single(x => x.Nama== reason).Id;
                data = id;
            }

            return Json(data);
        }

        //public DateTime AddDays(DateTime date, int count)
        //{
        //    DateTime dateTime = date.Date.AddDays(count);
        //    if (IsHoliday(dateTime) || IsWeekEnd(dateTime))
        //    {
        //        do
        //        {
        //            dateTime = dateTime.AddDays(1);
        //        } while (IsHoliday(dateTime) || IsWeekEnd(dateTime));
        //    }
        //    return dateTime;
        //}

        //private bool IsHoliday(DateTime date)
        //{
        //    return _context.Holidays.Select(x => x.Date).Contains(date);
        //}

        //private bool IsWeekEnd(DateTime date)
        //{
        //    return date.DayOfWeek == DayOfWeek.Saturday
        //        || date.DayOfWeek == DayOfWeek.Sunday;
        //}
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
