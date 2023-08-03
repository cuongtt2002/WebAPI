using Model;

namespace BLL
{
    public interface ILienHeBus
    {
        LienHeModel GetTheoMa(int ma);
        bool CreateLienHe(LienHeModel themlienhe);
        bool UpdateLienHe(LienHeModel sualienhe);
        bool DeleteLienHe(int ma);
        List<LienHeModel> TimKiem(int? page, int? pageSize, out long total, int? MaLienHe, string ThongTinLienHe, string Email);
    }
}