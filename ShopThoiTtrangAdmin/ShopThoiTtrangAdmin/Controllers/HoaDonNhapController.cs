using BLL;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Model;

namespace AdminCuaHangDienMay.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HoaDonNhapController : ControllerBase
    {
        private IHoaDonNhapBus _bus;
        public HoaDonNhapController(IHoaDonNhapBus bus)
        {
            _bus = bus;
        }
        [Route("Get-theo-ma/{ma}")]
        [HttpGet]
        public HoaDonNhapModel GetTheoMa(int ma)
        {
            return _bus.GetTheoMa(ma);
        }
        [Route("Them-HDN")]
        [HttpPost]

        public HoaDonNhapModel CreateHoaDonNhap([FromBody] HoaDonNhapModel model)
        {
            _bus.CreateHoaDonNhap(model);
            return model;
        }

        [Route("xoa-HDN/{ma}")]
        [HttpDelete]
        public bool DeleteHoaDonNhap(int ma)
        {
            return _bus.DeleteHoaDonNhap(ma);
        }

        [Route("Get-HDN")]
        [HttpPost]
        public ResponseModel LayKho([FromBody] Dictionary<string, object> formData)
        {
            var response = new ResponseModel();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());


                long total = 0;
                var data = _bus.GetHoaDonNhap(page, pageSize, out total);
                response.TotalItems = total;
                response.Data = data;
                response.Page = page;
                response.PageSize = pageSize;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return response;
        }

    }
}
