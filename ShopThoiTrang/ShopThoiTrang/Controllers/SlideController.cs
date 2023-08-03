using BLL;
using Microsoft.AspNetCore.Mvc;
using Model;


namespace ShopThoiTrang.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SlideController : ControllerBase
    {
        private ISlideBus _slideBus;
        public SlideController(ISlideBus slideBus)
        {
            _slideBus = slideBus;
        }
        [Route("get-all")]
        [HttpGet]
        public IEnumerable<SlideModel> GetALLSlide()
        {
            return _slideBus.GetALLSlide();
        }
    }
}