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
        public List<LienHeModel> GetALLLienHe()
        {
            return _res.GetALLLienHe();
        }
    }
}