using Dapper;
using Microsoft.Data.SqlClient;
using SalonDeBellezaCarlitos.Entities.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace SalonDeBellezaCarlitos.DataAccess.Repository
{
    public class EstadoCivilRepository : IRepository<tbEstadosCiviles>
    {
        public int Delete(tbEstadosCiviles item)
        {
            throw new NotImplementedException();
        }

        public tbEstadosCiviles find(int? id)
        {
            using var db = new SalonCarlitosContext();
            var listado = db.tbEstadosCiviles.Find(id);
            return listado;
        }

        public int Insert(tbEstadosCiviles item)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<tbEstadosCiviles> List()
        {
            using var db = new SqlConnection(SalonCarlitosContext.ConnectionString);
            return db.Query<tbEstadosCiviles>(ScriptsDataBase.UDP_Listado_EstadosCiviles, null, commandType: CommandType.StoredProcedure);
        }

        public int Update(tbEstadosCiviles item)
        {
            throw new NotImplementedException();
        }
    }
}
