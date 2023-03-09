using Microsoft.EntityFrameworkCore;
using SalonDeBellezaCarlitos.Entities.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SalonDeBellezaCarlitos.DataAccess.Repository
{
    public class CargoRepository : IRepository<tbCargos>
    {
        public int Delete(tbCargos item)
        {
            throw new NotImplementedException();
        }

        public tbCargos find(int? id)
        {
            using var db = new SalonCarlitosContext();
            var listado = db.tbCargos.Find(id);
            return listado;
        }

        public int Insert(tbCargos item)
        {
            using var db = new SalonCarlitosContext();
            db.tbCargos.Add(item);
            return item.carg_Id;
        }

        public IEnumerable<CargoRepository> ToList()
        {
            throw new NotImplementedException();
        }

        public IEnumerable<tbCargos> List()
        {
            using var db = new SalonCarlitosContext();
            return db.tbCargos.ToList();
        }

        public int Update(tbCargos item)
        {
            using var db = new SalonCarlitosContext();
            db.Entry(item).State = EntityState.Modified;
            db.SaveChanges();
            return item.carg_Id;
        }
    }
}
