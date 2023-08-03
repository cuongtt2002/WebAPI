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
        public List<SlideModel> GetALLSlide()
        {
            return _res.GetALLSlide();
        }
    }
}