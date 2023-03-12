using Dapper;
using Microsoft.Data.SqlClient;
using SalonDeBellezaCarlitos.Entities.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace SalonDeBellezaCarlitos.DataAccess.Repository
{
    public class DepartametoRepository : IRepository<tbDepartamentos>
    {
        public int Delete(tbDepartamentos item)
        {
            throw new NotImplementedException();
        }

        public tbDepartamentos find(int? id)
        {
            using var db = new SalonCarlitosContext();
            var listado = db.tbDepartamentos.Find(id);
            return listado;
        }

        public int Insert(tbDepartamentos item)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<tbDepartamentos> List()
        {
            using var db = new SqlConnection(SalonCarlitosContext.ConnectionString);
            return db.Query<tbDepartamentos>(ScriptsDataBase.UDP_Listado_Departamentos, null, commandType: CommandType.StoredProcedure);
        }

        public int Update(tbDepartamentos item)
        {
            throw new NotImplementedException();
        }
    }
}
