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
        public LoaiSanPhamModel GetTheoMa(int ma)
        {
            return _res.GetTheoMa(ma);
        }
        public bool CreateLoaiSanPham(LoaiSanPhamModel model)
        {
            return _res.CreateLoaiSanPham(model);
        }
        public bool UpdateLoaiSanPham(LoaiSanPhamModel model)
        {
            return _res.UpdateLoaiSanPham(model);
        }
        public bool DeleteLoaiSanPham(int ma)
        {
            return _res.DeleteLoaiSanPham(ma);
        }

        public List<LoaiSanPhamModel> GetLoaiSanPham(int pageIndex, int pageSize, out long total)
        {
            return _res.GetLoaiSanPham(pageIndex, pageSize, out total);
        }

    }
}