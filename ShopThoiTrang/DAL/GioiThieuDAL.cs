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
        public List<GioiThieuModel> GetALLGioiThieu()
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_GioiThieu_get_all");
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<GioiThieuModel>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}