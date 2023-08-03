using Model;

namespace BLL
{
    public interface ISlideBus
    {
        SlideModel GetTheoMa(int ma);
        bool CreateSlide(SlideModel themslide);
        bool UpdateSlide(SlideModel suaslide);
        bool DeleteSlide(int ma);
        List<SlideModel> GetSlide(int pageIndex, int pageSize, out long total);
    }
}