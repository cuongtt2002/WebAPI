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
        List<SanPhamModel> SanPhamMoi(int SL);
        List<SanPhamModel> SanPhamBanChay(int SL);
        List<SanPhamModel> SanPhamGiamGia(int SL);
        List<SanPhamModel> GetSanPham(int pageIndex, int pageSize);
        List<SanPhamModel> TimKiem(int? page, int? pageSize, out long total, int? MaSanPham, string TenSP, string TenThuongHieu, string TenLoaiSanPham, int? MinGia, int? MaxGia, int? MaLoaiSanPham, int? MaThuongHieu);

    }
}
