<%@page language="java"%>

<html lang="es">
	<head>
		<title>Gesti�n</title>
		<meta charset="UTF-8">
		<meta name="author" content="Noelia Herranz & Mauro Lucchini">
		<meta name="application-name" content="Administraci�n">
		<meta name="keywords" content="IBM, Bluemix, SoftLayer, Lunes, Jueves, Cloud">
		<link rel="stylesheet" href="/Administrador/admin.css" type="text/css" media="all"/>
		<link rel="icon" type="image/png" href="images/favicon.png">
	</head>
	<body>
	
		<%
			HttpSession s = request.getSession();
			//s.setAttribute("sesion", request.getParameter("sesion"));
		%>
	
		<div class="banner">
			<a class="enlace" style="color: #ffffff;" href="index.html">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				Administrador </a>
			<div class="admin">
				<a class="enlace" href="/Administrador/admin.html"> Men� principal </a>
			</div>
		</div>
		<div class="cuerpo">
			<h1>Elija qu� desea gestionar</h1>
			<br> <br>
			
			<a href="/Administrador/enlaces.jsp"><button>Enlaces</button></a> 
			<a href="/Administrador/eventos.jsp"><button>Eventos</button></a> 
			<a href="/Administrador/material.jsp"><button>Material</button></a> 
			<a href="/Administrador/preguntas.jsp"><button>Preguntas</button></a>
			<a href="/Administrador/categorias.jsp"><button>Categor�as</button></a>
	
			<br> <br>
		</div>
	</body>
</html>