using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.SqlClient;
using System.Data.Entity;
using WebThuVienV2.Models;

namespace WebThuVienV2.Controllers
{
    public class HienThiSanPhamController : Controller
    {
        // GET: HienThiSanPham
        dbWebThuVienEntities db = new dbWebThuVienEntities();
        public ActionResult Index(string sortingOrder, string searchString,  string maLoaiSach = "0")
        {
            ViewBag.CurrentSortOrder = sortingOrder;
            ViewBag.TenLoaiSach = "Tất cả sách";
            var sach = db.Saches.Include(a => a.LoaiSach);
            //Tim kiem theo ma loai sach
            if (maLoaiSach != "0")
            {
                sach = db.Saches.Where(s => s.MaLoaiSach == maLoaiSach);
                switch (maLoaiSach)
                {
                    case "KH":
                        ViewBag.TenLoaiSach = "Khoa học";
                        break;
                    case "KTH":
                        ViewBag.TenLoaiSach = "Kinh tế học";
                        break;
                    case "TL":
                        ViewBag.TenLoaiSach = "Tâm lý";
                        break;
                    case "TT":
                        ViewBag.TenLoaiSach = "Tiểu thuyết";
                        break;
                    case "VH":
                        ViewBag.TenLoaiSach = "Văn học";
                        break;
                }
            }
            //Tim kiem theo ten
            if (!String.IsNullOrEmpty(searchString))
            {
                sach = db.Saches.Where(x => x.TenSach.ToUpper().Contains(searchString.ToUpper())).OrderBy(x => x.TenSach);
                ViewBag.SoLuongSach = "Tìm thấy " + sach.ToList().Count() + " kết quả với từ khóa " + "\"" + searchString + "\"";
            }
            else
                ViewBag.SoLuongSach = "Có tất cả " + sach.ToList().Count() + " kết quả ";
            //Sap xep
            switch (sortingOrder)
            {
                case "dongia":
                    sach = sach.OrderBy(s => s.GiaTien);
                    break;
                case "dongia_desc":
                    sach = sach.OrderByDescending(s => s.GiaTien);
                    break;
                case "ten":
                    sach = sach.OrderBy(s => s.TenSach);
                    break;
                case "ten_desc":
                    sach = sach.OrderByDescending(s => s.TenSach);
                    break;
                default:
                    sach = sach.OrderBy(s => s.TenSach);
                    break;
            }

            return View(sach.ToList());
        }
    }
}