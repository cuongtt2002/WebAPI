using BLL;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Model;
using System.IO;
using Microsoft.Extensions.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;


namespace ShopThoiTtrangAdmin.Controllers
{
    //[Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class GiamGiaController : ControllerBase
    {

        private IGiamGiaBus _giamgiaBus;
        public GiamGiaController(IGiamGiaBus giamgiaBus)
        {
            _giamgiaBus = giamgiaBus;
        }
        [Route("Get-theo-ma/{ma}")]
        [HttpGet]
        public GiamGiaModel GetTheoMa(int ma)
        {
            return _giamgiaBus.GetTheoMa(ma);
        }
        [Route("Them-GiamGia")]
        [HttpPost]
        public GiamGiaModel CreateGiamGia([FromBody] GiamGiaModel themgiamgia)
        {
            _giamgiaBus.CreateGiamGia(themgiamgia);
            return themgiamgia;
        }

        [Route("Cap-nhat-giamgia")]
        [HttpPut]
        public GiamGiaModel UpdateGiamGia([FromBody] GiamGiaModel model)
        {
            _giamgiaBus.UpdateGiamGia(model);
            return model;

        }
        [Route("xoa-giamgia/{ma}")]
        [HttpDelete]
        public bool Xoa(int ma)
        {
            return _giamgiaBus.DeleteGiamGia(ma);
        }
        [Route("get-gg")]
        [HttpPost]
        public ResponseModel GetGG([FromBody] Dictionary<string, object> formData)
        {
            var response = new ResponseModel();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                long total = 0;
                var data = _giamgiaBus.GetGG(page, pageSize, out total);

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
