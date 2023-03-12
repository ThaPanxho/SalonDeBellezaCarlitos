using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SalonDeBellezaCarlitos.WebUI.Models
{
    public class DepartamentoViewModel
    {
        [Display(Name = "Id")]
        public int depa_Id { get; set; }
        [Display(Name = "Nombre")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public string depa_Descripcion { get; set; }
        [Display(Name = "Codigo")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public string depa_Codigo { get; set; }
        [Display(Name = "Fecha Creacion")]
        public DateTime depa_FechaCreacion { get; set; }
        [Display(Name = "Usuario Creacion")]
        public int depa_UsuarioCreacion { get; set; }
        [Display(Name = "Fecha Modificacion")]
        public DateTime? depa_FechaModificacion { get; set; }
        [Display(Name = "Usuario Modificacion")]
        public int? depa_UsuarioModificacion { get; set; }
        [Display(Name = "Estado")]
        public bool? depa_Estado { get; set; }

    }
}
