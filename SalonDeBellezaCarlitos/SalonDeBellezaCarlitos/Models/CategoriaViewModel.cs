using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SalonDeBellezaCarlitos.WebUI.Models
{
    public class CategoriaViewModel
    {

        [Display(Name = "Id")]
        public int cate_Id { get; set; }
        [Display(Name = "Descripcion")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public string cate_Descripcion { get; set; }
        [Display(Name = "Fecha creacion")]
        public DateTime cate_FechaCreacion { get; set; }
        [Display(Name = "Usuario creacion")]
        public int cate_UsuarioCreacion { get; set; }
        [Display(Name = "Fecha modificacion")]
        public DateTime? cate_FechaModificacion { get; set; }
        [Display(Name = "Usuario modificacion")]
        public int? cate_UsuarioModificacion { get; set; }
        [Display(Name = "Estado")]
        public bool? cate_Estado { get; set; }

    }
}
