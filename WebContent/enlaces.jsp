<%@page language="java"%>
<%@page import="com.ibm.logica.Lista" %>
<%@page import="com.ibm.logica.Enlace" %>
<%@page import="java.util.Iterator" %>
<%@page import="java.util.List"%>

<!DOCTYPE html>

<html lang="es">
	<head>
		<title>Game of Bluemix - Enlaces de inter�s</title>
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
			<div class="admin"><a class="enlace" href="http://adminbmsl.mybluemix.net/" target="_blank">Administrador</a></div>
			<div class="menu">
				<a class="enlace" href="eventos.jsp" style="padding-right: 10px;">Pr�ximos eventos</a>
				<a class="enlace" href="enlaces.jsp" style="padding-left: 10px;">Enlaces de inter�s</a>
			</div>
		</div>

		<div class="cuerpo">
			<h1> Enlaces de inter�s </h1>
			<%
				Lista enlaces = new Lista();
				List<Enlace> links = enlaces.getLink();
				Iterator<Enlace> iter = links.iterator();
				Enlace link;
				
				String catActual = "";
				
				while (iter.hasNext()) {
					link = iter.next();
					
					if (!catActual.equals(link.getCategoria())) {
						catActual = link.getCategoria();
			%>
						<br><h2 align="center"><%= catActual %></h2>
			<%	
					}
			%>
					<p align="center"><a href="<%= link.getLink() %>" class="enlace" target="_blank"><%= link.getAlias() %></a></p>
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