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
    public class SanPhamBus : ISanPhamBus
    {
        private ISanPhamDAL _res;
        public SanPhamBus(ISanPhamDAL res)
        {
           
            _res = res;
        }
        public SanPhamModel GetById(int ma)
        {
            return _res.GetById(ma);
        }
        public bool CreateSanPham(SanPhamModel themsanpham)
        {
            return _res.CreateSanPham(themsanpham);
        }
        public bool UpdateSanPham(SanPhamModel suasanpham)
        {
            return _res.UpdateSanPham(suasanpham);
        }
        public bool DeleteSanPham(int masanpham)
        {
            return _res.DeleteSanPham(masanpham);
        }
        public List<SanPhamModel> TimKiem(int? page, int? pageSize, out long total, string TenSP)
        {
            return _res.TimKiem(page, pageSize, out total,TenSP);
        }

    }
}