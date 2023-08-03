using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public interface ITinTucDAL
    {
        TinTucModel GetById(int ma);
        List<TinTucModel> GetTinTuc(int page, int pageSize, out long total, string TieuDe);
        bool CreateTinTuc(TinTucModel themtintuc);
        bool UpdateTinTuc(TinTucModel suatintuc);
        bool DeleteTinTuc(int matintuc);
    }
}
