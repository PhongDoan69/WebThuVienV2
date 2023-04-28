
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.IO;
using System.Web.Mvc;
using WebThuVienV2.Models;
using System;
using System.Web;

namespace WebThuVienV2.Controllers
{
    public class SachController : Controller
    {
        private dbWebThuVienEntities db = new dbWebThuVienEntities();


        [Authorize(Roles = "Admin")]
        // GET: Sach
        public ActionResult Index(string sortingOrder, string searchString, string maLoaiSP = "0")
        {
            ViewBag.CurrentSortOrder = sortingOrder;
            var sanPhams = db.Saches.Include(x => x.LoaiSach);
            //Tim kiem theo ten
            if (!String.IsNullOrEmpty(searchString))
            {
                sanPhams = db.Saches.Include(s => s.LoaiSach).Where(x => x.TenSach.ToUpper().Contains(searchString.ToUpper())).OrderBy(x => x.TenSach);
            }
            //Tim kiem theo ma loai san pham
            if (maLoaiSP != "0")
            {
                sanPhams = db.Saches.Include(x => x.LoaiSach).Where(s => s.MaLoaiSach == maLoaiSP).OrderBy(m => m.MaLoaiSach);
            }
            //Sap xep
            switch (sortingOrder)
            {
                case "dongia":
                    sanPhams = sanPhams.OrderBy(s => s.GiaTien);
                    break;
                case "dongia_desc":
                    sanPhams = sanPhams.OrderByDescending(s => s.GiaTien);
                    break;
                case "ten":
                    sanPhams = sanPhams.OrderBy(s => s.TenSach);
                    break;
                case "ten_desc":
                    sanPhams = sanPhams.OrderByDescending(s => s.TenSach);
                    break;
                default:
                    sanPhams = sanPhams.OrderBy(s => s.MaLoaiSach);
                    break;
            }

  
            return View(sanPhams.ToList());
        }

        // GET: Sach/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Sach sach = db.Saches.Find(id);
            if (sach == null)
            {
                return HttpNotFound();
            }
            return View(sach);
        }

        // GET: Sach/Create
        [Authorize(Roles = "Admin")]
        public ActionResult Create()
        {
            ViewBag.MaLoaiSach = new SelectList(db.LoaiSaches, "MaLoaiSach", "TenLoaiSach");
            return View();
        }

        // POST: Sach/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaSach,TenSach,DonViTinh,GiaTien,NhaXuatBan,MoTa,HinhAnh,MaLoaiSach")] Sach sach,
            HttpPostedFileBase HinhAnh)
        {
            if (ModelState.IsValid)
            {
                if (HinhAnh != null && HinhAnh.ContentLength > 0) //Kiem tra hinh co hop le hay chua
                {
                    //Tien hanh lay ten cua hinh bo vao folder va database
                    string fileName = Path.GetFileName(HinhAnh.FileName);
                    string path = Server.MapPath("~/Images/" + fileName);
                    sach.HinhAnh = fileName;
                    HinhAnh.SaveAs(path);
                }
                db.Saches.Add(sach);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MaLoaiSach = new SelectList(db.LoaiSaches, "MaLoaiSach", "TenLoaiSach", sach.MaLoaiSach);
            return View(sach);
        }

        // GET: Sach/Edit/5
        [Authorize(Roles = "Admin")]
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Sach sach = db.Saches.Find(id);
            if (sach == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaLoaiSP = new SelectList(db.LoaiSaches, "MaLoaiSach", "TenLoaiSach", sach.MaLoaiSach);
            return View(sach);
        }

        // POST: Sach/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaSach,TenSach,DonViTinh,GiaTien,NhaXuatBan,MoTa,HinhAnh,MaLoaiSach")] Sach sach,
          HttpPostedFileBase HinhAnh)
        {
            if (ModelState.IsValid)
            {
                if (HinhAnh != null && HinhAnh.ContentLength > 0)
                {
                    if (sach.HinhAnh != null)
                        System.IO.File.Delete(Server.MapPath("~/Images/" + sach.HinhAnh)); // Xoa hinh cu neu nguoi dung doi hinh moi
                    string fileName = Path.GetFileName(HinhAnh.FileName);
                    string path = Server.MapPath("~/Images/" + fileName);
                    sach.HinhAnh = fileName;
                    HinhAnh.SaveAs(path);
                }
                db.Entry(sach).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MaLoaiSP = new SelectList(db.LoaiSaches, "MaLoaiSach", "TenLoaiSach", sach.MaLoaiSach);
            return View(sach);
        }

        // GET: Sach/Delete/5
        [Authorize(Roles = "Admin")]
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Sach sach = db.Saches.Find(id);
            if (sach == null)
            {
                return HttpNotFound();
            }
            return View(sach);
        }

        // POST: Sach/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Sach sach = db.Saches.Find(id);
            db.Saches.Remove(sach);
            db.SaveChanges();
            if (sach.HinhAnh != null)
                System.IO.File.Delete(Server.MapPath("~/Images/" + sach.HinhAnh)); //Xoa hinh nam trong folder Image
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
