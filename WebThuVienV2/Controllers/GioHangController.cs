using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebThuVienV2.Models;

namespace WebThuVienV2.Controllers
{
    public class GioHangController : Controller
    {

        private dbWebThuVienEntities db = new dbWebThuVienEntities();
        // GET: GioHang
        public ActionResult Index()
        {
           List<GioHang> gioHang = Session["giohang"] as List<GioHang>;
            return View(gioHang);
        }
        public RedirectToRouteResult AddToCart (string maSach)
        {
            if (Session["giohang"] == null)
            {
                Session["giohang"] = new List<GioHang>();
            }
            List<GioHang> giohang  = Session["giohang"] as List <GioHang>;
            //Kiem tra san pham dang chon da co trong gio hang hay chua
            if (giohang.FirstOrDefault(s => s.MaSach == maSach) == null)
            {
                Sach book = db.Saches.Find(maSach);
                GioHang newBook = new GioHang();
                newBook.MaSach = maSach;
                newBook.TenSach = book.TenSach;
                newBook.HinhAnh = book.HinhAnh;
                newBook.SoLuong = 1;
                newBook.DonGia = Convert.ToDouble(book.GiaTien);
                giohang.Add(newBook);
            }
            // sach da co trong gio hang
            else
            {
                GioHang cart = giohang.FirstOrDefault(b => b.MaSach == maSach); 
                cart.SoLuong++;
            }
            Session["giohang"] = giohang;
            return RedirectToAction("Index");
        }
        //Cap nhat gio hang 
        public RedirectToRouteResult Update(string maSach, int txtSoLuong)
        {
            //Tim item muon xoa
            List<GioHang> gioHang = Session["giohang"] as List<GioHang>;
            GioHang item = gioHang.FirstOrDefault(m => m.MaSach == maSach);
            if (item != null)
            {
                item.SoLuong = txtSoLuong;
                Session["giohang"] = gioHang;
            }
            return RedirectToAction("Index");
        }

        //Xoa item trong gio hang
        public RedirectToRouteResult DelCartItem(string MaSP)
        {
            List<GioHang> gioHang = Session["giohang"] as List<GioHang>;
            GioHang item = gioHang.FirstOrDefault(m => m.MaSach == MaSP);
            if (item != null)
            {
                gioHang.Remove(item);
                Session["giohang"] = gioHang;
            }
            return RedirectToAction("Index");
        }

        //Gui mail tu dong de thong bao cho khach hang
        public RedirectToRouteResult Order(string name, string email, string address, string phone)
        {
            List<GioHang> gioHang = Session["giohang"] as List<GioHang>;
            string sMgs = "<html><body><table class='table-striped'><h3>Thông tin đặt hàng</h3><div><p>Họ tên khách hàng: " + name + "</p><p>Số điện thoại: " + phone + "</p><p>Địa chỉ: " + address + "</p></div>";
            sMgs += "<tr><th>STT</th><th>Tên sản phẩm</th><th>Số lượng</th><th>Đơn giá</th><th>Thành tiền</th></tr>";
            int i = 0;
            double tongTien = 0;
            foreach (var item in gioHang)
            {
                i++;
                sMgs += "<tr>";
                sMgs += "<td>" + i.ToString() + "</td>";
                sMgs += "<td>" + item.TenSach + "</td>";
                sMgs += "<td>" + item.SoLuong + "</td>";
                sMgs += "<td>" + string.Format("{0:#,##0.##} VND", item.DonGia) + "</td>";
                sMgs += "<td>" + string.Format("{0:#,##0.##} VND", item.ThanhTien) + "</td>";
                sMgs += "</tr>";
                tongTien += item.ThanhTien;
            }
            sMgs += "<tr><th colspan='4'>Tổng tiền: </th>" + "<th>" + string.Format("{0:#,##0.##} VND", tongTien) + "</th></tr>";
            sMgs += "</table></body></html>";

            //MailMessage mail = new MailMessage("phongdoantrung1@gmail.com", email, "Thông tin đặt hàng", sMgs);
            //SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
            //client.EnableSsl = true;
            //client.Credentials = new NetworkCredential("phongdoantrung1@gmail.com", "");
            //mail.IsBodyHtml = true;
            //client.Send(mail);
            return RedirectToAction("Index", "HienThiSanPham");
        }
    }
}