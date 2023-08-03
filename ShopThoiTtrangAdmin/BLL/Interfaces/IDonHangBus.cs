using Model;

namespace BLL
{
    public interface IDonHangBus
    {
        DonHangModel GetTheoMa(int ma);
        List<DonHangModel> GetDonHang(int pageIndex, int pageSize, out long total);
    }
}