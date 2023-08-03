using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public partial interface ITinTucDAL
    {
        TinTucModel GetById(int matintuc);
        List<TinTucModel> GetALLTinTuc();
    }
}