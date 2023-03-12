using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using SalonDeBellezaCarlitos.BusinessLogic.Services;
using SalonDeBellezaCarlitos.WebUI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SalonDeBellezaCarlitos.WebUI.Controllers
{
    public class UsuarioController : Controller
    {
        private readonly GeneralesServices _generalesService;

        private readonly IMapper _mapper;


        public UsuarioController(GeneralesServices generalesServices, IMapper mapper)
        {
            _generalesService = generalesServices;
            _mapper = mapper;
        }


        [HttpGet("/Usuarios/Listado")]
        public IActionResult Index()
        {
            var listado = _generalesService.ListadoUsuarios(out string error);

            var listadoMapeado = _mapper.Map<IEnumerable<UsuariosViewModel>>(listado);

            if (string.IsNullOrEmpty(error))
            {
                ModelState.AddModelError("", error);
            }

            return View(listadoMapeado);
        }
    }
}
