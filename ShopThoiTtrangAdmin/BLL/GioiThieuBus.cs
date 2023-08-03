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
    public class GioiThieuBus : IGioiThieuBus
    {
        private IGioiThieuDAL _res;
        public GioiThieuBus(IGioiThieuDAL res)
        {
            _res = res;
        }
        public GioiThieuModel GetTheoMa(int ma)
        {
            return _res.GetTheoMa(ma);
        }
        public bool CreateGioiThieu(GioiThieuModel themgioithieu)
        {
            return _res.CreateGioiThieu(themgioithieu);
        }
        public bool UpdateGioiThieu(GioiThieuModel suagioithieu)
        {
            return _res.UpdateGioiThieu(suagioithieu);
        }
        public bool DeleteGioiThieu(int ma)
        {
            return _res.DeleteGioiThieu(ma);
        }
        public List<GioiThieuModel> GetGioiThieu(int pageIndex, int pageSize, out long total)
        {
            return _res.GetGioiThieu(pageIndex, pageSize, out total);
        }

    }
}