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
				
				else if(evento.compareTo("containers")==0){%>
				
				<a href="https://ibm.box.com/s/2ryhs0ptawiiqv89ta42saou14ysp65t">Material</a>
						
					<%}
				
				else if(evento.compareTo("infrastructure")==0){%>
				
				<a href="https://ibm.box.com/s/jl0h0nq4nxa1jgbjde1ritw2qqsvrccl">Material</a>
						
					<%}
				
				else if(evento.compareTo("mobile&IoT")==0){%>
				
				<a href="https://ibm.box.com/s/es7l4wlluxoz20fob4htegrdujbyso3x">Material</a>
						
					<%}
				
				else if(evento.compareTo("data&analytics")==0){%>
				
				<a href="https://ibm.box.com/s/s5prbi5zbcg376ywf9q4t51yqm3raju1">Material</a>
						
					<%}
				
				else{ %>
				
				El material del evento <%=evento%> no est� disponible todav�a </p>
				
				<%	}			
			}
			
			
			%>
			<br><br><br><br>
			<div style="text-align:center;"><a href="index.html"><button>Volver a inicio</button></a></div>
		</div>		
	</body>
</html>
