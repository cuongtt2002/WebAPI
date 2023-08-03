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
    public class KhoDAL : IKhoDAL
    {
        private IDatabaseHelper _dbHelper;
        public KhoDAL(IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }
        public KhoModel GetById(int ma)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_lay_kho_theo_ma", "@maKho", ma);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<KhoModel>().FirstOrDefault();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<KhoModel> GetKho(int page, int pageSize, out long total)
        {
            string msgError = "";
            total = 0;
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_kho_get_Kho_admin",
                    "@page_index", page,
                    "@page_size", pageSize);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                if (dt.Rows.Count > 0) total = (long)dt.Rows[0]["RecordCount"];
                return dt.ConvertTo<KhoModel>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool CreateKho(KhoModel themkho)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_Kho_Create",
                    "@tenKho",themkho.TenKho,
                    "@diaChi",themkho.DiaChi,
                    "@listjson_kho",themkho.listjson_kho != null ? MessageConvert.SerializeObject(themkho.listjson_kho) : null);
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
        public bool UpdateKho(KhoModel suakho)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_Kho_UPDATE",
                    "@maKho", suakho.MaKho,
                    "@tenKho",suakho.TenKho,
                    "@diaChi",suakho.DiaChi,
                    "@listjson_kho", suakho.listjson_kho != null ? MessageConvert.SerializeObject(suakho.listjson_kho) : null);
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
        public bool DeleteKho(int makho)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_Kho_DELETE", "@maKho",makho);
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
