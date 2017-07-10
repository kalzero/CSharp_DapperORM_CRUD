using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace DapperORMDemo.Models.Models
{
    public class Food
    {
        [Key]
        public int Id { get; set; }
        public string Name { get; set; }
        public int Calories { get; set; }
        public DateTime DateCreated { get; set; }
        public DateTime DateUpdated { get; set; }
        [ForeignKey("FoodTypeId")]
        public FoodType FoodType { get; set; }     
        public bool AllergenRisk { get; set; }
        public string Description { get; set; }
    }
}
