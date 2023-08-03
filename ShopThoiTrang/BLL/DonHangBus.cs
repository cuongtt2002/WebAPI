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
    public class DonHangBus : IDonHangBus
    {
        private IDonHangDAL _res;
        public DonHangBus(IDonHangDAL res)
        {
            _res = res;
        }
        public bool CreateDonHang(DonHangModel model)
        {
            return _res.CreateDonHang(model);
        }

    }
}