using Model;

namespace BLL
{
    public interface ISanPhamBus
    {
        SanPhamModel GetById(int masanpham);
        bool CreateSanPham(SanPhamModel themsanpham);
        bool UpdateSanPham(SanPhamModel suasanpham);
        bool DeleteSanPham(int masanpham);

        List<SanPhamModel> TimKiem(int? page, int? pageSize, out long total, string TenSP);
    }
}