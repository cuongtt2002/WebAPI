using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class TinTucBus : ITinTucBus
    {
        private ITinTucDAL _res;
        public TinTucBus(ITinTucDAL res)
        {
            _res = res;
        }
        public TinTucModel GetById(int matintuc)
        {
            return _res.GetById(matintuc);
        }
        public List<TinTucModel>GetALLTinTuc()
        {
            return _res.GetALLTinTuc();
        }
    }
}