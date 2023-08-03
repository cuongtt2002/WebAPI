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

        List<ThuongHieuModel> GetALLThuongHieu();
        List<SanPhamModel> GetSPByThuongHieu(string TenThuongHieu, int pageIndex, int pageSize);
    }
}

