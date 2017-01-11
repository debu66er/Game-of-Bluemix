<%@page language="java"%>
<%@page import="com.ibm.logica.Evento"%>
<%@page import="com.ibm.logica.Lista"%>
<%@page import="java.util.Iterator" %>
<%@page import="java.util.List"%>

<!DOCTYPE html>

<html lang="es">
	<head>
		<title>Game of Bluemix - Próximos eventos</title>
		<meta charset="UTF-8">
		<meta name="author" content="Noelia Herranz">
		<meta name="application-name" content="Martes de Bluemix">
		<meta name="keywords" content="IBM, Bluemix, Martes, Cloud">
		<link rel="stylesheet" href="./bluemix.css" type="text/css" media="all" />
		<link rel="icon" type="image/png" href="images/favicon.png">
	</head>
	
	<body>
		<div class="banner">
			<a class="titulo" href="index.html"><img src="images/bluemix-logo.png" style="padding-top:2px; vertical-align: middle;">&nbsp;&nbsp;&nbsp;&nbsp;Game of Bluemix </a>
			<div class="admin"><a class="enlace" href="/Administrador/index.jsp" target="_blank">Administrador</a></div>
			<div class="menu">
				<a class="enlace" href="eventos.jsp" style="padding-right: 10px;">Próximos eventos</a>
				<a class="enlace" href="enlaces.jsp" style="padding-left: 10px;">Enlaces de interés</a>
			</div>
		</div>

		<div class="cuerpo">
			<h1> Próximos eventos </h1><br><br>
			<%
				Lista proxEvs = new Lista();
				List<Evento> listEvs = proxEvs.getEventos();
				Iterator<Evento> iter = listEvs.iterator();
				Evento evento;
				
				while (iter.hasNext()) {
					evento = iter.next();
			%>
					<p align="center"><%= evento.getNombre() %> | <%= evento.getLugar() %> | <%= evento.getFecha() %>  -  Responsable: <%= evento.getResponsable() %> | <%= evento.getContacto() %></p>
			<%
				}
			%>
			<br> <br>
			<div style="text-align: center;">
				<a href="index.html"><button>Volver a inicio</button></a>
			</div>
		</div>
	</body>
</html>