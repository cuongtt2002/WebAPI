using BLL;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Model;

namespace ShopThoiTrang.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HomeController : ControllerBase
    {
        private ISanPhamBus _sanphamBus;
        public HomeController(ISanPhamBus sanphamBus)
        {
            _sanphamBus = sanphamBus;
        }
        [Route("san-pham-moi/{SL}")]
        [HttpGet]
        public IEnumerable<SanPhamModel> SanPhamMoi(int SL)
        {
            return _sanphamBus.SanPhamMoi(SL);
        }
        [Route("san-pham-ban-chay/{SL}")]
        [HttpGet]
        public IEnumerable<SanPhamModel> SanPhamBanChay(int SL)
        {
            return _sanphamBus.SanPhamBanChay(SL);
        }
        [Route("san-pham-giam-gia/{SL}")]
        [HttpGet]
        public IEnumerable<SanPhamModel> SanPhamGiamGia(int SL)
        {
            return _sanphamBus.SanPhamGiamGia(SL);
        }

        [Route("search-san-pham")]
        [HttpPost]
        public ResponseModel TimKiem([FromBody] Dictionary<string, object> formData)
        {
            var response = new ResponseModel();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                int? MaSanPham = null;
                if (formData.Keys.Contains("maSanPham") && !string.IsNullOrEmpty(Convert.ToString(formData["maSanPham"]))) { MaSanPham = int.Parse(formData["maSanPham"].ToString()); }
                string TenSP = "";
                if (formData.Keys.Contains("tenSP") && !string.IsNullOrEmpty(Convert.ToString(formData["tenSP"]))) { TenSP = Convert.ToString(formData["tenSP"]); }
                string TenThuongHieu = "";
                if (formData.Keys.Contains("tenThuongHieu") && !string.IsNullOrEmpty(formData["tenThuongHieu"].ToString()))
                {
                    TenThuongHieu = formData["tenThuongHieu"].ToString();
                }
                string TenLoaiSanPham = "";
                if (formData.Keys.Contains("tenLoaiSanPham") && !string.IsNullOrEmpty(Convert.ToString(formData["tenLoaiSanPham"]))) { TenLoaiSanPham = Convert.ToString(formData["tenLoaiSanPham"]); }

                int? MinGia = null;
                if (formData.Keys.Contains("minGia") && !string.IsNullOrEmpty(Convert.ToString(formData["minGia"]))) { MinGia = int.Parse(formData["minGia"].ToString()); }
                int? MaxGia = null;
                if (formData.Keys.Contains("maxGia") && !string.IsNullOrEmpty(Convert.ToString(formData["maxGia"]))) { MaxGia = int.Parse(formData["maxGia"].ToString()); }
                int? MaLoaiSanPham = null;
                if (formData.Keys.Contains("maLoaiSanPham") && !string.IsNullOrEmpty(Convert.ToString(formData["maLoaiSanPham"]))) { MaLoaiSanPham = int.Parse(formData["maLoaiSanPham"].ToString()); }
                int? MaThuongHieu = null;
                if (formData.Keys.Contains("maThuongHieu") && !string.IsNullOrEmpty(Convert.ToString(formData["maThuongHieu"]))) { MaThuongHieu = int.Parse(formData["maThuongHieu"].ToString()); };
                long total = 0;
                var data = _sanphamBus.TimKiem(page, pageSize, out total, MaSanPham, TenSP, TenThuongHieu, TenLoaiSanPham, MinGia, MaxGia, MaLoaiSanPham, MaThuongHieu);

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
