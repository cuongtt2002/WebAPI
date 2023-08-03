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
    public class SanPhamDAL : ISanPhamDAL
    {
        private IDatabaseHelper _dbHelper;
        public SanPhamDAL(IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }
        public SanPhamModel GetById(int masanpham)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_lay__san_pham_theo_ma_Admin",
                     "@MaSanPham", masanpham);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<SanPhamModel>().FirstOrDefault();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool CreateSanPham(SanPhamModel themsanpham)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_sanpham_Create",
                    "@tenSP",themsanpham.TenSP,
                    "@moTa", themsanpham.MoTa,
                    "@size", themsanpham.Size,
                    "@maLoaiSanPham",themsanpham.MaLoaiSanPham,
                    "@maThuongHieu",themsanpham.MaThuongHieu,
                    "@anhDaiDien",themsanpham.AnhDaiDien,
                    "@listThongso",themsanpham.listjson_thongso != null ? MessageConvert.SerializeObject(themsanpham.listjson_thongso) : null);
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
        public bool UpdateSanPham(SanPhamModel suasanpham)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_sanpham_UPDATE",
                    "@maSanPham",suasanpham.MaSanPham,
                    "@tenSP",suasanpham.TenSP,
                    "@moTa",suasanpham.MoTa,
                    "@size", suasanpham.Size,
                    "@maLoaiSanPham",suasanpham.MaLoaiSanPham,
                    "@maThuongHieu",suasanpham.MaThuongHieu,
                    "@anhDaiDien",suasanpham.AnhDaiDien,
                    "@listThongso", suasanpham.listjson_thongso != null ? MessageConvert.SerializeObject(suasanpham.listjson_thongso) : null);

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
        public bool DeleteSanPham(int masanpham)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_sanpham_DELETE", "@maSanPham",masanpham);
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

        public List<SanPhamModel> TimKiem(int? page, int? pageSize, out long total, string TenSP)
        {
            string msgError = "";
            total = 0;
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_sanpham_search_admin",
                    "@page_index", page,
                    "@page_size", pageSize,
                    "@tenSP",TenSP);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                if (dt.Rows.Count > 0) total = (long)dt.Rows[0]["RecordCount"];
                return dt.ConvertTo<SanPhamModel>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
