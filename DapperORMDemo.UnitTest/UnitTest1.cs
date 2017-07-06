using DapperORMDemo.Models.Enum;
using DapperORMDemo.Models.Models;
using DapperORMDemo.Models.Repository;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Transactions;

namespace DapperORMDemo.UnitTest
{
    [TestClass]
    public class UnitTest1
    {
        private FoodRepository _foodRepo;

        [TestInitialize]
        public void Initialize()
        {
            _foodRepo = new FoodRepository();
        }


        public void Test_InsertFood()
        {

            FoodType foodType = new FoodType();
            foodType.Id = (int)FoodTypeEnum.Pasta;

            Food food = new Food();
            food.Name = "Pizza";
            food.Calories = 250;
            food.FoodType = foodType;

            using (TransactionScope scope = new TransactionScope())
            {
                _foodRepo.Create(food);

                scope.Complete();
            }
        }

        [Ignore]
        [TestMethod]
        public void Test_DeleteFood()
        {
            Food food = new Food();
            food.Id = 8;

            using (TransactionScope scope = new TransactionScope())
            {
                _foodRepo.Delete(food);

                scope.Complete();
            }

        }


    }
}
