﻿using Microsoft.EntityFrameworkCore;
using SalonDeBellezaCarlitos.Entities.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SalonDeBellezaCarlitos.DataAccess.Repository
{
    public class UsuarioRepository : IRepository<tbUsuarios>
    {
        public int Delete(tbUsuarios item)
        {
            throw new NotImplementedException();
        }

        public tbUsuarios find(int? id)
        {
            using var db = new SalonCarlitosContext();
            var listado = db.tbUsuarios.Find(id);
            return listado;
        }

        public int Insert(tbUsuarios item)
        {
            using var db = new SalonCarlitosContext();
            db.tbUsuarios.Add(item);
            return item.usur_Id;
        }

        public IEnumerable<tbUsuarios> List()
        {
            using var db = new SalonCarlitosContext();
            return db.tbUsuarios.ToList();
        }

        public int Update(tbUsuarios item)
        {
            using var db = new SalonCarlitosContext();
            db.Entry(item).State = EntityState.Modified;
            db.SaveChanges();
            return item.usur_Id;
        }
    }
}
