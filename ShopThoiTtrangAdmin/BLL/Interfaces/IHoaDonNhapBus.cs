using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public interface IHoaDonNhapBus
    {
        HoaDonNhapModel GetTheoMa(int ma);
        List<HoaDonNhapModel> GetHoaDonNhap(int pageIndex, int pageSize, out long total);
        bool CreateHoaDonNhap(HoaDonNhapModel model);
        bool DeleteHoaDonNhap(int ma);
    }
}
