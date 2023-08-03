using Model;

namespace DAL
{
    public interface ILoaiSanPhamDAL
    {
        LoaiSanPhamModel GetTheoMa(int ma);
        bool CreateLoaiSanPham(LoaiSanPhamModel model);
        bool UpdateLoaiSanPham(LoaiSanPhamModel model);
        bool DeleteLoaiSanPham(int ma);
        List<LoaiSanPhamModel> GetLoaiSanPham(int pageIndex, int pageSize, out long total);
    }
}
