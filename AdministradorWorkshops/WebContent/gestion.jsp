<%@page language="java"%>

<html lang="es">
	<head>
		<title>Gestión</title>
		<meta charset="UTF-8">
		<meta name="author" content="Noelia Herranz & Mauro Lucchini">
		<meta name="application-name" content="Administración">
		<meta name="keywords" content="IBM, Bluemix, SoftLayer, Lunes, Jueves, Cloud">
		<link rel="stylesheet" href="./admin.css" type="text/css" media="all"/>
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
				<a class="enlace" href="admin.html"> Menú principal </a>
			</div>
		</div>
		<div class="cuerpo">
			<h1>Elija qué desea gestionar</h1>
			<br> <br>
			
			<a href="enlaces.jsp"><button>Enlaces</button></a> 
			<a href="eventos.jsp"><button>Eventos</button></a> 
			<a href="material.jsp"><button>Material</button></a> 
			<a href="preguntas.jsp"><button>Preguntas</button></a>
			<a href="categorias.jsp"><button>Categorías</button></a>
	
			<br> <br>
		</div>
	</body>
</html>