using BLL;
using Microsoft.AspNetCore.Mvc;
using Model;
using System.Drawing;

namespace ShopThoiTrang.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TinTucController : ControllerBase
    {
        private ITinTucBus _tintucBus;
        public TinTucController(ITinTucBus tintucBus)
        {
            _tintucBus = tintucBus;
        }
        [Route("get-ById/{matintuc}")]
        [HttpGet]
        public TinTucModel GetById(int matintuc)
        {
            return _tintucBus.GetById(matintuc);
        }
        [Route("get--tin-tuc")]
        [HttpGet]
        public IEnumerable<TinTucModel> GetALLTinTuc()
        {
            return _tintucBus.GetALLTinTuc();
        }
    }
}
