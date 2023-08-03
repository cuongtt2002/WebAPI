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
    public partial class LienHeDAL : ILienHeDAL
    {
        private IDatabaseHelper _dbHelper;
        public LienHeDAL(IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }
        public LienHeModel GetTheoMa(int ma)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_get_lienhe_theo_ma", "@maLienHe", ma);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<LienHeModel>().FirstOrDefault();

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool CreateLienHe(LienHeModel themlienhe)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_LienHe_create",
                "@ThongTinLienHe", themlienhe.ThongTinLienHe,
                "@Email",themlienhe.Email,
                "@SoDienThoai",themlienhe.SoDienThoai,
                "@CoSoLienHe", themlienhe.CoSoLienHe);
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

        public bool UpdateLienHe(LienHeModel sualienhe)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_LienHe_Update",
                "@MaLienHe", sualienhe.MaLienHe,
                "@ThongTinLienHe",sualienhe.ThongTinLienHe,
                "@Email", sualienhe.Email,
                "@SoDienThoai",sualienhe.SoDienThoai,
                "@CoSoLienHe", sualienhe.CoSoLienHe);
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

        public bool DeleteLienHe(int ma)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_LienHe_delete",
                "@MaLienHe", ma);
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

        public List<LienHeModel> TimKiem(int? page, int? pageSize, out long total, int? MaLienHe, string ThongTinLienHe, string Email)
        {
            string msgError = "";
            total = 0;
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_LienHe_search_admin",
                    "@page_index", page,
                    "@page_size", pageSize,
                    "@maLienHe", MaLienHe,
                    "@thongTinLienHe",ThongTinLienHe,
                    "@email", Email);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                if (dt.Rows.Count > 0) total = (long)dt.Rows[0]["RecordCount"];
                return dt.ConvertTo<LienHeModel>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
