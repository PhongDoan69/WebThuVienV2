﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebThuVienV2.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    public partial class Sach   
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Sach()
        {
            this.ChiTietHoaDons = new HashSet<ChiTietHoaDon>();
        }
    
        public string MaSach { get; set; }
        [Required]
        [StringLength(100, MinimumLength = 5, ErrorMessage = "Nhập ít nhất 5 ký tự và tối đa 100")]

        public string TenSach { get; set; }
        public string DonViTinh { get; set; }
        public Nullable<double> GiaTien { get; set; }
        public string NhaXuatBan { get; set; }
        public string MoTa { get; set; }
        public string HinhAnh { get; set; }
        public string MaLoaiSach { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietHoaDon> ChiTietHoaDons { get; set; }
        public virtual LoaiSach LoaiSach { get; set; }
    }
}
