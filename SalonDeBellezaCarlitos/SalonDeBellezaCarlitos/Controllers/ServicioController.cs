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
    public class ServicioController : Controller
    {
        private readonly GeneralesServices _generalesService;

        private readonly IMapper _mapper;


        public ServicioController(GeneralesServices generalesServices, IMapper mapper)
        {
            _generalesService = generalesServices;
            _mapper = mapper;
        }


        [HttpGet("/Servicios/Listado")]
        public IActionResult Index()
        {
            var listado = _generalesService.ListadoServicios(out string error);

            var listadoMapeado = _mapper.Map<IEnumerable<ServicioViewModel>>(listado);

            if (string.IsNullOrEmpty(error))
            {
                ModelState.AddModelError("", error);
            }

            return View(listadoMapeado);
        }
    }
}
