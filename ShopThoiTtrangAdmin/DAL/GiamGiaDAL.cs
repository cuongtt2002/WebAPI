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
    public partial class GiamGiaDAL : IGiamGiaDAL
    {
        private IDatabaseHelper _dbHelper;
        public GiamGiaDAL(IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }
        public GiamGiaModel GetTheoMa(int ma)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_lay_giamgia_theo_ma", "@MaGiamGia", ma);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<GiamGiaModel>().FirstOrDefault();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool CreateGiamGia(GiamGiaModel themgiamgia)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_GiamGia_create",
                "@maSanPham",themgiamgia.MaSanPham,
                "@phanTramGiamGia",themgiamgia.PhamTramGiamGia,
                "@thoiGianBatDau",themgiamgia.ThoiGianBatDau,
                "@thoiGianKetThuc",themgiamgia.ThoiGianKetThuc,
                "trangThai",themgiamgia.TrangThai);
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

        public bool UpdateGiamGia(GiamGiaModel suagiamgia)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_GiamGia_Update",
                "@MaGiamGia",suagiamgia.MaGiamGia,
                "@maSanPham",suagiamgia.MaSanPham,
                "@phanTramGiamGia",suagiamgia.PhamTramGiamGia,
                "@thoiGianBatDau",suagiamgia.ThoiGianBatDau,
                "@thoiGianKetThuc",suagiamgia.ThoiGianKetThuc,
                "trangThai",suagiamgia.TrangThai);
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
        public bool DeleteGiamGia(int magiamgia)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_GiamGia_delete",
                "@maGiamGia",magiamgia);
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
        public List<GiamGiaModel> GetGG(int pageIndex, int pageSize, out long total)
        {
            string msgError = "";
            total = 0;
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_giamgia_get_giamgia_admin",
                    "@page_index", pageIndex,
                    "@page_size", pageSize);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                if (dt.Rows.Count > 0) total = (long)dt.Rows[0]["RecordCount"];
                return dt.ConvertTo<GiamGiaModel>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
