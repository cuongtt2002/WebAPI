using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public partial interface IGioiThieuDAL
    {
        GioiThieuModel GetTheoMa(int ma);
        List<GioiThieuModel> GetGioiThieu(int pageIndex, int pageSize, out long total);
        bool CreateGioiThieu(GioiThieuModel themgioithieu);
        bool UpdateGioiThieu(GioiThieuModel suagioithieu);
        bool DeleteGioiThieu(int magioithieu);

    }
}