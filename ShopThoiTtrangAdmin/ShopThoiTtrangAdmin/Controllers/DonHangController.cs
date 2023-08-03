using BLL;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Model;
namespace ShopThoiTtrangAdmin.Controllers
{
    //[Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class DonHangController : ControllerBase
    {
        private IDonHangBus _donhangBus;
        public DonHangController(IDonHangBus donhangBus)
        {
            _donhangBus = donhangBus;
        }
        [Route("Get-theo-ma/{ma}")]
        [HttpGet]
        public DonHangModel GetTheoMa(int ma)
        {
            return _donhangBus.GetTheoMa(ma);
        }
        [Route("get-donhang")]
        [HttpPost]
        public ResponseModel GetDonHang([FromBody] Dictionary<string, object> formData)
        {
            var response = new ResponseModel();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                long total = 0;
                var data = _donhangBus.GetDonHang(page, pageSize, out total);

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
