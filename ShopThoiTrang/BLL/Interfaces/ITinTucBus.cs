using Model;

namespace BLL
{
    public interface ITinTucBus
    {
        TinTucModel GetById(int matintuc);
        List<TinTucModel> GetALLTinTuc();
    }
}