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
    public partial class NguoiDungDAL : INguoiDungDAL
    {
        private IDatabaseHelper _dbHelper;
        public NguoiDungDAL(IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }
        public bool CreateNguoiDung(NguoiDungModel themnguoidung)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_NguoiDung_create",
                "@TaiKhoan", themnguoidung.TaiKhoan,
                "@MatKhau", themnguoidung.MatKhau,
                "@Email", themnguoidung.Email,
                "@HoTen", themnguoidung.HoTen,
                "@NgaySinh", themnguoidung.NgaySinh,
                "@DiaChi", themnguoidung.DiaChi,
                "@SoDienThoai", themnguoidung.SoDienThoai,
                "@GioiTinh", themnguoidung.GioiTinh,
                "@AnhDaiDien", themnguoidung.AnhDaiDien,
                "@TrangThai", themnguoidung.TrangThai,
                "@VaiTro", themnguoidung.VaiTro);
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
    }
}