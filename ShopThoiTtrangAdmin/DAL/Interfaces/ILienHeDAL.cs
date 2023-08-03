using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public partial interface ILienHeDAL
    {
        LienHeModel GetTheoMa(int ma);
        bool CreateLienHe(LienHeModel themlienhe);
        bool UpdateLienHe(LienHeModel sualienhe);
        bool DeleteLienHe(int ma);

        List<LienHeModel> TimKiem(int? page, int? pageSize, out long total, int? MaLienHe, string ThongTinLienHe, string Email);

    }
}