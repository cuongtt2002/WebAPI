using DAL.Helper;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public partial class NhaCungCapDAL : INhaCungCapDAL
    {
        private IDatabaseHelper _dbHelper;
        public NhaCungCapDAL(IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }
        public NhaCungCapModel GetById(int maNCC)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_get_NhaCungCap_theo_ma",
                     "@MaNhaCungCap", maNCC);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<NhaCungCapModel>().FirstOrDefault();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool CreateNhaCungCap(NhaCungCapModel themNCC)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_NhaCungCap_create",
                "@TenNhaCungCap", themNCC.TenNhaCungCap,
                "@DiaChi",themNCC.DiaChi,
                "@SoDienThoai",themNCC.SoDienThoai,
                "@Email",themNCC.Email);
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
        public bool UpdateNhaCungCap(NhaCungCapModel suaNCC)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_NhaCungCap_Update",
                "@MaNhaCungCap", suaNCC.MaNhaCungCap,
                "@TenNhaCungCap",suaNCC.TenNhaCungCap,
                "@DiaChi", suaNCC.DiaChi,
                "@SoDienThoai",suaNCC.SoDienThoai,
                "@Email",suaNCC.Email);
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

        public bool DeleteNhaCungCap(int ma)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_NhaCungCap_delete",
                "@maNhaCungCap",ma);
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

        public List<NhaCungCapModel> GetNhaCungCap(int pageIndex, int pageSize, out long total)
        {
            string msgError = "";
            total = 0;
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_NhaCungCap_get_NhaCungCap_admin",
                    "@page_index", pageIndex,
                    "@page_size", pageSize);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                if (dt.Rows.Count > 0) total = (long)dt.Rows[0]["RecordCount"];
                return dt.ConvertTo<NhaCungCapModel>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
