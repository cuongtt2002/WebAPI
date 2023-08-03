using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public partial interface ILoaiSanPhamDAL
    {
        List<LoaiSanPhamModel> GetALLLoaiSanPham();
        List<SanPhamModel> GetSPByLoaiSanPham(string TenLoaiSanPham, int pageIndex, int pageSize);
    }
}
