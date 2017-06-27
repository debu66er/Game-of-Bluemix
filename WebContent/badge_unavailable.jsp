<%@page language="java"%>

<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<html lang="es">
	<head>
		<title>Game of Bluemix - Badge</title>
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
			<% HttpSession sesion=request.getSession();
			String dir = (String) sesion.getAttribute("dir");
			%>
			<div class="cuerpo" align="center">
			<h1> Actualmente no está disponible el servicio de badges</h1><br><br>
			<br><br>
			<h1> Disculpa las molestias </h1><br><br>
			<img src=./images/mozilla.jpg alt="badge_error" weigth=350 height=350><br><br>
			<br><br><div style="text-align:center;"><a href="idea.jsp"><button>Continuar</button></a></div> <br><br>
		</div>		
</body>
</html>