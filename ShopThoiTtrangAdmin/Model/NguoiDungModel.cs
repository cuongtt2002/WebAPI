using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class NguoiDungModel
    {
        public int? MaNguoiDung { get; set; }
        [Required]
        public string? TaiKhoan { get; set; }
        [Required]
        public string? MatKhau { get; set; }
        public string? Email { get; set; }
        public string? HoTen { get; set; }
        public DateTime? NgaySinh { get; set; }
        public string? DiaChi { get; set; }
        public string? SoDienThoai { get; set; }
        public string? GioiTinh { get; set; }
        public string? AnhDaiDien { get; set; }
        public bool? TrangThai { get; set; }
        public string? VaiTro { get; set; }
        public string? token { get; set; }
    }


}
