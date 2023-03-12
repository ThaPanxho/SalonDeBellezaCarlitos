using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SalonDeBellezaCarlitos.WebUI.Models
{
    public class UsuariosViewModel
    {
        [Display(Name = "Id")]
        public int usur_Id { get; set; }
        [Display(Name = "Usuario")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public string usur_Usuario { get; set; }
        [Display(Name = "Contraseña")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public string usur_Contrasenia { get; set; }
        [Display(Name = "Empleado")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public int empl_Id { get; set; }
        [Display(Name = "Usuario Creacion")]
        public int usur_UsuarioCreacion { get; set; }
        [Display(Name = "Fecha Creacion")]
        public DateTime usur_FechaCreacion { get; set; }
        [Display(Name = "Usuario Modificacion")]
        public int? usur_UsuarioModificacion { get; set; }
        [Display(Name = "Fecha Modificacion")]
        public DateTime? usur_FechaModificacion { get; set; }
        [Display(Name = "Estado")]
        public bool? usur_Estado { get; set; }


    }
}
