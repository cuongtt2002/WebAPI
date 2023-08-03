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
    public class TinTucDAL : ITinTucDAL
    {
        private IDatabaseHelper _dbHelper;
        public TinTucDAL(IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }
        public TinTucModel GetById(int ma)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_lay_tin_tuc_theo_ma_admin", "@maTinTuc", ma);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<TinTucModel>().FirstOrDefault();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<TinTucModel> GetTinTuc(int page, int pageSize, out long total, string TieuDe)
        {
            string msgError = "";
            total = 0;
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_tintuc_Get_tintuc_admin",
                    "@page_index", page,
                    "@page_size", pageSize,
                    "@tieuDe", TieuDe);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                if (dt.Rows.Count > 0) total = (long)dt.Rows[0]["RecordCount"];
                return dt.ConvertTo<TinTucModel>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool CreateTinTuc(TinTucModel themtintuc)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_tintuc_Create",
                    "@tieuDe", themtintuc.TieuDe,
                    "@ngayDang",themtintuc.NgayDang,
                    "@noiDung",themtintuc.NoiDung,
                    "@anhTinTuc", themtintuc.AnhTinTuc,
                    "@maNguoiDung",themtintuc.MaNguoiDung);
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
        public bool UpdateTinTuc(TinTucModel suatintuc)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_tintuc_UPDATE",
                    "@maTinTuc",suatintuc.MaTinTuc,
                    "@tieuDe", suatintuc.TieuDe,
                     "@noiDung",suatintuc.NoiDung,
                    "@anhTinTuc",suatintuc.AnhTinTuc,
                    "@maNguoiDung",suatintuc.MaNguoiDung);
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
        public bool DeleteTinTuc(int matintuc)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_tintuc_DELETE", "@maTinTuc", matintuc);
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
