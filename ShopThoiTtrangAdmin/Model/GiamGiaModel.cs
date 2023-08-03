using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class GiamGiaModel
    {
        public int? MaGiamGia { get; set; }
        public int? MaSanPham { get; set; }
        public int? PhamTramGiamGia { get; set; }
        public DateTime? ThoiGianBatDau { get; set; }
        public DateTime? ThoiGianKetThuc { get; set; }
        public bool TrangThai { get; set; }
        public string? TenSP { get; set; }
    }
}
