using Model;

namespace BLL
{
    public interface IGiamGiaBus
    {
        GiamGiaModel GetTheoMa(int ma);
        bool CreateGiamGia(GiamGiaModel themgiamgia);
        bool UpdateGiamGia(GiamGiaModel suagiamgia);
        bool DeleteGiamGia(int magiamgia);
        List<GiamGiaModel> GetGG(int pageIndex, int pageSize, out long total);
    }
}