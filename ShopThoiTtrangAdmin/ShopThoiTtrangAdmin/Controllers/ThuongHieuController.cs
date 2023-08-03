using BLL;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Model;
namespace ShopThoiTtrangAdmin.Controllers
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
        [Route("Them-Thuong-Hieu")]
        [HttpPost]
        public ThuongHieuModel CreateThuongHieu([FromBody] ThuongHieuModel themthuonghieu)
        {
            _thuonghieuBus.CreateThuongHieu(themthuonghieu);
            return themthuonghieu;
        }
        [Route("Cap-nhat-Thuong-hieu")]
        [HttpPut]
        public ThuongHieuModel UpdateThuongHieu([FromBody] ThuongHieuModel suathuonghieu)
        {
            _thuonghieuBus.UpdateThuongHieu(suathuonghieu);
            return suathuonghieu;
        }
        [Route("delete-thuonghieu")]
        [HttpDelete]
        public bool DeleteThuongHieu(int ma)
        {
            return _thuonghieuBus.DeleteThuongHieu(ma);
        }

        [Route("search-thuonghieu")]
        [HttpPost]
        public ResponseModel TimKiem([FromBody] Dictionary<string, object> formData)
        {
            var response = new ResponseModel();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                int? MaThuongHieu = null;
                if (formData.Keys.Contains("maThuongHieu") && !string.IsNullOrEmpty(Convert.ToString(formData["maThuongHieu"]))) { MaThuongHieu = int.Parse(formData["maThuongHieu"].ToString()); }
                string TenThuongHieu = "";
                if (formData.Keys.Contains("tenThuongHieu") && !string.IsNullOrEmpty(Convert.ToString(formData["tenThuongHieu"]))) { TenThuongHieu = Convert.ToString(formData["tenThuongHieu"]); }
                long total = 0;
                var data = _thuonghieuBus.TimKiem(page, pageSize, out total,MaThuongHieu, TenThuongHieu);

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
