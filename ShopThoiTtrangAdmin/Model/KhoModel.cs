using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class KhoModel
    {
        public int? MaKho { get; set; }
        public string TenKho { get; set; }
        public string DiaChi { get; set; }
        public List<ChiTietKhoModel>? listjson_kho { get; set; }
    }

    public class ChiTietKhoModel
    {
        public int? MaChiTietKho { get; set; }
        public int? MaKho { get; set; }
        public int? MaSanPham { get; set; }
        public int SoLuong { get; set; }
        public string? TenSP { get; set; } 
    }
}
