using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SalonDeBellezaCarlitos.WebUI.Models
{
    public class ClienteViewModel
    {

        [Display(Name = "Id")]
        public int clie_Id { get; set; }
        [Display(Name = "Nobre")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public string clie_Nombre { get; set; }
        [Display(Name = "Apellido")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public string clie_Apellido { get; set; }
        [Display(Name = "Telefono")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public string clie_Telefono { get; set; }
        [Display(Name = "Email")]
        public string clie_CorreoElectronico { get; set; }
        [Display(Name = "Fecha creacion")]
        public DateTime clie_FechaCreacion { get; set; }
        [Display(Name = "Usuario creacion")]
        public int clie_UsuarioCreacion { get; set; }
        [Display(Name = "Fecha modificacion")]
        public DateTime? clie_FechaModificacion { get; set; }
        [Display(Name = "Usuario modificacion")]
        public int? clie_UsuarioModificacion { get; set; }
        [Display(Name = "Estado")]
        public bool? clie_Estado { get; set; }

    }
}
