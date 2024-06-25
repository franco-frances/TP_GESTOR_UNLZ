using GestorEventos.Servicios.Entidades;
using GestorEventos.Servicios.Servicios;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.VisualBasic;
using System.Collections.ObjectModel;

namespace GestorEventos.WebUsuario.Controllers
{
    [Authorize]
    public class EventosController : Controller
    {
        private IEventoService eventoService;
        private IPersonaService personaService;
        private IServicioService servicioService;
        private IEventoServiciosService eventoServicioService;

        public EventosController(IEventoService _eventoService, IPersonaService _personaService,IServicioService _servicioService, IEventoServiciosService _eventoServiciosService)
        {
            this.eventoService = _eventoService;
            this.personaService = _personaService;
            this.servicioService = _servicioService;
            this.eventoServicioService= _eventoServiciosService;
        }

        // GET: EventosController
        public ActionResult Index()
        {
            int idUsuario = int.Parse(
                    HttpContext.User.Claims.First(x => x.Type == "usuarioSolterout").Value);

            var eventos = this.eventoService.GetMisEventos(idUsuario);

            return View(eventos);
        }

        // GET: EventosController/Details/5
        public ActionResult Details(int id)
        {
            int idUsuario=  int.Parse(HttpContext.User.Claims.First(x => x.Type == "usuarioSolterout").Value);

            var evento = this.eventoService.GetMisEventos(idUsuario).First(x=> x.IdEvento==id);

            var listaServiciosDisponible = servicioService.GetServicios();
            var listaServiciosContratados = eventoServicioService.GetServiciosPorEvento(evento.IdEvento);

            List<Servicio> listaServicios = new List<Servicio>();
            foreach (var servicio in listaServiciosContratados)
            {
                var servicioContratado = listaServiciosDisponible.First(x => x.IdServicio == servicio.IdServicio);
                if (servicioContratado != null)
                {
                    listaServicios.Add(servicioContratado);
                }
            }

            ViewData["ListaServicios"] = listaServicios;


            return View(evento);
        }

        // GET: EventosController/Create
        public ActionResult Create()
        {
            var evento = new EventoModel();
            evento.listaDeServicios = this.servicioService.GetServicios();


            return View(evento);
        }

        // GET: EventosController/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        } 

            // POST: EventosController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(IFormCollection collection)
        {
            try
            {

                /*
                 provincia
                 localidad
                 Codigopostal 
                 Calle --> KM28 Segundo camino al fondo
                -numero  -- 
                 piso opcional 
                 depto opcional 

                 */


                Persona personaAgasajada = new Persona();
                personaAgasajada.Nombre = collection["Nombre"].ToString();
                personaAgasajada.Apellido = collection["Apellido"].ToString();
                personaAgasajada.Email = collection["Email"].ToString();
                personaAgasajada.Telefono = collection["Telefono"].ToString();
                personaAgasajada.Borrado = false;
                personaAgasajada.Direccion = collection["Direccion"].ToString();

                int IdPersonaAgasajada = personaService.AgregarNuevaPersona(personaAgasajada);
                

                
                
                Evento eventoNuevo = new Evento();
                eventoNuevo.IdPersonaAgasajada = IdPersonaAgasajada;

                eventoNuevo.CantidadPersonas = int.Parse(collection["CantidadPersonas"].ToString());
                eventoNuevo.Visible = true;
                eventoNuevo.IdUsuario = int.Parse(HttpContext.User.Claims.First(x=> x.Type=="usuarioSolterout").Value); // HttpContext.User.Identity.Id;
                eventoNuevo.FechaEvento = DateTime.Parse(collection["FechaEvento"].ToString());
                eventoNuevo.IdTipoEvento = int.Parse(collection["IdTipoEvento"].ToString());
                eventoNuevo.NombreEvento = collection["NombreEvento"].ToString();
                eventoNuevo.IdEstadoEvento = 3; //Pendiente de Aprobacion


                int idEventoNuevo=this.eventoService.PostNuevoEvento(eventoNuevo);

                foreach (var idServicio in (collection["Servicio"]))
                {
                    EventosServicios relacionEventoServicio = new EventosServicios();

                    relacionEventoServicio.IdEvento = idEventoNuevo;
                    relacionEventoServicio.IdServicio = int.Parse(idServicio.ToString());
                    relacionEventoServicio.Borrado = false;


                    this.eventoServicioService.PostNuevoEventoServicio(relacionEventoServicio);
                }
                

                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: EventosController/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: EventosController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        

        // POST: EventosController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }
    }
}
