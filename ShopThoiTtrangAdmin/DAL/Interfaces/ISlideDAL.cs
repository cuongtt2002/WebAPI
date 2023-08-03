using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public partial interface ISlideDAL
    {
        SlideModel GetTheoMa(int ma);
        bool CreateSlide(SlideModel themslide);
        bool UpdateSlide(SlideModel suaslide);
        bool DeleteSlide(int ma);
        List<SlideModel> GetSlide(int pageIndex, int pageSize, out long total);

    }
}