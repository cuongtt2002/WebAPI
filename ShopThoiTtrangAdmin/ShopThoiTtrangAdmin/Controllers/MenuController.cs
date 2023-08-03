using BLL;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Model;
namespace ShopThoiTtrangAdmin.Controllers
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
        [Route("Them-Menu")]
        [HttpPost]
        public MenuModel CreateMenu([FromBody] MenuModel themmenu)
        {
            _menuBus.CreateMenu(themmenu);
            return themmenu;
        }
        [Route("Cap-nhat-Menu")]
        [HttpPut]
        public MenuModel UpdateMenu([FromBody] MenuModel suamenu)
        {
            _menuBus.UpdateMenu(suamenu);
            return suamenu;
        }
        [Route("delete-Menu")]
        [HttpDelete]
        public bool DeleteMenu(int ma)
        {
            return _menuBus.DeleteMenu(ma);
        }
        [Route("get-Menu")]
        [HttpPost]
        public ResponseModel GetMenu([FromBody] Dictionary<string, object> formData)
        {
            var response = new ResponseModel();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                long total = 0;
                var data = _menuBus.GetMenu(page, pageSize, out total);

                response.TotalItems = total;
                response.Page = page;
                response.PageSize = pageSize;
                response.Data = data;

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return response;
        }
    }
}
