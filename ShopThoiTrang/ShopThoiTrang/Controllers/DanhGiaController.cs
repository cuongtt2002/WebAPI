//using BLL;
//using Microsoft.AspNetCore.Mvc;
//using Model;
//using System.Drawing;

//namespace ShopThoiTrang.Controllers
//{
//    [Route("api/[controller]")]
//    [ApiController]
//    public class DanhGiaController : ControllerBase
//    {
//        private IDanhGiaBus _danhgiaBus;
//        public DanhGiaController(IDanhGiaBus danhgiaBus)
//        {
//            _danhgiaBus = danhgiaBus;
//        }
//        [Route("san-pham-danh-gia-cao/{SL}")]
//        [HttpGet]
//        public IEnumerable<SanPhamModel> SanPhamDanhGiaCao(int SL)
//        {
//            return _danhgiaBus.SanPhamDanhGiaCao(SL);
//        }
//    }
//}