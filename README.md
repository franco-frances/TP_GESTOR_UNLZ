# TP_GESTOR_UNLZ
Gestor de despedidas de soltero

Integrantes del equipo:
-Alvarez Eduardo
-Amaolo Franco
-Garcia Agustin
-Steinbach Fabrizio

------------------------------------------------------------------------------------------------------
Instrucciones:

1- Generar la base de datos con el Script que esta en la carpeta Gestor.Eventos.Servicios
2- Abrir la solucion del proyecto y ejecutar con el Visual Studio Community .net8
3- Ejecutar el proyecto a eleccion(webUsuario o webAdmin).

------------------------------------------------------------------------------------------------------

Base de datos:

-La base de datos fue creada de forma local tomando como patron la que se establecio en clases.

_connectionString = "Server=.\\SQLEXPRESS;Database=Eventos;Integrated Security=True;";

-Se uso Dapper para la conexion a la base de datos.

-------------------------------------------------------------------------------------------------------
Para disponer de los datos de la base en la interfaz de usuario se utilizo el patron de diseño MVC.
