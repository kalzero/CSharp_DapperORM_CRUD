using System.Configuration;

namespace DapperORMDemo.Data
{
    public static class DataHelper
    {
        public static string GetConnectionString(string name)
        {
            return ConfigurationManager.ConnectionStrings[name].ConnectionString;
        }
    }
}
