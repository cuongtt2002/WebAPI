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
        public bool CreateThuongHieu(ThuongHieuModel themthuonghieu)
        {
            return _res.CreateThuongHieu(themthuonghieu);
        }
        public bool UpdateThuongHieu(ThuongHieuModel suathuonghieu)
        {
            return _res.UpdateThuongHieu(suathuonghieu);
        }
        public bool DeleteThuongHieu(int ma)
        {
            return _res.DeleteThuongHieu(ma);
        }

        public List<ThuongHieuModel> TimKiem(int? page, int? pageSize, out long total, int? MaThuongHieu, string TenThuongHieu)
        {
            return _res.TimKiem(page, pageSize, out total,MaThuongHieu,TenThuongHieu);
        }

    }
}