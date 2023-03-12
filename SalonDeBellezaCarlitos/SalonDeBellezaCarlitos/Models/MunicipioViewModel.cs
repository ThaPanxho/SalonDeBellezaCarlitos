using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SalonDeBellezaCarlitos.WebUI.Models
{
    public class MunicipioViewModel
    {
        [Display(Name = "Id")]
        public int muni_Id { get; set; }
        [Display(Name = "Nombre")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public string muni_Descripcion { get; set; }
        [Display(Name = "Codigo de municipio")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public string muni_Codigo { get; set; }
        [Display(Name = "Departamento")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public int depa_Id { get; set; }
        [Display(Name = "Fecha Creacion")]
        public DateTime muni_FechaCreacion { get; set; }
        [Display(Name = "Usuario Creacion")]
        public int muni_UsuarioCreacion { get; set; }
        [Display(Name = "Fecha Modificacion")]
        public DateTime? muni_FechaModificacion { get; set; }
        [Display(Name = "Usuario Modificacion")]
        public int? muni_UsuarioModificacion { get; set; }
        [Display(Name = "Estado")]
        public bool? muni_Estado { get; set; }
    }
}
