using Model;

namespace BLL
{
    public interface ILoaiSanPhamBus
    {
        LoaiSanPhamModel GetTheoMa(int ma);
        bool CreateLoaiSanPham(LoaiSanPhamModel model);
        bool UpdateLoaiSanPham(LoaiSanPhamModel model);
        bool DeleteLoaiSanPham(int ma);
        List<LoaiSanPhamModel> GetLoaiSanPham(int pageIndex, int pageSize, out long total);
    }
}