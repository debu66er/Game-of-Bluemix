<%@page language="java"%>

<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<html lang="es">
	<head>
		<title>Game of Bluemix - Idea</title>
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
			<h1> ¡Enhorabuena, ya puedes descargar tu badge! </h1><br><br>
			<img src="http://backpack.openbadges.org/baker?assertion=http://gameofbluemix.mybluemix.net/badges/awards/essentials-badge-award.json" alt="Badge" height="50" width="50">
			<a href="http://backpack.openbadges.org/baker?assertion=http://gameofbluemix.mybluemix.net/badges/awards/essentials-badge-award.json" download="badge.png">Descargar</a>
			
		</div>		
</body>
</html>