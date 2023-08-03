using Model;

namespace BLL
{
    public interface ISanPhamBus
    {
        SanPhamModel GetById(int masanpham);
        List<SanPhamModel> SanPhamMoi(int SL);
        List<SanPhamModel> SanPhamBanChay(int SL);
        List<SanPhamModel> SanPhamGiamGia(int SL);
        List<SanPhamModel> GetSanPham(int pageIndex, int pageSize);

        List<SanPhamModel> TimKiem(int? page, int? pageSize, out long total, int? MaSanPham, string? TenSP, string TenThuongHieu, string TenLoaiSanPham, int? MinGia, int? MaxGia, int? MaLoaiSanPham, int? MaThuongHieu);


    }
}