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

        #region Usuarios

        public static string UDP_Listado_Usuarios = "acce.UDP_tbUsuarios_Listado";
        public static string UDP_Insertar_Usuarios = "acce.UDP_tbUsuarios_Insert";
        public static string UDP_Editar_Usuarios = "acce.UDP_tbUsuarios_Update";
        public static string UDP_Borrar_Usuarios = "acce.UDP_tbUsuario_Delete";

        #endregion

        #region Clientes

        public static string UDP_Listado_Clientes = "salo.UDP_tbClientes_Listado";
        public static string UDP_Insertar_Clientes = "salo.UDP_tbClientes_Insert";
        public static string UDP_Editar_Clientes = "salo.UDP_tbClientes_Update";
        public static string UDP_Borrar_Clientes = "salo.UDP_tbClientes_Delete";

        #endregion

        #region categorias

        public static string UDP_Listado_Categorias = "salo.UDP_tbCategorias_Listado";
        public static string UDP_Insertar_Categorias = "salo.UDP_tbCategorias_Insert";
        public static string UDP_Editar_Categorias = "salo.UDP_tbCategorias_Update";
        public static string UDP_Borrar_Categorias = "salo.UDP_tbCategorias_Delete";

        #endregion

        #region Servicios

        public static string UDP_Listado_Servicios = "salo.UDP_tbServicios_Listado";
        public static string UDP_Insertar_Servicios = "salo.UDP_tbServicios_Insert";
        public static string UDP_Editar_Servicios = "salo.UDP_tbServicios_Update";
        public static string UDP_Borrar_Servicios = "salo.UDP_tbServicios_Delete";

        #endregion

        #region Productos

        public static string UDP_Listado_Productos = "salo.UDP_tbProductos_Listado";
        public static string UDP_Insertar_Productos = "salo.UDP_tbProductos_Insert";
        public static string UDP_Editar_Productos = "salo.UDP_tbProductos_Update";
        public static string UDP_Borrar_Productos = "salo.UDP_tbProductos_Delete";

        #endregion

        #region Sucursales

        public static string UDP_Listado_Sucursales = "salo.UDP_tbSucursales_Listado";
        public static string UDP_Insertar_Sucursales = "salo.UDP_tbSucursales_Insert";
        public static string UDP_Editar_Sucursales = "salo.UDP_tbSucursales_Update";
        public static string UDP_Borrar_Sucursales = "salo.UDP_tbSucuesales_Delete";

        #endregion

        #region Reservaciones

        public static string UDP_Listado_Reservaciones = "salo.UDP_tbReservaciones_Listado";
        public static string UDP_Insertar_Reservaciones = "salo.UDP_tbReservaciones_Insert";
        public static string UDP_Editar_Reservaciones = "salo.UDP_tbReservaciones_Update";
        public static string UDP_Borrar_Reservaciones = "salo.UDP_tbReservaciones_Delete";

        #endregion

        #region MetodoPago

        public static string UDP_Listado_MetodoPago = "gnrl.UDP_tbMetodoPago_Listado";
        public static string UDP_Insertar_MetodoPago = "gnrl.UDP_tbMetodoPago_Insert";
        public static string UDP_Editar_MetodoPago = "gnrl.UDP_tbMetodoPago_Update";
        public static string UDP_Borrar_MetodoPago = "gnrl.UDP_tbMetodoPago_Delete";

        #endregion

        #region EstadoCiviles

        public static string UDP_Listado_EstadosCiviles = "gnrl.UDP_tbEstadoCiviles_Listado";
        public static string UDP_Insertar_EstadosCiviles = "gnrl.UDP_tbEstadoCiviles_Insert";
        public static string UDP_Editar_EstadosCiviles = "gnrl.UDP_tbEstadoCiviles_Update";
        public static string UDP_Borrar_EstadosCiviles = "gnrl.UDP_tbEstadoCiviles_Delete";

        #endregion

        #region Departamentos

        public static string UDP_Listado_Departamentos = "gnrl.UDP_tbDepartamentos_Listado";
        public static string UDP_Insertar_Departamentos = "gnrl.UDP_tbDepartamentos_Insert";
        public static string UDP_Editar_Departamentos = "gnrl.UDP_tbDepartamentos_Update";
        public static string UDP_Borrar_Departamentos  = "gnrl.UDP_tbDepartamentos_Delete";

        #endregion

        #region Municipios

        public static string UDP_Listado_Municipios = "gnrl.UDP_tbMunicipios_Listado";
        public static string UDP_Insertar_Municipios = "gnrl.UDP_tbMunicipios_Insert";
        public static string UDP_Editar_Municipios = "gnrl.UDP_tbMunicipios_Update";
        public static string UDP_Borrar_Municipios = "gnrl.UDP_tbMunicipiosDelete";

        #endregion

        #region Facturas

        public static string UDP_Listado_Facturas = "salo.UDP_salo_tbFacturas_Listado";
        public static string UDP_Insertar_Facturas = "salo.UDP_salo_tbFacturas_Insert";
        public static string UDP_Editar_Facturas = "salo.UDP_salo_tbFacturas_Update";
        public static string UDP_Borrar_Facturas = "salo.UDP_salo_tbFacturas_Delete";

        #endregion

        #region FacturasDetalle

        public static string UDP_Listado_FacturasDetalle = "salo.UDP_salo_FacturaDetalle_Listado";
        public static string UDP_Insertar_FacturasDetalle = "salo.UDP_salo_FacturaDetalle_Insert";
        public static string UDP_Editar_FacturasDetalle = "salo.UDP_salo_tbFacturaDetalle_Update";
        public static string UDP_Borrar_FacturasDetalle = "salo.UDP_salo_tbFacturasDetalle_Delete";

        #endregion

        #region ServiciosXProducto

        public static string UDP_Listado_ServiciosXProducto = "salo.UDP_salo_tbServiciosXProducto_Listado";
        public static string UDP_Insertar_ServiciosXProducto = "salo.UDP_salo_tbServiciosXProducto_Insert";
        public static string UDP_Editar_ServiciosXProducto = "salo.UDP_salo_tbServiciosXProducto_Update";
        public static string UDP_Borrar_ServiciosXProducto = "salo.UDP_salo_tbServiciosXProducto_Delete";

        #endregion

    }
}
