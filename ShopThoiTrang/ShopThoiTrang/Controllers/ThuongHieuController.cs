using BLL;
using Microsoft.AspNetCore.Mvc;
using Model;
using System.Drawing;

namespace ShopThoiTrang.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ThuongHieuController : ControllerBase
    {
        private IThuongHieuBus _thuonghieuBus;
        public ThuongHieuController(IThuongHieuBus thuonghieuBus)
        {
            _thuonghieuBus = thuonghieuBus;
        }

        [Route("get-all")]
        [HttpGet]
        public IEnumerable<ThuongHieuModel> GetALLThuongHieu()
        {
            return _thuonghieuBus.GetALLThuongHieu();
        }
        [Route("get-san-pham-by-thuong-hieu")]
        [HttpPost]
        public ResponseModel GetSPByThuongHieu([FromBody] Dictionary<string, object> formData)
        {
            var response = new ResponseModel();
            try
            {
                string TenThuongHieu = "";
                if (formData.Keys.Contains("tenThuongHieu") && !string.IsNullOrEmpty(Convert.ToString(formData["tenThuongHieu"]))) { TenThuongHieu = Convert.ToString(formData["tenThuongHieu"]); }
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                var data = _thuonghieuBus.GetSPByThuongHieu(TenThuongHieu, page, pageSize);
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