using Model;

namespace BLL
{
    public interface IGioiThieuBus
    {
        GioiThieuModel GetTheoMa(int ma);
        List<GioiThieuModel> GetGioiThieu(int pageIndex, int pageSize, out long total);
        bool CreateGioiThieu(GioiThieuModel themgioithieu);
        bool UpdateGioiThieu(GioiThieuModel suagioithieu);
        bool DeleteGioiThieu(int ma);
    }
}