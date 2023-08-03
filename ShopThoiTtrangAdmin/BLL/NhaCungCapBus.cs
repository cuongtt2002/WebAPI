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
    public class NhaCungCapBus : INhaCungCapBus
    {
        private INhaCungCapDAL _res;
        public NhaCungCapBus(INhaCungCapDAL res)
        {
            _res = res;
        }
        public NhaCungCapModel GetById(int maNCC)
        {
            return _res.GetById(maNCC);
        }
        public bool CreateNhaCungCap(NhaCungCapModel themNCC)
        {
            return _res.CreateNhaCungCap(themNCC);
        }
        public bool UpdateNhaCungCap(NhaCungCapModel suaNCC)
        {
            return _res.UpdateNhaCungCap(suaNCC);
        }
        public bool DeleteNhaCungCap(int ma)
        {
            return _res.DeleteNhaCungCap(ma);
        }
        public List<NhaCungCapModel> GetNhaCungCap(int pageIndex, int pageSize, out long total)
        {
            return _res.GetNhaCungCap(pageIndex, pageSize, out total);
        }


    }
}