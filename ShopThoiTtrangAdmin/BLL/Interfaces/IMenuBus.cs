using Model;

namespace BLL
{
    public interface IMenuBus
    {
        List<MenuModel> GetMenu(int pageIndex, int pageSize, out long total);
        bool CreateMenu(MenuModel themmenu);
        bool UpdateMenu(MenuModel suamenu);
        bool DeleteMenu(int ma);
    }
}