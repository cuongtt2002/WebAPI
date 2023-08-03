using BLL;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Model;
namespace ShopThoiTtrangAdmin.Controllers
{
    //[Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class LienHeController : ControllerBase
    {
        private ILienHeBus _lienheBus;
        public LienHeController(ILienHeBus lienheBus)
        {
            _lienheBus = lienheBus;
        }
        [Route("Get-theo-ma/{ma}")]
        [HttpGet]
        public LienHeModel GetTheoMa(int ma)
        {
            return _lienheBus.GetTheoMa(ma);
        }
        [Route("Them-lienhe")]
        [HttpPost]
        public LienHeModel CreateLienHe([FromBody] LienHeModel themlienhe)
        {
            
            _lienheBus.CreateLienHe(themlienhe);
            return themlienhe;
        }
        [Route("Cap-nhat-lienhe")]
        [HttpPut]
        public LienHeModel UpdateLienHe([FromBody] LienHeModel sualienhe)
        {
            _lienheBus.UpdateLienHe(sualienhe);
            return sualienhe;
        }

        [Route("xoa-lienhe/{ma}")]
        [HttpDelete]
        public bool Xoa(int ma)
        {
            return _lienheBus.DeleteLienHe(ma);
        }

        [Route("search-lienhe")]
        [HttpPost]
        public ResponseModel TimKiem([FromBody] Dictionary<string, object> formData)
        {
            var response = new ResponseModel();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                int? MaLienHe = null;
                if (formData.Keys.Contains("maLienHe") && !string.IsNullOrEmpty(Convert.ToString(formData["maLienHe"]))) { MaLienHe = int.Parse(formData["maLienHe"].ToString()); }
                string ThongTinLienHe = "";
                if (formData.Keys.Contains("thongTinLienHe") && !string.IsNullOrEmpty(Convert.ToString(formData["thongTinLienHe"]))) { ThongTinLienHe = Convert.ToString(formData["thongTinLienHe"]); }
                string Email = "";
                if (formData.Keys.Contains("email") && !string.IsNullOrEmpty(Convert.ToString(formData["email"]))) { Email = Convert.ToString(formData["Email"]); }
                long total = 0;
                var data = _lienheBus.TimKiem(page, pageSize, out total,MaLienHe,ThongTinLienHe, Email);

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
