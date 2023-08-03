using BLL;
using DAL;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using Model;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class GiamGiaBus : IGiamGiaBus
    {
        private IGiamGiaDAL _res;
        public GiamGiaBus(IGiamGiaDAL res)
        {
            _res = res;
        }
        public GiamGiaModel GetTheoMa(int ma)
        {
            return _res.GetTheoMa(ma);
        }

        public bool CreateGiamGia(GiamGiaModel themgiamgia)
        {
            return _res.CreateGiamGia(themgiamgia);
        }
        public bool UpdateGiamGia(GiamGiaModel suagiamgia)
        {
            return _res.UpdateGiamGia(suagiamgia);
        }
        public bool DeleteGiamGia(int magiamgia)
        {
            return _res.DeleteGiamGia(magiamgia);
        }
        public List<GiamGiaModel> GetGG(int pageIndex, int pageSize, out long total)
        {
            return _res.GetGG(pageIndex, pageSize, out total);
        }

    }
}