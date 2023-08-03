using Model;

namespace BLL
{
    public interface IThuongHieuBus
    {
        bool CreateThuongHieu(ThuongHieuModel themthuonghieu);
        bool UpdateThuongHieu(ThuongHieuModel suathuonghieu);
        bool DeleteThuongHieu(int ma);

        List<ThuongHieuModel> TimKiem(int? page, int? pageSize, out long total, int? MaThuongHieu, string TenThuongHieu);
    }
}