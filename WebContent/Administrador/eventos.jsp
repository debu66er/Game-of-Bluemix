<%@page language="java"%>
<%@page import="java.util.Iterator" %>
<%@page import="java.util.List"%>
<%@page import="com.ibm.logica.modelo.Evento" %>
<%@page import="com.ibm.logica.gestion.gEventos" %>

<!DOCTYPE html>

<html lang="es">
	<head>
		<title>Administrador - Gesti�n de Eventos</title>
		<meta charset="UTF-8">
		<meta name="author" content="Noelia Herranz & Mauro Lucchini">
		<meta name="application-name" content="Administraci�n">
		<meta name="keywords" content="IBM, Bluemix, SoftLayer, Lunes, Jueves, Cloud">
		<link rel="stylesheet" href="/Administrador/admin.css" type="text/css" media="all"/>
		<link rel="icon" type="image/png" href="images/favicon.png">
	</head>
	
	<div class="banner">
		<a class="enlace" href="http://gameofbluemix.mybluemix.net/"><img src="images/bluemix-logo.png" style="padding-top:2px; vertical-align: middle;">&nbsp;&nbsp;&nbsp;&nbsp;Game of Bluemix </a>
		<div class="admin">
			<a class="enlace" href="/Administrador/index.jsp"> Administrador </a>
		</div>
	</div>
	
	<body>
		<% String user =(String) request.getSession().getAttribute("userName");
	    if (user==null){
	       RequestDispatcher rs = request.getServletContext().getRequestDispatcher("/Administrador/index.jsp"); 
	        rs.forward(request, response);
   		 }%>
		<div class="cuerpo">
			<h1> Gesti�n de eventos </h1>
			<%
				HttpSession s = request.getSession();
				gEventos eventos = new gEventos();
				
				List<Evento> evs = eventos.getEvento();
				Iterator<Evento> iter = evs.iterator();
				Evento evento;

				
				String catActual = "";
				int nEvs = 0;
				
				while (iter.hasNext()) {
					evento = iter.next();
					nEvs++;
			%>
					<form action="/gestion" method="post">
						<div align="center">
							<%= evento.getNombre() %> | <%= evento.getLugar() %> | <%= evento.getFecha() %>  -  Responsable: <%= evento.getResponsable() %> | <%= evento.getContacto() %> <% if (evento.getOculto().equals("yes")) { %> (O) <% } %>
							<% String accion = "accion" + nEvs; %>
							<input type="hidden" name="pagina" value="eventos">		
											
							<input type="hidden" name="nombre" value="<%= evento.getNombre() %>">
							<input type="hidden" name="lugar" value="<%= evento.getLugar() %>">
							<input type="hidden" name="fecha" value="<%= evento.getFecha() %>">
							<input type="hidden" name="responsable" value="<%= evento.getResponsable() %>">
							<input type="hidden" name="contacto" value="<%= evento.getContacto() %>">
							<input type="hidden" name="oculto" value="<%= evento.getOculto() %>">
							
							<input type="hidden" name="accion" id="<%= accion %>" value="novalue">&nbsp;&nbsp;
							<input type="image" src="images/editar.png" alt="Editar" onClick="document.getElementById('<%= accion %>').value='editar';">
							<input type="image" src="images/eliminar.png" alt="Eliminar" onClick="document.getElementById('<%= accion %>').value='eliminar'; return confirm('�Est�s seguro de que deseas eliminar este evento?');">
						</div>
					</form>
			<%
				}
			%>
			<br> <br>
			<div style="text-align: center;">
				<a href="aniadirEvento.jsp"><button>A�adir nuevo evento</button></a>
			</div>
		</div>
	</body>
</html>