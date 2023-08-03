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
    public class SanPhamController : ControllerBase
    {

        private ISanPhamBus _sanphambus;
        private IToolsBus _toolbus;
        private string _path;
        public SanPhamController(ISanPhamBus sanphambus, IConfiguration configuration, IToolsBus toolbus)
        {
            _sanphambus = sanphambus;
            _toolbus = toolbus;
            _path = configuration["AppSettings:PATH_SanPham"];
        }
        [Route("Get-theo-ma/{ma}")]
        [HttpGet]
        public SanPhamModel GetById(int ma)
        {
            return _sanphambus.GetById(ma);
        }
        [Route("Them-SanPham")]
        [HttpPost]
        public SanPhamModel CreateSanPham([FromBody] SanPhamModel themsanpham)
        {
            _sanphambus.CreateSanPham(themsanpham);
            return themsanpham;
        }

        [Route("Cap-nhat-SanPham")]
        [HttpPut]
        public SanPhamModel UpdateSanPham([FromBody] SanPhamModel model)
        {
            if (model.AnhDaiDien != null)
            {
                var arrData = model.AnhDaiDien.Split(';');
                if (arrData.Length == 3)
                {
                    var savePath = $@"{arrData[0]}";
                    model.AnhDaiDien = $"{savePath}";
                    SaveFileFromBase64String(savePath, arrData[2]);
                }
            }
            _sanphambus.UpdateSanPham(model);
            return model;

        }
        [Route("xoa-sanpham/{ma}")]
        [HttpDelete]
        public bool DeleteSanPham(int ma)
        {
            return _sanphambus.DeleteSanPham(ma);
        }

        [Route("timkiem-sanpham")]
        [HttpPost]
        public ResponseModel TimKiem([FromBody] Dictionary<string, object> formData)
        {
            var response = new ResponseModel();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                string TenSP = "";
                if (formData.Keys.Contains("tenSP") && !string.IsNullOrEmpty(Convert.ToString(formData["tenSP"]))) { TenSP = Convert.ToString(formData["tenSP"]); }
                long total = 0;
                var data = _sanphambus.TimKiem(page, pageSize, out total, TenSP);

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
