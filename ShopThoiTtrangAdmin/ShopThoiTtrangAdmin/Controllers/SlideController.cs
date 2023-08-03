using BLL;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Model;
using System.IO;
using Microsoft.Extensions.Configuration;
using System.Collections.Generic;
using System.Linq;
using DAL;

namespace ShopThoiTtrangAdmin.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class SlideController : ControllerBase
    {
        private ISlideBus _slideBus;
        private IToolsBus _toolbus;
        private string _path;
        public SlideController(ISlideBus slideBus, IConfiguration configuration, IToolsBus toolsBus)
        {
            _slideBus = slideBus;
            _toolbus = toolsBus;
            _path = configuration["AppSettings:PATH_Slide"];
        }
        [Route("Get-theo-ma/{ma}")]
        [HttpGet]
        public SlideModel GetTheoMa(int ma)
        {
            return _slideBus.GetTheoMa(ma);
        }
        [Route("Them-Slide")]
        [HttpPost]
        public SlideModel CreateSlide([FromBody] SlideModel themslide)
        {
            _slideBus.CreateSlide(themslide);
            return themslide;
        }
        [Route("Cap-nhat-slide")]
        [HttpPut]
        public SlideModel UpdateSlide([FromBody] SlideModel suaslide)
        {
            if (suaslide.Anh != null)
            {
                var arrData = suaslide.Anh.Split(';');
                if (arrData.Length == 3)
                {
                    var savePath = $@"{arrData[0]}";
                    suaslide.Anh = $"{savePath}";
                    SaveFileFromBase64String(savePath, arrData[2]);
                }
            }
            _slideBus.UpdateSlide(suaslide);
            return suaslide;
        }
        [Route("delete-Slide/{ma}")]
        [HttpDelete]
        public bool DeleteSlide(int ma)
        {
            return _slideBus.DeleteSlide(ma);
        }

        [Route("get-slide")]
        [HttpPost]
        public ResponseModel GetSlide([FromBody] Dictionary<string, object> formData)
        {
            var response = new ResponseModel();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                long total = 0;
                var data = _slideBus.GetSlide(page, pageSize, out total);

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
