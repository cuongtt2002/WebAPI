using Model;

namespace DAL
{
    public interface IDonHangDAL
    {
        DonHangModel GetTheoMa(int ma);
        List<DonHangModel> GetDonHang(int pageIndex, int pageSize, out long total);
    }
}
