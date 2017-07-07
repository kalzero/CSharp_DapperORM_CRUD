using System.Collections.Generic;

namespace DapperORMDemo.Models.Repository
{
    public interface IRepository<T> where T : class
    {
        IEnumerable<T> GetAll();
        T GetById(int id);
        int Create(T entity);
        int Update(T entity);
        void Delete(T entity);       
    }
}
