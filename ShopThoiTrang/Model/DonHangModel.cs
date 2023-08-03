using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class DonHangModel
    {
        public int MaDonHang { get; set; }
        public DateTime? NgayDat { get; set; }
        public string? TenKhachHang { get; set; }
        public string? DiaChi { get; set; }
        public string? SoDienThoai { get; set; }
        public string? Email { get; set; }
        public KhachHangModel objectjson_khach { get; set; }
        public List<ChiTietDonHangModel> listjson_chitietdonhang { get; set; }
    }

    public class KhachHangModel
    {
        public string TenKhachHang { get; set; }
        public string DiaChi { get; set; }
        public string SoDienThoai { get; set; }
        public string Email { get; set; }
    }

    public class ChiTietDonHangModel
    {
        public int MaDonHang { get; set; }
        public int? MaSanPham { get; set; }
        public int SoLuong { get; set; }
        public int GiaTien { get; set; }
    }

}
