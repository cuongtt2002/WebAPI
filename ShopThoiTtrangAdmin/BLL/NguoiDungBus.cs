using BLL;
using DAL;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using Model;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class NguoiDungBus : INguoiDungBus
    {
        private INguoiDungDAL _res;
        private string Secret;
        public NguoiDungBus(INguoiDungDAL res, IConfiguration configuration)
        {
            Secret = configuration["AppSettings:Secret"];
            _res = res;
        }
        public NguoiDungModel DangNhap(string TaiKhoan, string MatKhau)
        {
            var nguoidung = _res.DangNhap(TaiKhoan, MatKhau);

            if (nguoidung == null)
                return null;

            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes(Secret);
            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new Claim[]
                {
                    new Claim(ClaimTypes.Name, nguoidung.HoTen.ToString()),
                    new Claim(ClaimTypes.StreetAddress, nguoidung.DiaChi.ToString())
                }),
                Expires = DateTime.UtcNow.AddDays(7),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
            };
            var token = tokenHandler.CreateToken(tokenDescriptor);
            nguoidung.token = tokenHandler.WriteToken(token);

            return nguoidung;
        }
        public NguoiDungModel GetTheoMa(int ma)
        {
            return _res.GetTheoMa(ma);
        }
        public bool CreateNguoiDung(NguoiDungModel model)
        {
            return _res.CreateNguoiDung(model);
        }
        public bool UpdateNguoiDung(NguoiDungModel model)
        {
            return _res.UpdateNguoiDung(model);
        }
        public bool DeleteNguoiDung(int ma)
        {
            return _res.DeleteNguoiDung(ma);
        }
        public List<NguoiDungModel> TimKiem(int pageIndex, int pageSize, out long total, int? MaNguoiDung, string TaiKhoan, string HoTen, string GioiTinh, string DiaChi, string VaiTro)
        {
            return _res.TimKiem(pageIndex, pageSize, out total, MaNguoiDung, TaiKhoan, HoTen, GioiTinh, DiaChi, VaiTro);
        }
    }
}