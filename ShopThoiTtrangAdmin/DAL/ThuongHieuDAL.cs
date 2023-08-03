using DAL.Helper;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public partial class ThuongHieuDAL : IThuongHieuDAL
    {
        private IDatabaseHelper _dbHelper;
        public ThuongHieuDAL(IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }

        public bool CreateThuongHieu(ThuongHieuModel themthuonghieu)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_Thuong_Hieu_create",
                "@TenThuongHieu", themthuonghieu.TenThuongHieu,
                "@GioiThieu", themthuonghieu.GioiThieu);
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
        public bool UpdateThuongHieu(ThuongHieuModel suathuonghieu)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_ThuongHieu_Update",
                "@MaThuongHieu", suathuonghieu.MaThuongHieu,
                "@TenThuongHieu", suathuonghieu.TenThuongHieu,
                "@GioiThieu", suathuonghieu.GioiThieu);
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

        public bool DeleteThuongHieu(int ma)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_ThuongHieu_delete",
                 "@maThuongHieu", ma);
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

        public List<ThuongHieuModel> TimKiem(int? page, int? pageSize, out long total, int? MaThuongHieu, string TenThuongHieu)
        {
            string msgError = "";
            total = 0;
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_ThuongHieu_search_admin",
                    "@page_index", page,
                    "@page_size", pageSize,
                    "@maThuongHieu",MaThuongHieu,
                    "@tenThuongHieu",TenThuongHieu);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                if (dt.Rows.Count > 0) total = (long)dt.Rows[0]["RecordCount"];
                return dt.ConvertTo<ThuongHieuModel>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
