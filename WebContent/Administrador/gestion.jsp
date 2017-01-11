<%@page language="java"%>

<html lang="es">
	<head>
		<title>Gestión</title>
		<meta charset="UTF-8">
		<meta name="author" content="Noelia Herranz & Mauro Lucchini">
		<meta name="application-name" content="Administración">
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
			<a class="enlace" href="http://gameofbluemix.mybluemix.net/"><img src="images/bluemix-logo.png" style="padding-top:2px; vertical-align: middle;">&nbsp;&nbsp;&nbsp;&nbsp;Game of Bluemix </a>
			<div class="admin">
				<a class="enlace" href="/Administrador/index.jsp"> Administrador </a>
			</div>
		</div>
		
		<div class="cuerpo">
			<h1>Elija qué desea gestionar</h1>
			<br> <br>
			
			<a href="/Administrador/enlaces.jsp"><button>Enlaces</button></a> 
			<a href="/Administrador/eventos.jsp"><button>Eventos</button></a> 
			<a href="/Administrador/material.jsp"><button>Material</button></a> 
			<a href="/Administrador/preguntas.jsp"><button>Preguntas</button></a>
			<a href="/Administrador/categorias.jsp"><button>Categorías</button></a>
	
			<br> <br>
		</div>
	</body>
</html>