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
    public class DanhGiaBus : IDanhGiaBus
    {
        private IDanhGiaDAL _res;
        public DanhGiaBus(IDanhGiaDAL res)
        {
            _res = res;
        }
        public List<SanPhamModel> SanPhamDanhGiaCao(int SL)
        {
            return _res.SanPhamDanhGiaCao(SL);
        }
    }
}