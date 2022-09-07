﻿using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Ririn.Data;
using Ririn.Models.Master;

namespace Ririn.Controllers.Master
{
    public class CabangController : Controller
    {
        private readonly AppDbContext _context;

        public CabangController(AppDbContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            return View();
        }
        public JsonResult GetAll()
        {
            var data = _context.Cabang
                .Where(x=>x.isDeleted == false).ToList();
            return Json(new { data = data });
        }
        public JsonResult GetById(int Id)
        {
            var data = _context.Cabang.Single(x => x.Id == Id);
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
                var data = _context.Cabang.Where(x=>x.Id == cabang.Id).FirstOrDefault();
                data.Nama = cabang.Nama;
                data.KodeCabang = cabang.KodeCabang;
                data.Sandi = cabang.Sandi;
                data.isDeleted = false;
            }
            _context.SaveChanges();

            return Json(cabang);
        }
        public JsonResult Delete(int Id)
        {
            bool result = false;
            var data = _context.Cabang.Single(x=>x.Id==Id);
            if (data != null)
            {
                data.isDeleted=true;
                _context.Entry(data).State = EntityState.Modified;
                _context.SaveChanges();
                result = true;
            }
            return Json(result);
        }
    }
}
