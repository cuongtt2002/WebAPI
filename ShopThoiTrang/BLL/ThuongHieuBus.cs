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
    public class ThuongHieuBus : IThuongHieuBus
    {
        private IThuongHieuDAL _res;
        public ThuongHieuBus(IThuongHieuDAL res)
        {
            _res = res;
        }
        public List<ThuongHieuModel> GetALLThuongHieu()
        {
            return _res.GetALLThuongHieu();
        }
        public List<SanPhamModel> GetSPByThuongHieu(string TenThuongHieu, int pageIndex, int pageSize)
        {
            return _res.GetSPByThuongHieu(TenThuongHieu, pageIndex, pageSize);
        }
    }
}