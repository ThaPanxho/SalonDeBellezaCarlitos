using System;
using System.Collections.Generic;
using System.Text;

namespace SalonDeBellezaCarlitos.DataAccess.Repository
{
    public class ScriptsDataBase
    {
        #region Cargos

        public static string UDP_Listado_Cargos = "salo.UDP_tbCargos_Listado";
        public static string UDP_Insertar_Cargos = "salo.UDP_tbCargos_Insert";
        public static string UDP_Editar_Cargos = "salo.UDP_tbCargos_Update";
        public static string UDP_Borrar_Cargos = "salo.UDP_tbCargos_Delete";

        #endregion

        #region Empleados

        public static string UDP_Listado_Empleados = "salo.UDP_tbEmpleados_Listado";
        public static string UDP_Insertar_Empleados = "salo.UDP_tbEmpleados_Insert";
        public static string UDP_Editar_Empleados = "salo.UDP_tbEmpleados_Update";
        public static string UDP_Borrar_Empleados = "salo.UDP_tbEmpleados_Delete";

        #endregion
    }
}
