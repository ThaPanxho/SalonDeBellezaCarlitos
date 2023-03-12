using Dapper;
using Microsoft.Data.SqlClient;
using SalonDeBellezaCarlitos.Entities.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace SalonDeBellezaCarlitos.DataAccess.Repository
{
    public class ClienteRepository : IRepository<tbClientes>
    {
        public int Delete(tbClientes item)
        {
            throw new NotImplementedException();
        }

        public tbClientes find(int? id)
        {
            using var db = new SalonCarlitosContext();
            var listado = db.tbClientes.Find(id);
            return listado;
        }

        public int Insert(tbClientes item)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<tbClientes> List()
        {
            using var db = new SqlConnection(SalonCarlitosContext.ConnectionString);
            return db.Query<tbClientes>(ScriptsDataBase.UDP_Listado_Clientes, null, commandType: CommandType.StoredProcedure);
        }

        public int Update(tbClientes item)
        {
            throw new NotImplementedException();
        }
    }
}
