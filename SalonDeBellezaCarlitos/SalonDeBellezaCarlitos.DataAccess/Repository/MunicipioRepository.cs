using Dapper;
using Microsoft.Data.SqlClient;
using SalonDeBellezaCarlitos.Entities.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace SalonDeBellezaCarlitos.DataAccess.Repository
{
    public class MunicipioRepository : IRepository<tbMunicipios>
    {
        public int Delete(tbMunicipios item)
        {
            throw new NotImplementedException();
        }

        public tbMunicipios find(int? id)
        {
            using var db = new SalonCarlitosContext();
            var listado = db.tbMunicipios.Find(id);
            return listado;
        }

        public int Insert(tbMunicipios item)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<tbMunicipios> List()
        {
            using var db = new SqlConnection(SalonCarlitosContext.ConnectionString);
            return db.Query<tbMunicipios>(ScriptsDataBase.UDP_Listado_Municipios, null, commandType: CommandType.StoredProcedure);
        }

        public int Update(tbMunicipios item)
        {
            throw new NotImplementedException();
        }
    }
}
