using BLL;
using Microsoft.AspNetCore.Mvc;
using Model;
using System.Drawing;

namespace ShopThoiTrang.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoaiSanPhamController : ControllerBase
    {
        private ILoaiSanPhamBus _loaisanphamBus;
        public LoaiSanPhamController(ILoaiSanPhamBus loaisanphamBus)
        {
            _loaisanphamBus = loaisanphamBus;
        }
        [Route("get-all")]
        [HttpGet]
        public IEnumerable<LoaiSanPhamModel> GetALLLoaiSanPham()
        {
            return _loaisanphamBus.GetALLLoaiSanPham();
        }
        [Route("get-san-pham-by-loai-SP")]
        [HttpPost]
        public ResponseModel GetSPByLoaiSanPham([FromBody] Dictionary<string, object> formData)
        {
            var response = new ResponseModel();
            try
            {
                string TenLoaiSanPham = "";
                if (formData.Keys.Contains("tenLoaiSanPham") && !string.IsNullOrEmpty(Convert.ToString(formData["tenLoaiSanPham"]))) { TenLoaiSanPham = Convert.ToString(formData["tenLoaiSanPham"]); }
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                var data = _loaisanphamBus.GetSPByLoaiSanPham(TenLoaiSanPham,page, pageSize);
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