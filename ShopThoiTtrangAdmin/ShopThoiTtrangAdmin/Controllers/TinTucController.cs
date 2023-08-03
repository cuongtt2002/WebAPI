using BLL;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Model;

namespace AdminCuaHangDienMay.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TinTucController : ControllerBase
    {
        private ITinTucBus _bus;
        private IToolsBus  _toolbus;
        private string _path;
        public TinTucController(ITinTucBus bus, IConfiguration configuration, IToolsBus toolbus)
        {
            _bus = bus;
            _toolbus = toolbus;
            _path = configuration["AppSettings:PATH_TinTuc"];
        }
        [Route("GetById/{ma}")]
        [HttpGet]
        public TinTucModel GetById(int ma)
        {
            return _bus.GetById(ma);
        }
        [Route("Them-tintuc")]
        [HttpPost]

        public TinTucModel CreateTinTuc([FromBody] TinTucModel model)
        {
            _bus.CreateTinTuc(model);
            return model;
        }
        [Route("sua-tintuc")]
        [HttpPut]
        public TinTucModel UpdateTinTuc([FromBody] TinTucModel model)
        {
            if (model.AnhTinTuc != null)
            {
                var arrData = model.AnhTinTuc.Split(';');
                if (arrData.Length == 3)
                {
                    var savePath = $@"{arrData[0]}";
                    model.AnhTinTuc = $"{savePath}";
                    SaveFileFromBase64String(savePath, arrData[2]);
                }
            }
            _bus.UpdateTinTuc(model);
            return model;
        }

        [Route("xoa-tintuc")]
        [HttpDelete]
        public bool DeleteTinTuc(int ma)
        {
            return _bus.DeleteTinTuc(ma);
        }

        [Route("Get-tintuc")]
        [HttpPost]
        public ResponseModel LayTinTuc([FromBody] Dictionary<string, object> formData)
        {
            var response = new ResponseModel();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                string TieuDe = "";
                if (formData.Keys.Contains("tieuDe") && !string.IsNullOrEmpty(Convert.ToString(formData["tieuDe"]))) { TieuDe = Convert.ToString(formData["tieuDe"].ToString()); }


                long total = 0;
                var data = _bus.GetTinTuc(page, pageSize, out total, TieuDe);
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
