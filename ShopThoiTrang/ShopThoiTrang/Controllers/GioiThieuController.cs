using BLL;
using Microsoft.AspNetCore.Mvc;
using Model;

namespace ShopThoiTrang.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class GioiThieuController : ControllerBase
    {
        private IGioiThieuBus _gioithieuBus;
        public GioiThieuController(IGioiThieuBus gioithieuBus)
        {
            _gioithieuBus = gioithieuBus;
        }
        [Route("get-all")]
        [HttpGet]
        public IEnumerable<GioiThieuModel> GetALLGioiThieu()
        {
            return _gioithieuBus.GetALLGioiThieu();
        }
    }
}