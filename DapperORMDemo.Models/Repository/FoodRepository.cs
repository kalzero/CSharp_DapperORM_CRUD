using Dapper;
using DapperORMDemo.Data;
using DapperORMDemo.Models.Models;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace DapperORMDemo.Models.Repository
{
    public class FoodRepository : IRepository<Food>
    {     
        public FoodRepository() { }

        public int Create(Food entity)
        {
            using (IDbConnection cn = DataHelper.ConnectionFactory())
            {
                return cn.Execute("dbo.spInsertFood @foodTypeId, @name, @calories ", new { foodTypeId = entity.FoodType.Id, name = entity.Name, calories = entity.Calories });
            }
        }

        public void Delete(Food entity)
        {
            using (IDbConnection cn = DataHelper.ConnectionFactory())
            {
                cn.Query<Food>("dbo.spDeleteFood @foodId ", new { foodId = entity.Id });
            }
        }

        public IEnumerable<Food> GetAll()
        {
            using (IDbConnection cn = DataHelper.ConnectionFactory())
            {                
                return cn.Query<Food, FoodType, Food>("spGetAllFood", (food, foodType) => { food.FoodType = foodType; return food; });
            }
        }

        public Food GetById(int id)
        {
            using (IDbConnection cn = DataHelper.ConnectionFactory())
            {
                return cn.Query<Food, FoodType, Food>("spGetFoodById @id", (food, foodType) => { food.FoodType = foodType; return food; }, new { id = id }).SingleOrDefault();                
            }
        }

        public int Update(Food entity)
        {
            using (IDbConnection cn = DataHelper.ConnectionFactory())
            {
                return cn.Execute("spUpdateFoodById @id, @name, @calories", new { id = entity.Id, name = entity.Name, calories = entity.Calories });
            }
        }
    }
}
