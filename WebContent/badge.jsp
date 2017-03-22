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
			<h1> ¡Enhorabuena ya puedes descargar tu badge! </h1><br><br>
			<img src=<%=dir%> alt="Badge" height="350" width="350">
			<br><br>
			<a href=<%=response.encodeURL(dir)%> download="badge.png">Descargar</a><br><br><br><br>
			<h1> ¡Importa tu badge a Backpack y compartelo con tus redes! </h1><br><br>
			<h2>1. Descarga tu badge e importalo a Backpack: https://backpack.openbadges.org/ <h2>
			<img src=./images/backpack_1.png alt="upload" weigth=350 height=350><br><br>
			<h2>2. Selecciona el archivo de imagen que acabas de descargar<h2>
			<img src=./images/backpack_2.png alt="browse" weigth=350 height=350><br><br>
			<h2>3. Abre el badge para ver los detalles<h2>
			<img src=./images/backpack_3.png alt="details" weigth=350 height=350><br><br>
			<h2>4. En la seccion de "My Collections" puedes crear tu propia colección de badges para compartir con tus redes sociales<h2>
			<img src=./images/backpack_4.png alt="upload" weigth=350 height=350><br><br>
			<h2>5. Accede al enlace de "Share this on Twitter, Google+, Facebook and LinkedIn" para compartir tu colección<h2>
			<img src=./images/backpack_5.png alt="upload" weigth=400 height=400><br><br><br><br>
			<img src=./images/backpack_6.png alt="LinkdIn" weigth=350 height=350><br><br>
			

			
			<br><br><div style="text-align:center;"><a href="idea.jsp"><button>Continuar</button></a></div> <br><br>
		</div>		
</body>
</html>