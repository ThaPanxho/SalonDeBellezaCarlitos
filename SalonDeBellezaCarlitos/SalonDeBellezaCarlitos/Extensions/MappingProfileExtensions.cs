using AutoMapper;
using SalonDeBellezaCarlitos.Entities.Entities;
using SalonDeBellezaCarlitos.WebUI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SalonDeBellezaCarlitos.WebUI.Extensions
{
    public class MappingProfileExtensions: Profile
    {
        public MappingProfileExtensions()
        {
            CreateMap<CargoViewModel, tbCargos>().ReverseMap();
            CreateMap<EmpleadoViewModel, tbEmpleados>().ReverseMap();
            CreateMap<UsuariosViewModel, tbUsuarios>().ReverseMap();
            CreateMap<ServicioViewModel, tbServicios>().ReverseMap();

        }
    }
}
