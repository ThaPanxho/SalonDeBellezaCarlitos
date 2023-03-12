using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SalonDeBellezaCarlitos.WebUI.Models
{
    public class EstadoCivilViewModel
    {

        [Display(Name = "Id")]
        public int estc_Id { get; set; }
        [Display(Name = "Descripcion")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public string estc_Descripcion { get; set; }
        [Display(Name = "Fecha Creacion")]
        public DateTime estc_FechaCreacion { get; set; }
        [Display(Name = "Usuario Creacion")]
        public int estc_UsuarioCreacion { get; set; }
        [Display(Name = "Fecha Modificacion")]
        public DateTime? estc_FechaModificacion { get; set; }
        [Display(Name = "Usuario Modificacion")]
        public int? estc_UsuarioModificacion { get; set; }
        [Display(Name = "Estado")]
        public bool? estc_Estado { get; set; }
    }
}
