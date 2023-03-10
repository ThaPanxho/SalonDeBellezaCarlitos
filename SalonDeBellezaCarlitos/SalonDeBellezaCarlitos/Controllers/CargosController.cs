using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using SalonDeBellezaCarlitos.BusinessLogic.Services;
using SalonDeBellezaCarlitos.Entities.Entities;
using SalonDeBellezaCarlitos.WebUI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SalonDeBellezaCarlitos.WebUI.Controllers
{
    public class CargosController : Controller
    {

        private readonly GeneralesServices _generalesService;

        private readonly IMapper _mapper;

        public CargosController(GeneralesServices generalesServices, IMapper mapper)
        {
            _generalesService = generalesServices;
            _mapper = mapper;
        }


        [HttpGet("/Cargos/Listado")]
        public IActionResult Index()
        {

            var listado = _generalesService.ListadoCargos(out string error);
            var listadoMapeado = _mapper.Map<IEnumerable<CargoViewModel>>(listado);

            if (string.IsNullOrEmpty(error))
            {
                ModelState.AddModelError("", error);
            }

            return View(listadoMapeado);
        }


        [HttpGet("/Cargos/Crear")]
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost("/Cargos/Crear")]
        public ActionResult Create(CargoViewModel cargo)
        {
            var result = 0;
            var car = _mapper.Map<tbCargos>(cargo);
            result = _generalesService.InsertarCargo(car);

            if (result == 0)
            {
                ModelState.AddModelError("", "Ocurrió un error al Crear este registro");
                return View();
            }
            return RedirectToAction("Listado");
        }
    }
}
