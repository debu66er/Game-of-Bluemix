<%@page language="java"%>

<!DOCTYPE html>

<html lang="es">
	<head>
		<title>Game of Bluemix - Respuesta</title>
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
			<br><br><br><br><h1><%= (String)request.getAttribute("mensaje") %></h1><br><br>
			<h3>Accede al material del evento en el siguiente enlace:</h3>
			<p> <img src="./images/bluebox.png" alt="BlueBox access button" width="50" height="50" >
			<% String evento = (String)request.getAttribute("evento"); 

			if(evento!=null){
				if(evento.compareTo("essentials")==0){%>
				
			<a href="https://ibm.box.com/s/2hpuajhxiaz4hf27yd1ck1w0dty3lke7"> Material </a>
					
				<%}
				else if(evento.compareTo("cloudfoundry&openwhisk")==0){%>
					
			<a href="https://ibm.biz/BdswXG">Material</a>
					
				<%}
				
				
			}
			
			
			%>
			</p>
			<br><br><br><br>
			<div style="text-align:center;"><a href="index.html"><button>Volver a inicio</button></a></div>
		</div>		
	</body>
</html>
