using Dapper;
using DapperORMDemo.Data;
using DapperORMDemo.Models.Models;
using System;
using System.Collections.Generic;
using System.Data;

namespace DapperORMDemo.Models.Repository
{
    public class FoodTypeRepository : IRepository<FoodType>
    {
        public int Create(FoodType entity)
        {
            using (IDbConnection cn = DataHelper.ConnectionFactory())
            {
                return cn.Execute("spInsertFoodType @name", new { name = entity.Name });
            }
        }

        public void Delete(FoodType entity)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<FoodType> GetAll()
        {
            using (IDbConnection cn = DataHelper.ConnectionFactory())
            {
                return cn.Query<FoodType>("spGetAllFoodTypes");
            }
        }

        public FoodType GetById(int id)
        {
            throw new NotImplementedException();
        }

        public int Update(FoodType entity)
        {
            throw new NotImplementedException();
        }
    }
}
