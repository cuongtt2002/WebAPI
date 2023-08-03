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
    public partial class GioiThieuDAL : IGioiThieuDAL
    {
        private IDatabaseHelper _dbHelper;
        public GioiThieuDAL(IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }
        public GioiThieuModel GetTheoMa(int ma)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_get_GioiThieu_theo_ma", "@maGioiThieu", ma);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<GioiThieuModel>().FirstOrDefault();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool CreateGioiThieu(GioiThieuModel themgioithieu)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_GioiThieu_create",
                "@TieuDe", themgioithieu.TieuDe,
                "@NoiDung",themgioithieu.NoiDung,
                "@Anh", themgioithieu.Anh);
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

        public bool UpdateGioiThieu(GioiThieuModel suagioithieu)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_GioiThieu_Update",
                "@MaGioiThieu",suagioithieu.MaGioiThieu,
                "@TieuDe", suagioithieu.TieuDe,
                "@NoiDung",suagioithieu.NoiDung,
                "@Anh", suagioithieu.Anh);
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
        public bool DeleteGioiThieu(int magioithieu)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_GioiThieu_delete",
                "@MaGioiThieu", magioithieu);
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
        public List<GioiThieuModel> GetGioiThieu(int pageIndex, int pageSize, out long total)
        {
            string msgError = "";
            total = 0;
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_GioiThieu_get_GioiThieu_admin",
                    "@page_index", pageIndex,
                    "@page_size", pageSize);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                if (dt.Rows.Count > 0) total = (long)dt.Rows[0]["RecordCount"];
                return dt.ConvertTo<GioiThieuModel>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
