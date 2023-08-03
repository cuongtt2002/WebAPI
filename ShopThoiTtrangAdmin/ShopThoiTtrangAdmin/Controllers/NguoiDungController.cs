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
    public class NguoiDungController : ControllerBase
    {
        private INguoiDungBus _nguoidungbll;
        private IToolsBus _toolbll;
        private string _path;
        public NguoiDungController(INguoiDungBus nguoidungbll, IConfiguration configuration, IToolsBus toolbll)
        {
            _nguoidungbll = nguoidungbll;
            _toolbll = toolbll;
            _path = configuration["AppSettings:PATH_NguoiDung"];
        }

        [AllowAnonymous]
        [HttpPost("dangnhap")]
        public IActionResult DangNhap([FromBody] NguoiDungModel model)
        {
            var nguoidung = _nguoidungbll.DangNhap(model.TaiKhoan, model.MatKhau);

            if (nguoidung == null)
                return BadRequest(new { message = "Tài khoản hoặc mật khẩu không chính xác" });
            return Ok(new { manguoidung = nguoidung.MaNguoiDung, hoten = nguoidung.HoTen, taikhoan = nguoidung.TaiKhoan,anhdaidien=nguoidung.AnhDaiDien, token = nguoidung.token });
        }
        [Route("Get-theo-ma/{ma}")]
        [HttpGet]
        public NguoiDungModel GetTheoMa(int ma)
        {
            return _nguoidungbll.GetTheoMa(ma);
        }

        [Route("nguoidung-timkiem")]
        [HttpPost]
        public ResponseModel TimKiem([FromBody] Dictionary<string, object> formData)
        {
            var phantrang = new ResponseModel();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                int? MaNguoiDung = null;
                if (formData.Keys.Contains("maNguoiDung") && !string.IsNullOrEmpty(Convert.ToString(formData["maNguoiDung"]))) { MaNguoiDung = int.Parse(formData["maNguoiDung"].ToString()); }
                string TaiKhoan = "";
                if (formData.Keys.Contains("taiKhoan") && !string.IsNullOrEmpty(Convert.ToString(formData["taiKhoan"]))) { TaiKhoan = Convert.ToString(formData["taiKhoan"].ToString()); }
                string HoTen = "";
                if (formData.Keys.Contains("hoTen") && !string.IsNullOrEmpty(Convert.ToString(formData["hoTen"]))) { HoTen = Convert.ToString(formData["hoTen"]); }
                string GioiTinh = "";
                if (formData.Keys.Contains("gioiTinh") && !string.IsNullOrEmpty(Convert.ToString(formData["gioiTinh"]))) { GioiTinh = Convert.ToString(formData["gioiTinh"]); }
                string DiaChi = "";
                if (formData.Keys.Contains("diaChi") && !string.IsNullOrEmpty(Convert.ToString(formData["diaChi"]))) { DiaChi = Convert.ToString(formData["diaChi"].ToString()); }
                string VaiTro = "";
                if (formData.Keys.Contains("vaiTro") && !string.IsNullOrEmpty(Convert.ToString(formData["vaiTro"]))) { VaiTro = Convert.ToString(formData["vaiTro"].ToString()); }

                long total = 0;
                var data = _nguoidungbll.TimKiem(page, pageSize, out total, MaNguoiDung, TaiKhoan, HoTen, GioiTinh, DiaChi,VaiTro);
                phantrang.TotalItems = total;
                phantrang.Data = data;
                phantrang.Page = page;
                phantrang.PageSize = pageSize;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return phantrang;
        }

        [Route("create-nguoidung")]
        [HttpPost]
        public NguoiDungModel CreateNguoiDung([FromBody] NguoiDungModel model)
        {
            _nguoidungbll.CreateNguoiDung(model);
            return model;
        }

        [Route("update-nguoidung")]
        [HttpPut]
        public NguoiDungModel UpdateNguoiDung([FromBody] NguoiDungModel model)
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
            _nguoidungbll.UpdateNguoiDung(model);
            return model;
        }

        [Route("delete-nguoidung/{ma}")]
        [HttpDelete]
        public bool DeleteNguoiDung(int ma)
        {
            return _nguoidungbll.DeleteNguoiDung(ma);
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
                    var fullPath = _toolbll.UpFile(filePath, _path);
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
