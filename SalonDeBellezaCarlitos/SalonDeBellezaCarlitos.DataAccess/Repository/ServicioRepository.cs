using Microsoft.EntityFrameworkCore;
using SalonDeBellezaCarlitos.Entities.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SalonDeBellezaCarlitos.DataAccess.Repository
{
    public class ServicioRepository : IRepository<tbServicios>
    {
        public int Delete(tbServicios item)
        {
            throw new NotImplementedException();
        }

        public tbServicios find(int? id)
        {
            using var db = new SalonCarlitosContext();
            var listado = db.tbServicios.Find(id);
            return listado;
        }

        public int Insert(tbServicios item)
        {
            using var db = new SalonCarlitosContext();
            db.tbServicios.Add(item);
            return item.serv_Id;
        }

        public IEnumerable<tbServicios> List()
        {
            using var db = new SalonCarlitosContext();
            return db.tbServicios.ToList();
        }

        public int Update(tbServicios item)
        {
            using var db = new SalonCarlitosContext();
            db.Entry(item).State = EntityState.Modified;
            db.SaveChanges();
            return item.serv_Id;
        }
    }
}
