using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SalonDeBellezaCarlitos.WebUI.Models
{
    public class EmpleadoViewModel
    {
        [Display(Name = "Id")]
        public int empl_Id { get; set; }
        [Display(Name = "Nombre")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public string empl_Nombre { get; set; }
        [Display(Name = "Apellido")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public string empl_Apellido { get; set; }
        [Display(Name = "Sexo")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public string empl_Sexo { get; set; }
        [Display(Name = "Municipio")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public int muni_Id { get; set; }
        [Display(Name = "Direccion Exacta")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public string empl_DireccionExacta { get; set; }
        [Display(Name = "Estado Civil")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public int estc_Id { get; set; }
        [Display(Name = "Telefono")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public string empl_Telefono { get; set; }
        [Display(Name = "Email")]
        public string empl_CorreoElectronico { get; set; }
        [Display(Name = "Fecha de Nacimineto")]
        public DateTime empl_FechaNacimiento { get; set; }
        [Display(Name = "Fecha de contratacion")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public DateTime empl_FechaContratacion { get; set; }
        [Display(Name = "Cargo")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public int carg_Id { get; set; }
        [Display(Name = "Fecha Creacion")]
        public DateTime empl_FechaCreacion { get; set; }
        [Display(Name = "Usuario Creacion")]
        public int empl_UsuarioCreacion { get; set; }
        [Display(Name = "Fecha Modificacion")]
        public DateTime? empl_FechaModificacion { get; set; }
        [Display(Name = "Usuario Modificacion")]
        public int? empl_UsuarioModificacion { get; set; }
        [Display(Name = "Estado")]
        public bool? empl_Estado { get; set; }

    }
}
