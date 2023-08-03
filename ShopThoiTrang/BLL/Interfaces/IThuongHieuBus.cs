using Model;

namespace BLL
{
    public interface IThuongHieuBus
    {
        List<ThuongHieuModel> GetALLThuongHieu();
        List<SanPhamModel> GetSPByThuongHieu(string TenThuongHieu, int pageIndex, int pageSize);
    }
}