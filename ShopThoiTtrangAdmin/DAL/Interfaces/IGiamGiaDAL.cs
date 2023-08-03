using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public partial interface IGiamGiaDAL
    {
        GiamGiaModel GetTheoMa(int ma);
        bool CreateGiamGia(GiamGiaModel themgiamgia);
        bool UpdateGiamGia(GiamGiaModel suagiamgia);
        bool DeleteGiamGia(int magiamgia);
        List<GiamGiaModel> GetGG(int pageIndex, int pageSize, out long total);

    }
}