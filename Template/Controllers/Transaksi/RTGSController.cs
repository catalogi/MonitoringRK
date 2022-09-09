using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Ririn.Data;
using Ririn.Models.Master;
using Ririn.ViewModels;

namespace Ririn.Controllers.Transaksi
{
    public class RTGSController : Controller
    {
        private readonly AppDbContext _context;
        public RTGSController(AppDbContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            return View();
        }

        #region Get Data
        public IActionResult GetAll()
        {
            var result = _context.T_RTGS
                .Include(x => x.Bank)
                .Include(x => x.Cabang)
                .Include(x => x.Keterangan)
                .Include(x => x.Testkey)
                .ToList();
            return Ok(new { data = result });
        }
        public JsonResult GetType()
        {
            var result = _context.TypeTrans
                .Include(x => x.Unit).Where(x => x.UnitId == 4).ToList();
            return Json(new { data = result });
        }
        #endregion

        public IActionResult Save(TranshVM data)
        {
            var success = false;
            if (data == null)
            {
                var testkey = new Testkey
                {
                    NomorTestkey = data.NomorTestKey,
                    TanggalTestKey = data.TanggalTestkey,
                    KeteranganId = data.KeteranganId,
                    UnitId = data.UnitId,
                };
                success = true;
            }
            return Ok(success);
        }

    }
}
