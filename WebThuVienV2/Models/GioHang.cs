using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebThuVienV2.Models
{
    [Serializable]
    public class GioHang
    {
        public string MaSach { get; set; }
        public string TenSach { get; set; }
        public string HinhAnh { get; set; }

        public double DonGia { get; set; }
        public int SoLuong { get; set; }

        public double ThanhTien
        {
            get { return DonGia * SoLuong; }
        }
    }
}