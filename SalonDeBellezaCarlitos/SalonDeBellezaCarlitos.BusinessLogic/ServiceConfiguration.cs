using Microsoft.Extensions.DependencyInjection;
using SalonDeBellezaCarlitos.BusinessLogic.Services;
using SalonDeBellezaCarlitos.DataAccess.Repository;
using SalonDeBellezaCarlitos.DataAccess;

using System;
using System.Collections.Generic;
using System.Text;

namespace SalonDeBellezaCarlitos.BusinessLogic
{
    public static class ServiceConfiguration
    {

        public static void DataAccess(this IServiceCollection service, string connectionString) 
        {
            service.AddScoped<CargoRepository>();
            service.AddScoped<EmpleadoRepository>();

            
            SalonCarlitosContext.BuildConnectionString(connectionString);

        }

        public static void BusinessLogic(this IServiceCollection service) 
        {
            service.AddScoped<GeneralesServices>();
        }

    }
}
