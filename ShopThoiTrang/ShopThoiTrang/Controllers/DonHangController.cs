using BLL;
using Microsoft.AspNetCore.Mvc;
using Model;
using System.Drawing;
using Microsoft.AspNetCore.Http;
namespace ShopThoiTrang.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DonHangController : ControllerBase
    {
        private IDonHangBus _donhangBus;
        public DonHangController(IDonHangBus donhangBus)
        {
            _donhangBus = donhangBus;
        }
        [Route("create-donhang")]
        [HttpPost]
        public DonHangModel CreateDonHang([FromBody] DonHangModel model)
        {
            _donhangBus.CreateDonHang(model);
            return model;
        }
    }
}