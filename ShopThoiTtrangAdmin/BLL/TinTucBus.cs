using BLL;
using DAL;
using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
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
        public TinTucModel GetById(int ma)
        {
            return _res.GetById(ma);
        }

        public bool CreateTinTuc(TinTucModel themtintuc)
        {
            return _res.CreateTinTuc(themtintuc);
        }
        public bool UpdateTinTuc(TinTucModel suatintuc)
        {
            return _res.UpdateTinTuc(suatintuc);
        }
        public bool DeleteTinTuc(int matintuc)
        {
            return _res.DeleteTinTuc(matintuc);
        }
        public List<TinTucModel> GetTinTuc(int pageIndex, int pageSize, out long total, string TieuDe)
        {
            return _res.GetTinTuc(pageIndex, pageSize, out total, TieuDe);
        }
    }
}
