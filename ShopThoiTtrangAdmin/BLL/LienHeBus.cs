using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class LienHeBus : ILienHeBus
    {
        private ILienHeDAL _res;
        public LienHeBus(ILienHeDAL res)
        {
            _res = res;
        }
        public LienHeModel GetTheoMa(int ma)
        {
            return _res.GetTheoMa(ma);
        }
        public bool CreateLienHe(LienHeModel themlienhe)
        {
            return _res.CreateLienHe(themlienhe);
        }
        public bool UpdateLienHe(LienHeModel sualienhe)
        {
            return _res.UpdateLienHe(sualienhe);
        }
        public bool DeleteLienHe(int ma)
        {
            return _res.DeleteLienHe(ma);
        }

        public List<LienHeModel> TimKiem(int? page, int? pageSize, out long total, int? MaLienHe, string ThongTinLienHe, string Email)
        {
            return _res.TimKiem(page, pageSize, out total,MaLienHe,ThongTinLienHe, Email);
        }

    }
}