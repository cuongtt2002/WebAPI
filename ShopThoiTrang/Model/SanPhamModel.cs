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
        public string AnhDaiDien { get; set; }
        public string MoTa { get; set; }
        public string Size { get; set; }
        public int? MaLoaiSanPham { get; set; }
        public string TenLoaiSanPham { get; set; }
        public int?  MaThuongHieu { get; set; }
        public string TenThuongHieu { get; set; }
        public int SoLuong { get; set; }
        public int DonGia { get; set; }
        public int PhanTram { get; set; }
        public int GiaMoiKhiGiam { get; set; }
        public List<ThongSoSanPhamModel> listjson_thongso { get; set; }
        public List<ChiTietAnhSanPhamModel> listjson_chitietanh { get; set; }
        public List<DanhGiaModel> listjson_danhgia { get; set; }


    }
    public class ThongSoSanPhamModel
    {
        //public int MaThongSo { get; set; }
        public string? TenThongSo { get; set; }
        public string MoTaThongTin { get; set; }
        //public int MaSanPham { get; set; }
    }
    public class ChiTietAnhSanPhamModel
    {
        //public int MaAnhChiTiet { get; set; }
        //public int MaSanPham { get; set; }
        public string Anh { get; set; }
    }
    public class GiaModel
    {
        //public int MaGia { get; set; }
        public int DonGia { get; set; }
    }
    public class DanhGiaModel
    {
        public int SoSao { get; set; }
    }


}
