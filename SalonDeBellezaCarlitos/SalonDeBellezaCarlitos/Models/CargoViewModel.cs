using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SalonDeBellezaCarlitos.WebUI.Models
{
    public class CargoViewModel
    {
        [Display(Name = "Id")]
        public int carg_Id { get; set; }
        [Display(Name = "Cargo")]
        public string carg_Descripcion { get; set; }
        public DateTime carg_FechaCreacion { get; set; }
        public int carg_UsuarioCreacion { get; set; }
        public DateTime? carg_FechaModificacion { get; set; }
        public int? carg_UsuarioModificacion { get; set; }
        public bool? carg_Estado { get; set; }

    }
}
