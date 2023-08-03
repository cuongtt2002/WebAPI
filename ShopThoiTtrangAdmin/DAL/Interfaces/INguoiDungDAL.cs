using Model;

namespace DAL
{
    public interface INguoiDungDAL
    {
        NguoiDungModel DangNhap(string TaiKhoan, string MatKhau);
        NguoiDungModel GetTheoMa(int ma);
        bool CreateNguoiDung(NguoiDungModel model);
        bool UpdateNguoiDung(NguoiDungModel model);
        bool DeleteNguoiDung(int ma);
        List<NguoiDungModel> TimKiem(int pageIndex, int pageSize, out long total, int? MaNguoiDung, string TaiKhoan, string HoTen, string GioiTinh, string DiaChi, string VaiTro);
    }
}
