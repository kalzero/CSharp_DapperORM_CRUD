using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace DapperORMDemo.Data
{
    public static class DataHelper
    {
        public static string GetConnectionString(string name)
        {
            return ConfigurationManager.ConnectionStrings[name].ConnectionString;
        }

        public static IDbConnection ConnectionFactory(string name = "FoodWars")
        {
            return new SqlConnection(GetConnectionString(name));
        }
    }

}
