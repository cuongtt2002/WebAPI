using BLL;
using Microsoft.AspNetCore.Mvc;
using Model;

namespace ShopThoiTrang.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LienHeController : ControllerBase
    {
        private ILienHeBus _lienheBus;
        public LienHeController(ILienHeBus lienheBus)
        {
            _lienheBus = lienheBus;
        }
        [Route("get-all")]
        [HttpGet]
        public IEnumerable<LienHeModel> GetALLLienHe()
        {
            return _lienheBus.GetALLLienHe();
        }
    }
}