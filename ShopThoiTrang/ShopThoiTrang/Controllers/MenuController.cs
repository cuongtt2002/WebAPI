using BLL;
using Microsoft.AspNetCore.Mvc;
using Model;
using System.Drawing;

namespace ShopThoiTrang.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MenuController : ControllerBase
    {
        private IMenuBus _menuBus;
        public MenuController(IMenuBus menuBus)
        {
            _menuBus = menuBus;
        }
        [Route("get-all")]
        [HttpGet]
        public IEnumerable<MenuModel> GetALLMenu()
        {
            return _menuBus.GetALLMenu();
        }
    }
}