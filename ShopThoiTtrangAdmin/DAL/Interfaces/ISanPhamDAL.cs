using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public partial interface ISanPhamDAL
    {
        SanPhamModel GetById(int masanpham);
        bool CreateSanPham(SanPhamModel themsanpham);
        bool UpdateSanPham(SanPhamModel suasanpham);
        bool DeleteSanPham(int masanpham);
        List<SanPhamModel> TimKiem(int? page, int? pageSize, out long total, string TenSP);

    }
}