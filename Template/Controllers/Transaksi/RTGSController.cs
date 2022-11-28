using Ririn.ViewModels;
using DocumentFormat.OpenXml.Office2010.Excel;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Ririn.Data;
using Ririn.Models.Master;
using Ririn.Models.Transaksi;
using Ririn.ViewModels;
using Microsoft.AspNetCore.Authorization;
using OfficeOpenXml.Style;
using OfficeOpenXml;
using System.Drawing;

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
                .Include(x => x.Cabang)
                .Include(x => x.Bank)
                .Include(x => x.Type)
                .Where(x => x.Type.UnitId == 2).Single(x => x.Id == Id);
            return Json(new { data = data });
        }
        #endregion

        #region Save Post
        [HttpPut]
        public JsonResult DoneSaved(DoneRVM data)
        {
            var user = GetCurrentUser();
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
                dat.AcceptorId = user.Id;
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
            var user = GetCurrentUser();
            var success = false;
            var CabId = 0;
            //var user = GetCurrentUSer();
            #region upload File Lampiran
            string generateNameFile = "";
            //string img = ;
            if (data.Path != null)
            {
                if (string.IsNullOrWhiteSpace(_webHostEnvironment.WebRootPath))
                {
                    _webHostEnvironment.WebRootPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot");
                }
                string webRootPath = _webHostEnvironment.WebRootPath;
                string path = Path.Combine(webRootPath, "File", "RTGS");
                generateNameFile = "RTGS" + "_" + data.NomorTestkey + "_" + DateTime.Now.ToString("ddMMyyyy") + "_" + ".png";
                Byte[] bytes = Convert.FromBase64String(data.Path.Replace("data:image/png;base64,", ""));
                Lib.Lib.SaveBase64(bytes, Path.Combine(path, generateNameFile));
            }
            #endregion
            if (data.Id == null)
            {
                
                if (data.CabangId == null)
                {
                    if (data.CabangLain != null)
                    {
                        var newCabang = new Cabang
                        {
                            Nama = data.CabangLain,
                            KodeCabang = data.KodeCabang,
                            Sandi = data.Sandi,
                            Type_DeptId = data.Type_DeptId,
                            isDeleted = false,
                        };
                        _context.Cabang.Add(newCabang);
                        _context.SaveChanges();
                        CabId = newCabang.Id;
                    }
                }
                else
                {
                    CabId = data.CabangId ?? 0;
                }
                var rtgs = new T_RTGS
                {
                    TypeId = data.TypeId,
                    BankId = data.BankId,
                    CabangId = CabId,
                    //KeteranganId = data.KeteranganId,
                    RelTRN = data.RelTRN,
                    TRN = data.TRN,
                    Nominal = data.Nominal,
                    NomorSurat = data.NomorSurat,
                    NomorTestkey = data.NomorTestkey,
                    TanggalProses = data.TanggalProses,
                    Path = generateNameFile,
                    StatusId = 1,
                    Durasi = 0,
                    CreatorId = data.CreatorId
                };
                _context.T_RTGS.Add(rtgs);
                _context.SaveChanges();
                success = true;
            }
            else
            {
                if (data.CabangId == null)
                {
                    if (data.CabangLain != null)
                    {
                        var newCabang = new Cabang
                        {
                            Nama = data.CabangLain,
                            KodeCabang = data.KodeCabang,
                            Sandi = data.Sandi,
                            Type_DeptId = data.Type_DeptId,
                            isDeleted = false,
                        };
                        _context.Cabang.Add(newCabang);
                        _context.SaveChanges();
                        CabId = newCabang.Id;
                    }
                }
                else
                {
                    CabId = data.CabangId ?? 0;
                }

                var result = _context.T_RTGS.Where(x => x.Id == data.Id).FirstOrDefault();
                result.TypeId = data.TypeId;
                result.BankId = data.BankId;
                result.CabangId = CabId;
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

        #region Filter

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
        #endregion

        #region Hitung Durasi
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
        #endregion

        #region Report
        public IActionResult Reports(DateTime start, DateTime end, int? type)
        {
            var datareport = _context.T_RTGS.Include(x => x.Bank).Include(x => x.Keterangan).Include(x => x.Creater).Include(x => x.Type).Include(x => x.Cabang).Include(x => x.Status)
                .Where(x => x.CreateDate >= start.Date && x.CreateDate < end.Date.AddDays(1) && x.TypeId == type);
            var data = datareport.FirstOrDefault();
            var stream = new MemoryStream();
            ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
            var pack = new ExcelPackage();
            var sheetTitle = data.Type.Nama;
            ExcelWorksheet worksheet = pack.Workbook.Worksheets.Add(sheetTitle);

            var cultureInfo = new System.Globalization.CultureInfo("id-ID");
            #region Create Judul
            worksheet.Cells[1, 1].Value = "REGISTER "+data.Type.Nama.ToUpper();
            worksheet.Cells[2, 1].Value = start.ToString("dd MMMM yyyy", new System.Globalization.CultureInfo("id-ID")) + "-" + end.ToString("dd MMMM yyyy", new System.Globalization.CultureInfo("id-ID"));

            #region Style Judul
            worksheet.Cells[1, 1, 1, 13].Merge = true;
            worksheet.Cells[2, 1, 2, 13].Merge = true;
            worksheet.Cells[1, 1, 2, 13].Style.Numberformat.Format = "@";
            worksheet.Cells[1, 1, 2, 13].Style.Font.Size = 15;
            worksheet.Cells[1, 1, 2, 13].Style.Font.Bold = true;
            worksheet.Cells[1, 1, 2, 13].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
            worksheet.Cells[1, 1, 2, 13].Style.VerticalAlignment = ExcelVerticalAlignment.Center;
            #endregion
            #endregion

            #region Table
            #region Create Thead
            worksheet.Cells[4, 1].Value = "NO";
            worksheet.Cells[4, 2].Value = "NO TESTKEY";
            worksheet.Cells[4, 3].Value = "TANGGAL";
            worksheet.Cells[4, 4].Value = "CABANG";
            worksheet.Cells[4, 5].Value = "KODE CABANG";
            worksheet.Cells[4, 6].Value = "NOMOR SURAT";
            worksheet.Cells[4, 7].Value = "REL TRN";
            worksheet.Cells[4, 8].Value = "BANK TUJUAN";
            worksheet.Cells[4, 9].Value = "NOMINAL";
            worksheet.Cells[4, 10].Value = "KETERANGAN";
            worksheet.Cells[4, 11].Value = "TANGGAL PENYELESAIAN";
            worksheet.Cells[4, 12].Value = "FOLLOW UP";
            worksheet.Cells[4, 13].Value = "DURASI (HK)";
          
            #region Style THead
            worksheet.Cells[4, 1, 4, 13].Style.Numberformat.Format = "@";
            worksheet.Cells[4, 1, 4, 13].Style.Font.Size = 12;
            worksheet.Cells[4, 1, 4, 13].Style.Font.Bold = true;
            worksheet.Cells[4, 1, 4, 13].Style.Font.Color.SetColor(System.Drawing.Color.White);
            worksheet.Cells[4, 1, 4, 13].Style.Fill.PatternType = ExcelFillStyle.Solid;
            worksheet.Cells[4, 1, 4, 13].Style.Fill.BackgroundColor.SetColor(ColorTranslator.FromHtml("#31869B"));
            worksheet.Cells[4, 1, 4, 13].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
            worksheet.Cells[4, 1, 4, 13].Style.VerticalAlignment = ExcelVerticalAlignment.Center;
            worksheet.Cells[4, 1, 4, 13].Style.WrapText = true;

            worksheet.Column(1).Width = 5;
            worksheet.Column(2).Width = 20;
            worksheet.Column(3).Width = 20;
            worksheet.Column(4).Width = 20;
            worksheet.Column(5).Width = 20;
            worksheet.Column(6).Width = 25;
            worksheet.Column(7).Width = 17;
            worksheet.Column(8).Width = 30;
            worksheet.Column(9).Width = 17;
            worksheet.Column(10).Width = 30;
            worksheet.Column(11).Width = 17;
            worksheet.Column(12).Width = 17;
            worksheet.Column(13).Width = 17;
           
            #endregion
            #endregion

            var recordIndex = 5;
            #region Create TBody
            var I = 0;
            

            if (datareport.Count() > 0)
            {
                #region Data Tersedia
                foreach (var item in datareport)
                {
                    I += 1;
                    worksheet.Cells[recordIndex, 1].Value = I;
                    worksheet.Cells[recordIndex, 1].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                    worksheet.Cells[recordIndex, 1].Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                    worksheet.Cells[recordIndex, 2].Value = item.NomorTestkey;
                    worksheet.Cells[recordIndex, 3].Value = item.TanggalProses;
                    worksheet.Cells[recordIndex, 3].Style.Numberformat.Format = "[$-421]DD MMMM YYYY";
                    worksheet.Cells[recordIndex, 4].Value = item.Cabang.Nama;
                    worksheet.Cells[recordIndex, 5].Value = item.Cabang.Sandi;
                    worksheet.Cells[recordIndex, 6].Value = item.NomorSurat;
                    worksheet.Cells[recordIndex, 7].Value = item.RelTRN;                 
                    worksheet.Cells[recordIndex, 8].Value = item.Bank.Nama;                 
                    worksheet.Cells[recordIndex, 9].Value = item.Nominal;
                    if (item.KeteranganId == null)
                    {
                        worksheet.Cells[recordIndex, 10].Value = "";
                    }
                    else
                    {
                        worksheet.Cells[recordIndex, 10].Value = item.Keterangan.Nama;
                    }        
                    worksheet.Cells[recordIndex, 11].Value = item.TanggalDone;                 
                    worksheet.Cells[recordIndex, 11].Style.Numberformat.Format = "[$-421]DD MMMM YYYY";
                    if (item.FollowUp != null)
                    {
                        worksheet.Cells[recordIndex, 12].Value = item.FollowUp;
                    }
                    else
                    {
                        worksheet.Cells[recordIndex, 12].Value = "";
                    }
                    worksheet.Cells[recordIndex, 13].Value = item.Durasi + " Hari";
                    worksheet.Cells[recordIndex, 13].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                    worksheet.Cells[recordIndex, 13].Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                   
                    
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
            
            string fileTitle = "Report Return " +data.Type.Nama+ " _ " + DateTime.Now.ToString("dd-MM-yyyy") + ".xls";
            string contentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";

            pack.SaveAs(stream);
            stream.Position = 0;
            return File(stream, contentType, fileTitle);
        }
        #endregion
    }
}