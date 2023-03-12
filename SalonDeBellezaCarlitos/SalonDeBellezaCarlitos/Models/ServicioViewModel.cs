using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SalonDeBellezaCarlitos.WebUI.Models
{
    public class ServicioViewModel
    {

        [Display(Name = "Id")]
        public int serv_Id { get; set; }
        [Display(Name = "Nombre del Sercicio")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public string serv_Nombre { get; set; }
        [Display(Name = "Descripcion")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public string serv_Descripcion { get; set; }
        [Display(Name = "Precio")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public decimal serv_Precio { get; set; }
        [Display(Name = "Fecha creacion")]
        public DateTime serv_FechaCreacion { get; set; }
        [Display(Name = "Usuario Creacion")]
        public int serv_UsuarioCreacion { get; set; }
        [Display(Name = "Fecha modificacion")]
        public DateTime? serv_FechaModificacion { get; set; }
        [Display(Name = "Usuario Modificacion")]
        public int? serv_UsuarioModificacion { get; set; }
        [Display(Name = "Estado")]
        public bool? serv_Estado { get; set; }

    }
}
