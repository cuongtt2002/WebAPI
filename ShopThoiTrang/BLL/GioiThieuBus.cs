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
        public List<GioiThieuModel> GetALLGioiThieu()
        {
            return _res.GetALLGioiThieu();
        }
    }
}