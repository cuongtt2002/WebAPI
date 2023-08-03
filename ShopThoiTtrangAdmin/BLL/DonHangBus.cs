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
    public class DonHangBus : IDonHangBus
    {
        private IDonHangDAL _res;
        public DonHangBus(IDonHangDAL res)
        {
            _res = res;
        }
        public DonHangModel GetTheoMa(int ma)
        {
            return _res.GetTheoMa(ma);
        }
        public List<DonHangModel> GetDonHang(int pageIndex, int pageSize, out long total)
        {
            return _res.GetDonHang(pageIndex, pageSize, out total);
        }

    }
}