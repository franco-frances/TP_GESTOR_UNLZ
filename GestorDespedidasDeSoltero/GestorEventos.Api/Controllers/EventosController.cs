using GestorEventos.Servicios.Entidades;
using GestorEventos.Servicios.Servicios;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace GestorEventos.Api.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class EventosController : ControllerBase
	{
        private IEventoService eventoService;
        

        public EventosController(IEventoService _eventoService)
        {
            this.eventoService = _eventoService;
            
        }
        /// <summary>
        /// Traerá todos los eventos
        /// </summary>
        /// <returns></returns>
        [HttpGet]
		public IActionResult GetEventos()
		{
			

			return Ok(eventoService.GetAllEventosViewModel());
		}

		/// <summary>
		/// Traerá solo un evento según el Id del Evento
		/// </summary>
		/// <param name="idEvento"> Id del Evento</param>
		/// <returns></returns>
		[HttpGet("{idEvento:int}")]
		public IActionResult GetEventosPorId(int idEvento)
		{
			

			var evento = eventoService.GetEventoPorId(idEvento);

			if (evento == null)
				return NotFound();
			else
				return Ok(evento);
		}

		[HttpPost("Nuevo")]
		public IActionResult PostNuevoEvento([FromBody] Evento evento)
		{
			
			 


			int resultado = eventoService.PostNuevoEvento(evento);

			if (resultado > 0)
			{

				return Ok();
			}
			else
			{
				return UnprocessableEntity();
			}


		}

		/*

		[HttpPost("NuevoEventoCompleto")]
		public IActionResult PostNuevoEventoModel([FromBody] EventoModel evento)
		{
			EventoService eventoService = new EventoService();

			eventoService.PostNuevoEventoCompleto(evento);

			return Ok();



			/*
			 Evento --> 2 personas 
					--> Lista de Servicios
			 
			 */


/*			bool resultado = eventoService.PostNuevoEvento(evento);

			if (resultado)
			{

				return Ok();
			}
			else
			{
				return UnprocessableEntity();
			}

		}*/


		[HttpPut("{idEvento:int}/Modificar")]

		public IActionResult PutNuevoEvento(int idEvento, [FromBody] Evento evento)
		{
			
			bool resultado = eventoService.PutNuevoEvento(idEvento, evento);

			if (resultado)
			{

				return Ok();
			}
			else
			{
				return UnprocessableEntity(); //422 
				//debio dar un InternalServer error (500) 

			}

		}


		[HttpDelete("{idEvento:int}/Borrar")]
		public IActionResult DeleteEvento(int idEvento)
		{

			
			bool resultado = eventoService.DeleteEvento(idEvento);

			if (resultado)
			{
				return Ok();
			}
			else 
			{ 
				return UnprocessableEntity(); 
			}

		}


		/*
		 * 
		 * ,  delete – darse de baja)

		 
		 */


		/*
		 
		 
		 Primitivos 
		 { 
			int  = 1 
			string  = "caracter"
			char  = 'a'
			decimal  = 1002.5
			long = 498984984984984984984
			bool = false / true 



		 }
		
	     Clase { 
			string descripcion 
			int id 
			
		} 
		Clase objeto = new Clase ()  <--- Molde para generar variables 
			objeto.descripcion = "Hola";
			objeto.id = 1; 



		Listas ( IEnumerable ) 

			Listas =  List<Clase> listaNueva = new List<Clase>();  
			array o vectores = Clase[] arrayDeClases = []; 

			IEnumerable
			
			pilas 
			colas 
			
			

		
		 
		 */


	}
}
