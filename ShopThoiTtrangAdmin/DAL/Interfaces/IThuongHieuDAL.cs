using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public partial interface IThuongHieuDAL
    {
        bool CreateThuongHieu(ThuongHieuModel themthuonghieu);
        bool UpdateThuongHieu(ThuongHieuModel suathuonghieu);
        bool DeleteThuongHieu(int ma);
        List<ThuongHieuModel> TimKiem(int? page, int? pageSize, out long total, int? MaThuongHieu,string TenThuongHieu);
    }
}
