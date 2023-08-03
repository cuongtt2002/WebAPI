using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public partial interface IMenuDAL
    {
        List<MenuModel> GetMenu(int pageIndex, int pageSize, out long total);
        bool CreateMenu(MenuModel themmenu);
        bool UpdateMenu(MenuModel suamenu);
        bool DeleteMenu(int ma);

    }
}