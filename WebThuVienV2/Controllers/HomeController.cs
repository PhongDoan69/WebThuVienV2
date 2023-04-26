using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using WebThuVienV2.Models;

namespace WebThuVienV2.Controllers
{
    public class HomeController : Controller
    {
        dbWebThuVienEntities db = new dbWebThuVienEntities();
        public ActionResult Index()
        {
            var sach = db.Saches.Include(s => s.LoaiSach);
            return View(sach);  
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}