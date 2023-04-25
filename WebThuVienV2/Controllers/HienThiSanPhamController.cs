using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.SqlClient;
using System.Data.Entity;
using WebThuVienV2.Models;

namespace WebMyPham.Controllers
{
    public class HienThiSanPhamController : Controller
    {
        // GET: HienThiSanPham
        dbWebThuVienEntities db = new dbWebThuVienEntities();
        public ActionResult Index(string sortingOrder, string searchString, int? pageNo, string maLoaiSach = "0")
        {
            ViewBag.CurrentSortOrder = sortingOrder;
            ViewBag.TenLoaiSP = "Tất cả sản phẩm";
            var sach = db.Saches.Include(x => x.LoaiSach);
            //Tim kiem theo ma loai san pham
            if (maLoaiSach != "0")
            {
                sach = db.Saches.Where(s => s.MaLoaiSach == maLoaiSach);
                switch (maLoaiSach)
                {
                    case "KH":
                        ViewBag.TenLoaiSP = "Khoa học";
                        break;
                    case "KTH":
                        ViewBag.TenLoaiSP = "Kinh tế học";
                        break;
                    case "TL":
                        ViewBag.TenLoaiSP = "Tâm lý";
                        break;
                    case "TT":
                        ViewBag.TenLoaiSP = "Tiểu thuyết";
                        break;
                    case "VH":
                        ViewBag.TenLoaiSP = "Văn học";
                        break;
                }
            }
            //Tim kiem theo ten
            if (!String.IsNullOrEmpty(searchString))
            {
                sach = db.Saches.Where(x => x.TenSach.ToUpper().Contains(searchString.ToUpper())).OrderBy(x => x.TenSach);
                ViewBag.SoLuongSP = "Tìm thấy " + sach.ToList().Count() + " kết quả với từ khóa " + "\"" + searchString + "\"";
            }
            else
                ViewBag.SoLuongSP = "Có tất cả " + sach.ToList().Count() + " kết quả ";
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

            int sizePage = 16;
            int page = (pageNo ?? 1);
            return View(sach.ToList());
        }
    }
}