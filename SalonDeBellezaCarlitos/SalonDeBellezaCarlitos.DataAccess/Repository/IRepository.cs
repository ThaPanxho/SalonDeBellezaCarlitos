using System;
using System.Collections.Generic;
using System.Text;

namespace SalonDeBellezaCarlitos.DataAccess
{
    public interface IRepository<T> // T es la entidadad
    {
        public IEnumerable<T> List();

        public int Insert(T item);

        public int Update(T item);

        public T find(int? id);

        public int Delete(T item);

    }
}
