using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class SanPhamModel
    {
        public int? MaSanPham { get; set; }
        public string? TenSP { get; set; }
        public string? MoTa { get; set; }
        public DateTime? NgayTao { get; set; }
        public int? DonGia { get; set; }
        public int? GiaMoiKhiGiam { get; set; }
        public string? Size { get; set; }
        public int? MaLoaiSanPham { get; set; }
        public int? MaThuongHieu { get; set; }
        public string? AnhDaiDien { get; set; }
        public List<ChiTietAnhSanPhamModel>? listjson_chitietanh { get; set; }
        public List<ThongSoSanPhamModel>? listjson_thongso { get; set; }

    }
    public class ChiTietAnhSanPhamModel
    {
        public int? MaSanPham { get; set; }
        public string? Anh { get; set; }
    }
    public class ThongSoSanPhamModel
    {
        public string? TenThongSo { get; set; }
        public string? MoTaThongTin { get; set; }
        public int? MaSanPham { get; set; }

    }
}
