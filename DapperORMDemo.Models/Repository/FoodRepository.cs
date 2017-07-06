using Dapper;
using DapperORMDemo.Data;
using DapperORMDemo.Models.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace DapperORMDemo.Models.Repository
{
    public class FoodRepository : IRepository<Food>
    {
        internal IDbConnection Connection
        {
            get { return new SqlConnection(DataHelper.GetConnectionString("FoodWars")); }
        }

        public FoodRepository() { }

        public void Create(Food entity)
        {
            using (IDbConnection cn = Connection)
            {
                cn.Query<Food>("dbo.spInsertFood @foodTypeId, @name, @calories ", new { foodTypeId = entity.FoodType.Id, name = entity.Name, calories = entity.Calories });
            }
        }

        public void Delete(Food entity)
        {
            using (IDbConnection cn = Connection)
            {
                cn.Query<Food>("dbo.spDeleteFood @foodId ", new { foodId = entity.Id });
            }
        }

        public IEnumerable<Food> GetAll()
        {
            throw new NotImplementedException();
        }

        public Food GetById(int id)
        {
            throw new NotImplementedException();
        }

        public void Update(Food entity)
        {
            throw new NotImplementedException();
        }
    }
}
