using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class HoaDonNhapModel
    {
        public int? MaHDN { get; set; }
        public DateTime? NgayNhap { get; set; }
        public int MaNhaCungCap { get; set; }
        public int MaNguoiDung { get; set; }
        public string? HoTen { get; set; }
        public List<ChiTietHoaDonNhapModel>? listjson_HDN { get; set; }
    }

    public class ChiTietHoaDonNhapModel
    {
        public int? MaChiTiet { get; set; }
        public int? MaHDN { get; set; }
        public int? MaSanPham { get; set; }
        public int SoLuong { get; set; }
        public int? GiaTien { get; set; }
    }
}
