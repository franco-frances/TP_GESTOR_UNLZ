using GestorEventos.Servicios.Entidades;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;
using Dapper;

namespace GestorEventos.Servicios.Servicios
{
    public interface IEventoService
    {
        bool DeleteEvento(int idEvento);
        IEnumerable<Evento> GetAllEventos();
        IEnumerable<EventoViewModel> GetAllEventosViewModel();
        IEnumerable<EventoViewModel> GetMisEventos(int idUsuario);
        Evento GetEventoPorId(int IdEvento);
        int PostNuevoEvento(Evento evento);
        bool PutNuevoEvento(int idEvento, Evento evento);
        public Task<bool> AprobarRechazarEvento(int idEvento, int idEstadoEventos);
    }

    public class EventoService : IEventoService
    {
        private string _connectionString;



        public EventoService()
        {

            //Connection string 
            _connectionString = "Server=.\\SQLEXPRESS;Database=Eventos;Integrated Security=True;";
             

        }


        public IEnumerable<Evento> GetAllEventos()
        {
            using (IDbConnection db = new SqlConnection(_connectionString))
            {
                List<Evento> eventos = db.Query<Evento>("SELECT * FROM Eventos WHERE Borrado = 0").ToList();

                return eventos;

            }
        }

        public IEnumerable<EventoViewModel> GetMisEventos(int idUsuario)
        {
            using (IDbConnection db = new SqlConnection(_connectionString))
            {
                List<EventoViewModel> eventos = db.Query<EventoViewModel>("Select Eventos.*, EstadoEventos.descripcion EstadoEvento from Eventos left join EstadoEventos on EstadoEventos.id= eventos.IdEstadoEventos WHERE Eventos.IdUsuario =" + idUsuario.ToString()).ToList();

                return eventos;

            }
        }

        public IEnumerable<EventoViewModel> GetAllEventosViewModel()
        {
            using (IDbConnection db = new SqlConnection(_connectionString))
            {
                List<EventoViewModel> eventos = db.Query<EventoViewModel>("Select Eventos.*, EstadoEventos.descripcion EstadoEvento from Eventos left join EstadoEventos on EstadoEventos.id= eventos.IdEstadoEventos").ToList();

                return eventos;

            }
        }




        public Evento GetEventoPorId(int IdEvento)
        {

            using (IDbConnection db = new SqlConnection(_connectionString))
            {
                Evento eventos = db.Query<Evento>("SELECT * FROM Eventos WHERE Borrado = 0").First();

                return eventos;

            }
        }

        public int PostNuevoEvento(Evento evento)
        {

            try
            {
                using (IDbConnection db = new SqlConnection(_connectionString))
                {

                    string query = "insert into Eventos (NombreEvento, FechaEvento, CantidadPersonas, IdPersonaAgasajada, IdTipoEvento, Visible, Borrado, IdUsuario, IdEstadoEventos) values ( @NombreEvento, @FechaEvento, @CantidadPersonas, @IdPersonaAgasajada, @IdTipoEvento, @Visible, @Borrado, @IdUsuario, @IdEstadoEvento);"+
                        "select  CAST(SCOPE_IDENTITY() AS INT) ";
                    evento.IdEvento=db.QuerySingle<int>(query, evento);
                    //Faltan insertar datos en la base de datos en EstadodeEvento

                    return evento.IdEvento;
                }
            }
            catch (Exception ex)
            {
                return 0;
            }


        }


        public async Task<bool> AprobarRechazarEvento(int idEvento, int idEstadoEventos)
        {
            try
            {
                using (IDbConnection db = new SqlConnection(_connectionString))
                {

                    string query = "UPDATE Eventos set IdEstadoEventos = " + idEstadoEventos.ToString() + "WHERE IdEvento=" + idEvento.ToString();
                    await db.ExecuteAsync(query);

                    return true;
                }
            }
            catch (Exception ex)
            {
                return false;
            }
        }


        public bool PutNuevoEvento(int idEvento, Evento evento)
        {

            try
            {
             /*   var eventoDeLista = this.Eventos.Where(x => x.IdEvento == idEvento).First(); //LINQ

                eventoDeLista.FechaEvento = evento.FechaEvento;
                eventoDeLista.NombreEvento = evento.NombreEvento;
                eventoDeLista.CantidadPersonas = evento.CantidadPersonas;
                eventoDeLista.IdUsuario= evento.IdUsuario;
                eventoDeLista.IdPersonaAgasajada = evento.IdPersonaAgasajada;
             */

                /*Update de la base*/

                /*Variable 
				 
					Nombre 
					Valor 
					Espacio en memoria 
					puntero de referencia a ese espacio en memoria 


				 */

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }

        }
 

        public bool DeleteEvento(int idEvento)
        {

            /*
			 2xx = Respuestas OK 
			 3xx = Error de datos  <<- No lo usé 
			 4xx = Errores de la aplicación pero son resultados de una mala petición 
			 5xx = Errores del servidor. 
			 */
            try
            {
          /*      var eventoAEliminar = this.Eventos.Where(x => x.IdEvento == idEvento).First();

                var listaEventos = this.Eventos.ToList();

                /*Borrado Fisico*/
              /*  listaEventos.Remove(eventoAEliminar);


                /*Borrado Logico*/
                /*eventoAEliminar.Visible = false;
                */


                //	this.Eventos.ToList().Remove(eventoAEliminar);

                //this.Eventos.ToList().Remove(x => x.idEvento == idEvento);

                return true;
            }

            catch (Exception ex)
            {

                return false;

            }
        }
        /*
		public void PostNuevoEventoCompleto(EventoModel eventoModel)
		{
			PersonaService personaService = new PersonaService();
			int idPersonaAgasajada = personaService.AgregarNuevaPersona(eventoModel.PersonaAgasajada);
			int idPersonaContacto = personaService.AgregarNuevaPersona(eventoModel.PersonaContacto);


			eventoModel.evento.IdPersonaAgasajada = idPersonaAgasajada;
			eventoModel.evento.IdPersonaContacto = idPersonaContacto;
			eventoModel.evento.Visible = true;

			this.PostNuevoEvento(eventoModel.evento);

			foreach(Servicio servicio in eventoModel.ListaDeServiciosContratados)
			{
				ServicioService servicioService = new ServicioService();
				servicioService.AgregarNuevoServicio(servicio);
			}



		}*/
    }
}
