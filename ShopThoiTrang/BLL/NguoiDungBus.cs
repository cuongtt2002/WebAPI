using BLL;
using DAL;
using Microsoft.Extensions.Configuration;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class NguoiDungBus : INguoiDungBus
    {
        private INguoiDungDAL _res;
        public NguoiDungBus(INguoiDungDAL res)
        {
            _res = res;
        }
        public bool CreateNguoiDung(NguoiDungModel themnguoidung)
        {
            return _res.CreateNguoiDung(themnguoidung);
        }
    }
}