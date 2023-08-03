using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using static BLL.ToolsBus;

namespace BLL
{
    public class ToolsBus : IToolsBus
    {
        private IToolsDAL _res;
        public ToolsBus(IToolsDAL res)
        {
            _res = res;
        }
        public string UpFile(string file, string path)
        {
            return _res.UpFile(file, path);
        }
    }
}