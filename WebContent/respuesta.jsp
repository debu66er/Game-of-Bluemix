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
				<a class="enlace" href="eventos.jsp" style="padding-right: 10px;">Pr�ximos eventos</a>
				<a class="enlace" href="enlaces.jsp" style="padding-left: 10px;">Enlaces de inter�s</a>
			</div>
		</div>
					
		<div class="cuerpo">
			<%String mensaje = (String)request.getAttribute("mensaje"); 
			boolean correcto = (Boolean)request.getAttribute("correcto");
			
			if(mensaje==null){
				mensaje = (String)session.getAttribute("mensaje");
			} %>
			
			<br><br><br><br><h1><%= mensaje %></h1><br><br>
			<%if(correcto){ %>
			<h3>Accede al material del evento en el siguiente enlace:</h3>
			<p> <img src="./images/bluebox.png" alt="BlueBox access button" width="50" height="50" >
			<% String evento = (String)request.getAttribute("evento");
			String enlace="";
			
			if(evento==null){
				evento = (String)session.getAttribute("evento");
			}
			
			if(evento.compareTo("essentials")==0){
				enlace ="https://ibm.box.com/s/x8lmmxoxujxpl1gc59mzaskuv877qhbt";
			}
		
			else if(evento.compareTo("cloudfoundry&openwhisk")==0){
				enlace="https://ibm.box.com/s/fwa5rk8amufv891nu3ay5yu02jwgzxex";
			}
			
			else if(evento.compareTo("containers")==0){
				enlace="https://ibm.box.com/s/yppsd5fq8kn3z64uyg5lkd10x63sqai6";
			}
			
			else if(evento.compareTo("infrastructure")==0){
				enlace="https://ibm.box.com/s/jl0h0nq4nxa1jgbjde1ritw2qqsvrccl";
			}
			else if(evento.compareTo("mobile&IoT")==0){
				enlace="https://ibm.box.com/s/es7l4wlluxoz20fob4htegrdujbyso3x";	
			}
			else if(evento.compareTo("data&analytics")==0){
				enlace="https://ibm.box.com/s/s5prbi5zbcg376ywf9q4t51yqm3raju1";		
			}
			else{ %>
			
			El material del evento <%=evento%> no est� disponible todav�a </p>
			
			<%	}  %>
			<a href="<%=enlace%>" class="enlace"> Material </a>
			<% } %>
			<br><br><br><br>
			<div style="text-align:center;"><a href="index.html"><button>Volver a inicio</button></a></div>
		</div>		
	</body>
</html>
