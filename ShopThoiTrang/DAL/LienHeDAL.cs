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
        public List<LienHeModel> GetALLLienHe()
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_LienHe_get_all");
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<LienHeModel>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}