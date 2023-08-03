
namespace Model
{
    public class MenuModel
    {
        public int MaMenu { get; set; }
        public int MaMenuCha { get; set; }
        public string TenMenu { get; set; }
        public int? STT { get; set; }//khi null đc ? còn not null không 
        public bool TrangThai { get; set; }
        public string link { get; set; }
    }
}
