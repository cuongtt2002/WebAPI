using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class LoaiSanPhamBus : ILoaiSanPhamBus
    {
        private ILoaiSanPhamDAL _res;
        public LoaiSanPhamBus(ILoaiSanPhamDAL res)
        {
            _res = res;
        }
        public List<LoaiSanPhamModel> GetALLLoaiSanPham()
        {
            return _res.GetALLLoaiSanPham();
        }
        public List<SanPhamModel> GetSPByLoaiSanPham(string TenLoaiSanPham, int pageIndex, int pageSize)
        {
            return _res.GetSPByLoaiSanPham(TenLoaiSanPham,pageIndex,pageSize);
        }
    }
}