using Dapper;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using SalonDeBellezaCarlitos.Entities.Entities;
using System;
using System.Collections.Generic;
using System.Data;
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

            using var db = new SqlConnection(SalonCarlitosContext.ConnectionString);
            var parametros = new DynamicParameters();

            parametros.Add("@carg_Descripcion", item.carg_Descripcion, DbType.String, ParameterDirection.Input);
            parametros.Add("@carg_UsuarioCreacion", 1, DbType.Int32, ParameterDirection.Input);
            
            var resultado = db.QueryFirst<int>(ScriptsDataBase.UDP_Insertar_Cargos, parametros, commandType: CommandType.StoredProcedure);

            return resultado;
        }

        public IEnumerable<tbCargos> List()
        {
            using var db = new SqlConnection(SalonCarlitosContext.ConnectionString);
            return db.Query<tbCargos>(ScriptsDataBase.UDP_Listado_Cargos, null, commandType: CommandType.StoredProcedure);

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
