using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class MenuBus : IMenuBus
    {
        private IMenuDAL _res;
        public MenuBus(IMenuDAL res)
        {
            _res = res;
        }
        public bool CreateMenu(MenuModel themmenu)
        {
            return _res.CreateMenu(themmenu);
        }
        public bool UpdateMenu(MenuModel suamenu)
        {
            return _res.UpdateMenu(suamenu);
        }
        public bool DeleteMenu(int ma)
        {
            return _res.DeleteMenu(ma);
        }
        public List<MenuModel> GetMenu(int pageIndex, int pageSize, out long total)
        {
            return _res.GetMenu(pageIndex, pageSize, out total);
        }

    }
}