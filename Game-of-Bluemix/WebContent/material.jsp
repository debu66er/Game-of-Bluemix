<%@page language="java"%>
<%@page import="com.ibm.logica.Lista" %>
<%@page import="com.ibm.logica.Material" %>
<%@page import="java.util.Iterator" %>
<%@page import="java.util.List"%>

<!DOCTYPE html>

<html lang="es">
	<head>
		<title>Martes de Bluemix - Material</title>
		<meta charset="UTF-8">
		<meta name="author" content="Noelia Herranz">
		<meta name="application-name" content="Martes de Bluemix">
		<meta name="keywords" content="IBM, Bluemix, Martes, Cloud">
		<link rel="stylesheet" href="./bluemix.css" type="text/css" media="all" />
		<link rel="icon" type="image/png" href="images/favicon.png">
	</head>
	
	<body>
		<div class="banner">
			<a class="titulo" href="index.html"><img src="images/bluemix-logo.png" style="padding-top:2px; vertical-align: middle;">&nbsp;&nbsp;&nbsp;&nbsp;Martes de Bluemix </a>
			<div class="admin"><a class="enlace" href="http://adminbmsl.mybluemix.net/" target="_blank">Administrador</a></div>
			<div class="menu">
				<a class="enlace" href="eventos.jsp" style="padding-right: 10px;">Próximos eventos</a>
				<a class="enlace" href="enlaces.jsp" style="padding-left: 10px;">Enlaces de interés</a>
			</div>
		</div>

		<div class="cuerpo">
			<h1> Material </h1>
			<%
				Lista lMaterial = new Lista();
				List<Material> mat = lMaterial.getMaterial();
				Iterator<Material> iter = mat.iterator();
				Material material;
				
				String catActual = "";
				
				while (iter.hasNext()) {
					material = iter.next();
					
					if (!catActual.equals(material.getCategoria())) {
						catActual = material.getCategoria();
			%>
						<br><h2 align="center"><%= catActual %></h2>
			<%	
					}
			%>
					<h3 align="center"><a href="<%= material.getLink() %>" class="enlace" target="_blank"><%= material.getNombre() %></a></h3>
					<p align="center"><%= material.getDescripcion() %></p><br>
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