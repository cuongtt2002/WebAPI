using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class SanPhamBus : ISanPhamBus
    {
        private ISanPhamDAL _res;
        public SanPhamBus(ISanPhamDAL res)
        {
            _res = res;
        }
        public SanPhamModel GetById(int masanpham)
        {
            return _res.GetById(masanpham);
        }
        public List<SanPhamModel>SanPhamMoi( int SL)
        {
            return _res.SanPhamMoi(SL);
        }
        public List<SanPhamModel> SanPhamBanChay(int SL)
        {
            return _res.SanPhamBanChay(SL);
        }
        public List<SanPhamModel> SanPhamGiamGia(int SL)
        {
            return _res.SanPhamGiamGia(SL);
        }
        public List<SanPhamModel> GetSanPham(int pageIndex, int pageSize)
        {
            return _res.GetSanPham(pageIndex, pageSize);
        }


        public List<SanPhamModel> TimKiem(int? page, int? pageSize, out long total, int? MaSanPham, string TenSP, string TenThuongHieu, string TenLoaiSanPham, int? MinGia, int? MaxGia, int? MaLoaiSanPham, int? MaThuongHieu)
        {
            return _res.TimKiem(page, pageSize, out total, MaSanPham,TenSP, TenThuongHieu, TenLoaiSanPham, MinGia, MaxGia, MaLoaiSanPham, MaThuongHieu);
        }

    }
}