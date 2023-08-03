using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public partial interface INhaCungCapDAL
    {
        NhaCungCapModel GetById(int maNCC);
        bool CreateNhaCungCap(NhaCungCapModel themNCC);
        bool UpdateNhaCungCap(NhaCungCapModel suaNCC);
        bool DeleteNhaCungCap(int ma);
        List<NhaCungCapModel> GetNhaCungCap(int pageIndex, int pageSize, out long total);

    }
}
