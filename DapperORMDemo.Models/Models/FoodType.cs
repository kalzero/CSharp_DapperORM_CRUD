using System.ComponentModel.DataAnnotations;

namespace DapperORMDemo.Models.Models
{
    public class FoodType
    {
        [Key]
        public int Id { get; set; }
        public string Name { get; set; }        
    }
}
