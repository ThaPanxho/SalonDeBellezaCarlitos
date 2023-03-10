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
    public class EmpleadosController : Controller
    {

        private readonly GeneralesServices _generalesService;

        private readonly IMapper _mapper;

        
        public EmpleadosController(GeneralesServices generalesServices, IMapper mapper)
        {
            _generalesService = generalesServices;
            _mapper = mapper;
        }


        [HttpGet("/Empleados/Listado")]
        public IActionResult Index()
        {
            var listado = _generalesService.ListadoEmpleados(out string error);
            var listadoMapeado = _mapper.Map<IEnumerable<EmpleadoViewModel>>(listado);

            if (string.IsNullOrEmpty(error))
            {
                ModelState.AddModelError("", error);
            }

            return View(listadoMapeado);
        }



        [HttpGet("/Empleados/Crear")]
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost("/Empleados/Crear")]
        public ActionResult Create(EmpleadoViewModel empleado)
        {
            var result = 0;
            var emp = _mapper.Map<tbEmpleados>(empleado);
            result = _generalesService.InsertarEmpleado(emp);

            if (result == 0)
            {
                ModelState.AddModelError("", "Ocurrió un error al Crear este registro");
                return View();
            }
            return RedirectToAction("Listado");
        }

    }
}
