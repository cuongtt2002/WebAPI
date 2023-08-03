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
    public class KhoBus : IKhoBus
    {
        private IKhoDAL _res;
        public KhoBus(IKhoDAL res)
        {
            _res = res;
        }
        public KhoModel GetById(int ma)
        {
            return _res.GetById(ma);
        }

        public bool CreateKho(KhoModel themkho)
        {
            return _res.CreateKho(themkho);
        }
        public bool UpdateKho(KhoModel suakho)
        {
            return _res.UpdateKho(suakho);
        }
        public bool DeleteKho(int makho)
        {
            return _res.DeleteKho(makho);
        }
        public List<KhoModel> GetKho(int pageIndex, int pageSize, out long total)
        {
            return _res.GetKho(pageIndex, pageSize, out total);
        }
    }
}
