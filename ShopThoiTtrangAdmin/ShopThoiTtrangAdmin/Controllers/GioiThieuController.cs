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
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class GioiThieuController : ControllerBase
    {
        private IGioiThieuBus _gioithieuBus;
        private IToolsBus _toolbus;
        private string _path;
        public GioiThieuController(IGioiThieuBus gioithieuBus, IConfiguration configuration, IToolsBus toolsBus)
        {
            _gioithieuBus = gioithieuBus;
            _toolbus = toolsBus;
            _path = configuration["AppSettings:PATH_GioiThieu"];
        }
        [Route("Get-theo-ma/{ma}")]
        [HttpGet]
        public GioiThieuModel GetTheoMa(int ma)
        {
            return _gioithieuBus.GetTheoMa(ma);
        }
        [Route("Them-GioiThieu")]
        [HttpPost]
        public GioiThieuModel CreateGioiThieu([FromBody] GioiThieuModel themgioithieu)
        {
            _gioithieuBus.CreateGioiThieu(themgioithieu);
            return themgioithieu;
        }

      
        [Route("Cap-nhat-GioiThieu")]
        [HttpPut]
        public GioiThieuModel UpdateGioiThieu([FromBody] GioiThieuModel suagioithieu)
        {
            if (suagioithieu.Anh != null)
            {
                var arrData = suagioithieu.Anh.Split(';');
                if (arrData.Length == 3)
                {
                    var savePath = $@"{arrData[0]}";
                    suagioithieu.Anh = $"{savePath}";
                    SaveFileFromBase64String(savePath, arrData[2]);
                }
            }
            _gioithieuBus.UpdateGioiThieu(suagioithieu);
            return suagioithieu;
        }
        [Route("xoa-gioithieu/{ma}")]
        [HttpDelete]
        public bool Xoa(int ma)
        {
            return _gioithieuBus.DeleteGioiThieu(ma);
        }

        [Route("get-gioithieu")]
        [HttpPost]
        public ResponseModel GetGioiThieu([FromBody] Dictionary<string, object> formData)
        {
            var response = new ResponseModel();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                long total = 0;
                var data = _gioithieuBus.GetGioiThieu(page, pageSize, out total);

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
        //File -------------------------------------------------------
        [Route("upload")]
        [HttpPost, DisableRequestSizeLimit]
        public async Task<IActionResult> Upload(IFormFile file)
        {
            try
            {
                if (file.Length > 0)
                {
                    string filePath = $"{file.FileName.Replace("-", "_").Replace("%", "")}";
                    var fullPath = _toolbus.UpFile(filePath, _path);
                    using (var fileStream = new FileStream(fullPath, FileMode.Create))
                    {
                        await file.CopyToAsync(fileStream);
                    }
                    return Ok(new { filePath });
                }
                else
                {
                    return BadRequest();
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Không tìm thây");
            }
        }

        [NonAction]
        public string SaveFileFromBase64String(string RelativePathFileName, string dataFromBase64String)
        {
            if (dataFromBase64String.Contains("base64,"))
            {
                dataFromBase64String = dataFromBase64String.Substring(dataFromBase64String.IndexOf("base64,", 0) + 7);
            }
            return WriteFileToAuthAccessFolder(RelativePathFileName, dataFromBase64String);
        }

        [NonAction]
        public string WriteFileToAuthAccessFolder(string RelativePathFileName, string base64StringData)
        {
            try
            {
                string result = "";
                string serverRootPathFolder = _path;
                string fullPathFile = $@"{serverRootPathFolder}\{RelativePathFileName}";
                string fullPathFolder = Path.GetDirectoryName(fullPathFile);
                if (!Directory.Exists(fullPathFolder))
                    Directory.CreateDirectory(fullPathFolder);
                System.IO.File.WriteAllBytes(fullPathFile, Convert.FromBase64String(base64StringData));
                return result;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }
    }
}
