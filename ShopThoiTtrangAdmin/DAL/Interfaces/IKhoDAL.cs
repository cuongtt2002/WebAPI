using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public interface IKhoDAL
    {
        KhoModel GetById(int ma);
        List<KhoModel> GetKho(int page, int pageSize, out long total);
        bool CreateKho(KhoModel themkho);
        bool UpdateKho(KhoModel suakho);
        bool DeleteKho(int makho);
    }
}
