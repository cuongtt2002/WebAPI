using Model;

namespace BLL
{
    public interface INhaCungCapBus
    {
        NhaCungCapModel GetById(int maNCC);
        bool CreateNhaCungCap(NhaCungCapModel themNCC);
        bool UpdateNhaCungCap(NhaCungCapModel suaNCC);
        bool DeleteNhaCungCap(int ma);
        List<NhaCungCapModel> GetNhaCungCap(int pageIndex, int pageSize, out long total);
    }
}