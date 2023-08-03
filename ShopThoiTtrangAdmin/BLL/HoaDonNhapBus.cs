using BLL;
using DAL;
using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class HoaDonNhapBus : IHoaDonNhapBus
    {
        private IHoaDonNhapDAL _res;
        public HoaDonNhapBus(IHoaDonNhapDAL res)
        {
            _res = res;
        }
        public HoaDonNhapModel GetTheoMa(int ma)
        {
            return _res.GetTheoMa(ma);
        }

        public bool CreateHoaDonNhap(HoaDonNhapModel model)
        {
            return _res.CreateHoaDonNhap(model);
        }
        public bool DeleteHoaDonNhap(int ma)
        {
            return _res.DeleteHoaDonNhap(ma);
        }
        public List<HoaDonNhapModel> GetHoaDonNhap(int pageIndex, int pageSize, out long total)
        {
            return _res.GetHoaDonNhap(pageIndex, pageSize, out total);
        }
    }
}
