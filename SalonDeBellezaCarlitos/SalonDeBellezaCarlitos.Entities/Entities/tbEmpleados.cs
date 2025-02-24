﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;

#nullable disable

namespace SalonDeBellezaCarlitos.Entities.Entities
{
    public partial class tbEmpleados
    {
        public tbEmpleados()
        {
            tbFacturasempl_Id_AtendidoNavigation = new HashSet<tbFacturas>();
            tbFacturasempl_Id_CajaNavigation = new HashSet<tbFacturas>();
        }

        public int empl_Id { get; set; }
        public string empl_Nombre { get; set; }
        public string empl_Apellido { get; set; }
        public string empl_Sexo { get; set; }
        public int muni_Id { get; set; }
        public string empl_DireccionExacta { get; set; }
        public int estc_Id { get; set; }
        public string empl_Telefono { get; set; }
        public string empl_CorreoElectronico { get; set; }
        public DateTime empl_FechaNacimiento { get; set; }
        public DateTime empl_FechaContratacion { get; set; }
        public int carg_Id { get; set; }
        public DateTime empl_FechaCreacion { get; set; }
        public int empl_UsuarioCreacion { get; set; }
        public DateTime? empl_FechaModificacion { get; set; }
        public int? empl_UsuarioModificacion { get; set; }
        public bool? empl_Estado { get; set; }

        public virtual tbCargos carg { get; set; }
        public virtual tbUsuarios empl_UsuarioCreacionNavigation { get; set; }
        public virtual tbUsuarios empl_UsuarioModificacionNavigation { get; set; }
        public virtual tbEstadosCiviles estc { get; set; }
        public virtual tbMunicipios muni { get; set; }
        public virtual tbUsuarios tbUsuarios { get; set; }
        public virtual ICollection<tbFacturas> tbFacturasempl_Id_AtendidoNavigation { get; set; }
        public virtual ICollection<tbFacturas> tbFacturasempl_Id_CajaNavigation { get; set; }
    }
}