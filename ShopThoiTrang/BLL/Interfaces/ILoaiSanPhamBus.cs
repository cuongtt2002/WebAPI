using Model;

namespace BLL
{
    public interface ILoaiSanPhamBus
    {
        List<LoaiSanPhamModel> GetALLLoaiSanPham();
        List<SanPhamModel> GetSPByLoaiSanPham(string TenLoaiSanPham, int pageIndex, int pageSize);
    }
}