using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace DAL
{
    public class ToolsDAL : IToolsDAL
    {
        private IConfiguration _configuration;
        public ToolsDAL(IConfiguration configuration)
        {
            _configuration = configuration;
        }
        public string UpFile(string file, string path)
        {
            try
            {
                string serverRootPathFolder = path.ToString();
                string fullPathFile = $@"{serverRootPathFolder}\{file}";
                string fullPathFolder = Path.GetDirectoryName(fullPathFile);
                if (!Directory.Exists(fullPathFolder))
                    Directory.CreateDirectory(fullPathFolder);
                return fullPathFile;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }
    }
}
