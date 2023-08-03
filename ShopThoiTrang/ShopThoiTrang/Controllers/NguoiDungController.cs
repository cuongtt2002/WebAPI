using BLL;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Model;
using System.IO;
using Microsoft.Extensions.Configuration;
using System.Collections.Generic;
using System.Linq;


namespace ShopThoiTtrangAdmin.Controllers
{
    //[Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class NguoiDungController : ControllerBase
    {

        private INguoiDungBus _nguoidungbus;
        public NguoiDungController(INguoiDungBus nguoidungbus)
        {
            _nguoidungbus = nguoidungbus;
        }
        [Route("Them-NguoiDung")]
        [HttpPost]
        public NguoiDungModel CreateNguoiDung([FromBody] NguoiDungModel themnguoidung)
        {
            _nguoidungbus.CreateNguoiDung(themnguoidung);
            return themnguoidung;
        }
    }
}
