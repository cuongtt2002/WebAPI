using BLL;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Model;
namespace ShopThoiTtrangAdmin.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class LoaiSanPhamController : ControllerBase
    {
        private ILoaiSanPhamBus _loaispBus;
        public LoaiSanPhamController(ILoaiSanPhamBus loaispBus)
        {
            _loaispBus = loaispBus;
        }
        [Route("Get-theo-ma/{ma}")]
        [HttpGet]
        public LoaiSanPhamModel GetTheoMa(int ma)
        {
            return _loaispBus.GetTheoMa(ma);
        }
        [Route("Them-loai")]
        [HttpPost]
        public LoaiSanPhamModel CreateLoaiSanPham([FromBody] LoaiSanPhamModel model)
        {
            _loaispBus.CreateLoaiSanPham(model);
            return model;
        }
        [Route("Cap-nhat-loai")]
        [HttpPut]
        public LoaiSanPhamModel UpdateLoaiSanPham([FromBody] LoaiSanPhamModel model)
        {
            _loaispBus.UpdateLoaiSanPham(model);
            return model;
        }
        [Route("delete-loai/{ma}")]
        [HttpDelete]
        public bool DeleteLoaiSanPham(int ma)
        {
            return _loaispBus.DeleteLoaiSanPham(ma);
        }
        [Route("get-loai")]
        [HttpPost]
        public ResponseModel GetLoaiSanPham([FromBody] Dictionary<string, object> formData)
        {
            var response = new ResponseModel();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                long total = 0;
                var data = _loaispBus.GetLoaiSanPham(page, pageSize, out total);

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
