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
    public class NhaCungCapController : ControllerBase
    {
        private INhaCungCapBus _nhacungcapBus;
        public NhaCungCapController(INhaCungCapBus nhacungcapBus)
        {
            _nhacungcapBus = nhacungcapBus;
        }
        [Route("get-ById/{maNCC}")]
        [HttpGet]
        public NhaCungCapModel GetById(int maNCC)
        {
            return _nhacungcapBus.GetById(maNCC);
        }
        [Route("Them-NCC")]
        [HttpPost]
        public NhaCungCapModel CreateNCC([FromBody] NhaCungCapModel themNCC)
        {
            _nhacungcapBus.CreateNhaCungCap(themNCC);
            return themNCC;
        }
        [Route("Cap-nhat-NCC")]
        [HttpPut]
        public NhaCungCapModel UpdateNCC([FromBody] NhaCungCapModel suaNCC)
        {
            _nhacungcapBus.UpdateNhaCungCap(suaNCC);
            return suaNCC;
        }
        [Route("delete-NCC/{ma}")]
        [HttpDelete]
        public bool DeleteNCC(int ma)
        {
            return _nhacungcapBus.DeleteNhaCungCap(ma);
        }

        [Route("get-NCC")]
        [HttpPost]
        public ResponseModel GetNhaCungCap([FromBody] Dictionary<string, object> formData)
        {
            var response = new ResponseModel();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                long total = 0;
                var data = _nhacungcapBus.GetNhaCungCap(page, pageSize, out total);

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
