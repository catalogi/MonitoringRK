using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using OfficeOpenXml;
using Ririn.Data;
using Ririn.Models.Master;

namespace Ririn.Controllers.Master
{
    [Authorize]
    public class CabangController : Controller
    {
        private readonly AppDbContext _context;
        private readonly IWebHostEnvironment _webHostEnvironment;

        public CabangController(AppDbContext context, IWebHostEnvironment webHostEnvironment)
        {
            _context = context;
            _webHostEnvironment = webHostEnvironment;
        }

        public IActionResult Index()
        {
            return View();
        }
        public JsonResult GetAll()
        {
            var data = _context.Cabang
                .Include(x=>x.Type_Dept)
                .Where(x=>x.isDeleted == false).ToList();
            return Json(new { data = data });
        }
        public JsonResult GetById(int Id)
        {
            var data = _context.Cabang.Include(x=>x.Type_Dept)
                .Single(x => x.Id == Id);
            return Json(new { data = data });
        }

        public JsonResult Save(Cabang cabang)
        {
            if (cabang.Id == 0)
            {
                cabang.isDeleted = false;
                _context.Cabang.Add(cabang);
            }
            else
            {
                var data = _context.Cabang.Where(x => x.Id == cabang.Id).FirstOrDefault();
                data.Nama = cabang.Nama;
                data.KodeCabang = cabang.KodeCabang;
                data.Sandi = cabang.Sandi;
                data.Type_DeptId = cabang.Type_DeptId;
                data.isDeleted = false;
            }
            _context.SaveChanges();

            return Json(cabang);
        }

        //[HttpPost]
        //public IActionResult UploadData(IFormFile files)
        //{
        //    #region Upload
        //    if (files.FileName.EndsWith("xlsx") || files.FileName.EndsWith("xls"))
        //    {
        //        try
        //        {
        //            string webRootPath = _webHostEnvironment.WebRootPath;
        //            string paths = Path.Combine(webRootPath, "file");
        //            string generateNameFile = = files.FileName;
        //            FileStream path = new FileStream(Path.Combine(paths, generateNameFile), FileMode.Create);
        //            files.CopyTo(path);
        //            path.Close();

        //            ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
        //            var namePath = Path.Combine(paths, generateNameFile);
        //            FileInfo existingFile = new FileInfo(namePath);
        //            using (ExcelPackage package = new ExcelPackage(existingFile))
        //            {
        //                ExcelWorksheet worksheet = package.Workbook.Worksheets.FirstOrDefault(f => f.View.SetTabSelected);
        //                if (worksheet != null)
        //                {
        //                    var rowCount = worksheet.Dimension.End.Row;
        //                    string no = worksheet.Cells[1, 1].Text;
        //                    string nama = worksheet.Cells[1, 2].Text;
        //                    string kode = worksheet.Cells[1, 3].Text;
        //                    string sandi = worksheet.Cells[1, 4].Text;
        //                    string kategori = worksheet.Cells[1, 5].Text;

        //                    no = no.Replace(" ", "").ToLower();
        //                    nama = nama.Replace(" ","").ToLower();
        //                    kode = kode.Replace(" ", "").ToLower();
        //                    sandi= sandi.Replace(" ","").ToLower();
        //                    kategori = kategori.Replace(" ","").ToLower();
        //                }
        //            }
        //        }
        //    }
        //    #endregion
        //}

        public JsonResult Delete(int Id)
        {
            bool result = false;
            var data = _context.Cabang.Single(x => x.Id == Id);
            if (data != null)
            {
                data.isDeleted = true;
                _context.Entry(data).State = EntityState.Modified;
                _context.SaveChanges();
                result = true;
            }
            return Json(result);
        }
    }
}
