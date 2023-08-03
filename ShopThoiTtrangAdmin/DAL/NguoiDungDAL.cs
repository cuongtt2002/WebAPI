using DAL.Helper;
using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class NguoiDungDAL : INguoiDungDAL
    {
        private IDatabaseHelper _dbHelper;
        public NguoiDungDAL(IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }

        public NguoiDungModel DangNhap(string TaiKhoan, string MatKhau)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_nguoidung_dangnhap",
                     "@taikhoan", TaiKhoan,
                     "@matkhau", MatKhau);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<NguoiDungModel>().FirstOrDefault();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public NguoiDungModel GetTheoMa(int ma)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_get_NguoiDung_theo_ma", "@maNguoiDung", ma);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<NguoiDungModel>().FirstOrDefault();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool CreateNguoiDung(NguoiDungModel model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_NguoiDung_create",
                    "@taiKhoan", model.TaiKhoan,
                    "@matKhau", model.MatKhau,
                    "@email", model.Email,
                    "@hoTen", model.HoTen,
                    "@ngaySinh", model.NgaySinh,
                    "@diaChi", model.DiaChi,
                    "@soDienThoai", model.SoDienThoai,
                    "@gioiTinh", model.GioiTinh,
                    "@AnhDaiDien", model.AnhDaiDien,
                    "@trangThai", model.TrangThai,
                    "@vaiTro", model.VaiTro);
                if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(Convert.ToString(result) + msgError);
                }
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool UpdateNguoiDung(NguoiDungModel model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_NguoiDung_Update",
                    "@maNguoiDung", model.MaNguoiDung,
                    "@taiKhoan",model.TaiKhoan,
                    "@matKhau", model.MatKhau,
                    "@email", model.Email,
                    "@hoTen", model.HoTen,
                    "@ngaySinh", model.NgaySinh,
                    "@diaChi", model.DiaChi,
                    "@soDienThoai", model.SoDienThoai,
                    "@gioiTinh", model.GioiTinh,
                    "@anhDaiDien", model.AnhDaiDien,
                    "@trangThai", model.TrangThai,
                    "@vaiTro", model.VaiTro);
                if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(Convert.ToString(result) + msgError);
                }
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool DeleteNguoiDung(int ma)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_NguoiDung_DELETE", "@maNguoiDung", ma);
                if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(Convert.ToString(result) + msgError);
                }
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<NguoiDungModel> TimKiem(int pageIndex, int pageSize, out long total, int? MaNguoiDung, string TaiKhoan, string HoTen, string GioiTinh, string DiaChi, string VaiTro)
        {
            string msgError = "";
            total = 0;
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_NguoiDung_search",
                    "@page_index", pageIndex,
                    "@page_size", pageSize,
                    "@maNguoiDung", MaNguoiDung,
                    "@taikhoan", TaiKhoan,
                    "@hoten", HoTen,
                    "@gioitinh", GioiTinh,
                    "@diachi", DiaChi,
                    "@vaiTro",VaiTro);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                if (dt.Rows.Count > 0) total = (long)dt.Rows[0]["RecordCount"];
                return dt.ConvertTo<NguoiDungModel>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}

