using SalonDeBellezaCarlitos.DataAccess.Repository;
using SalonDeBellezaCarlitos.Entities.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SalonDeBellezaCarlitos.BusinessLogic.Services
{
    public class GeneralesServices
    {
        private readonly CargoRepository _CargoRepository;
        private readonly EmpleadoRepository _EmpleadoRepository;

        public GeneralesServices(CargoRepository CargoRepository, EmpleadoRepository EmpleadoRepository) 
        {
            _CargoRepository = CargoRepository;
            _EmpleadoRepository = EmpleadoRepository;
        }

        #region Cargos

        public IEnumerable<tbCargos> ListadoCargos(out string error)
        {
            error = string.Empty;
            try
            {
                return _CargoRepository.List();
            }
            catch (Exception e)
            {
                error = e.Message;
                return Enumerable.Empty<tbCargos>();
            }
        }

        public int InsertarCargo(tbCargos item)
        {

            try
            {
                var resultado = _CargoRepository.Insert(item);

                return resultado;
            }
            catch (Exception)
            {
                return 0;
            }

        }


        #endregion
        #region Empleados


        public IEnumerable<tbEmpleados> ListadoEmpleados(out string error)
        {
            error = string.Empty;
            try
            {
                return _EmpleadoRepository.List();
            }
            catch (Exception e)
            {
                error = e.Message;
                return Enumerable.Empty<tbEmpleados>();
            }
        }

        public int InsertarEmpleado(tbEmpleados item)
        {

            try
            {
                var resultado = _EmpleadoRepository.Insert(item);

                return resultado;
            }
            catch (Exception)
            {
                return 0;
            }

        }


        #endregion

    }
}
