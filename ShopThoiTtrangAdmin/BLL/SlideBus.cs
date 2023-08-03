using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class SlideBus : ISlideBus
    {
        private ISlideDAL _res;
        public SlideBus(ISlideDAL res)
        {
            _res = res;
        }
        public SlideModel GetTheoMa(int ma)
        {
            return _res.GetTheoMa(ma);
        }
        public bool CreateSlide(SlideModel themslide)
        {
            return _res.CreateSlide(themslide);
        }
        public bool UpdateSlide(SlideModel suaslide)
        {
            return _res.UpdateSlide(suaslide);
        }
        public bool DeleteSlide(int ma)
        {
            return _res.DeleteSlide(ma);
        }
        public List<SlideModel> GetSlide(int pageIndex, int pageSize, out long total)
        {
            return _res.GetSlide(pageIndex, pageSize, out total);
        }

    }
}