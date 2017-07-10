using DapperORMDemo.Models.Enum;
using DapperORMDemo.Models.Models;
using DapperORMDemo.Models.Repository;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Collections.Generic;
using System.Linq;
using System.Transactions;

namespace DapperORMDemo.UnitTest
{
    [TestClass]
    public class UnitTest1
    {
        private FoodRepository _foodRepo;
        private FoodTypeRepository _foodTypeRepo;

        [TestInitialize]
        public void Initialize()
        {
            _foodRepo = new FoodRepository();
            _foodTypeRepo = new FoodTypeRepository();
        }

        #region FoodTest

        [Ignore]
        [TestMethod]
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

        [Ignore]
        [TestMethod]
        public void Test_GetAllFood_NotNull()
        {
            var food = _foodRepo.GetAll();
            List<Food> foodList = _foodRepo.GetAll().ToList();

            Assert.IsNotNull(food);
            Assert.IsNotNull(foodList);

        }


        [Ignore]
        [TestMethod]
        public void Test_GetFoodById()
        {
            int foodId = 3;

            var food = _foodRepo.GetById(foodId);

            Assert.AreEqual(foodId, food.Id);
        }

        [Ignore]
        [TestMethod]
        public void Test_UpdateFoodById()
        {
            Food food = new Food();
            food.Id = 3;
            food.Name = "Milk";
            food.Calories = 200;

            int returnValue = _foodRepo.Update(food);

            Assert.AreEqual(1, returnValue);
        }

        #endregion

        #region FoodTypeTest

        [Ignore]
        [TestMethod]
        public void Test_InsertFoodType_Return1()
        {
            FoodType foodType = new FoodType();
            foodType.Name = "Cheese";

            int retVal = _foodTypeRepo.Create(foodType);

            Assert.AreEqual(1, retVal);
        }

        [Ignore]
        [TestMethod]
        public void Test_GetAllFoodTypes()
        {
            var foodTypes = _foodTypeRepo.GetAll();

            Assert.IsNotNull(foodTypes);
        }

        [TestMethod]
        public void Test_GetFoodTypeById()
        {
            int id = 1;
            FoodType ft = new FoodType();

            ft = _foodTypeRepo.GetById(id);

            Assert.IsNotNull(ft);
        }

        #endregion  
    }
}
