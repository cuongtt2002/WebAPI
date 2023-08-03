using BLL;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Model;

namespace AdminCuaHangDienMay.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class KhoController : ControllerBase
    {
        private IKhoBus _bus;
        public KhoController(IKhoBus bus)
        {
            _bus = bus;
        }
        [Route("GetById/{ma}")]
        [HttpGet]
        public KhoModel GetById(int ma)
        {
            return _bus.GetById(ma);
        }
        [Route("Them-kho")]
        [HttpPost]

        public KhoModel CreateKho([FromBody] KhoModel model)
        {
            _bus.CreateKho(model);
            return model;
        }
        [Route("sua-kho")]
        [HttpPut]
        public KhoModel UpdateKho([FromBody] KhoModel model)
        {
            _bus.UpdateKho(model);
            return model;
        }

        [Route("xoa-kho/{ma}")]
        [HttpDelete]
        public bool DeleteKho(int ma)
        {
            return _bus.DeleteKho(ma);
        }

        [Route("Get-kho")]
        [HttpPost]
        public ResponseModel LayKho([FromBody] Dictionary<string, object> formData)
        {
            var response = new ResponseModel();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());


                long total = 0;
                var data = _bus.GetKho(page, pageSize, out total);
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
