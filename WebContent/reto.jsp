<%@page language="java"%>
<%@page import="com.ibm.logica.Lista"%>
<%@page import="com.ibm.logica.Pregunta" %>
<%@page import="java.util.Iterator" %>
<%@page import="java.util.List"%>

<!DOCTYPE html>

<html lang="es">
	<head>
		<title>Game of Bluemix - Reto</title>
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
			<div class="admin"><a class="enlace" href="/Administrador/index.html" target="_blank">Administrador</a></div>
			<div class="menu">
				<a class="enlace" href="eventos.jsp" style="padding-right: 10px;">Próximos eventos</a>
				<a class="enlace" href="enlaces.jsp" style="padding-left: 10px;">Enlaces de interés</a>
			</div>
		</div>
			
		<div class="cuerpo">
			<h1>¡Bienvenido al reto! ¿Serás capaz de acertar todas las preguntas?</h1>
			<br><br>
			<form action="/reto" method="post">
				<input type="hidden" name="pagina" value="reto">
				<%
					HttpSession sesion=request.getSession();
					Lista reto = new Lista();
					List<Pregunta> preguntas = reto.getPreguntasAleatorias(10);
					Iterator<Pregunta> iter = preguntas.iterator();
					Pregunta pregunta;
					
					String parametro;
					
					sesion.setAttribute("listaPreg", preguntas);
					
					int i = 1;
					while (iter.hasNext()) {
						pregunta = iter.next();
						parametro = "respuesta" + i;
				%>
						<h3><%= i %>. <%= pregunta.getPregunta() %></h3>
						<p><input type="radio" name="<%= parametro %>" id="<%= parametro %>1" value="1"><label for="respuesta<%= i %>1"> <%= pregunta.getResp1() %></label></p>
						<p><input type="radio" name="<%= parametro %>" id="<%= parametro %>2" value="2"><label for="respuesta<%= i %>2"> <%= pregunta.getResp2() %></label></p>
						<% if ((pregunta.getResp3() != null) && !pregunta.getResp3().equals("")) {%>
						<p><input type="radio" name="<%= parametro %>" id="<%= parametro %>3" value="3"><label for="respuesta<%= i %>3"> <%= pregunta.getResp3() %></label></p>
						<% } if ((pregunta.getResp4() != null) && !pregunta.getResp4().equals("")) { %>
						<p><input type="radio" name="<%= parametro %>" id="<%= parametro %>4" value="4"><label for="respuesta<%= i %>4"> <%= pregunta.getResp4() %></label></p>
						<% } %> <br><br>
				<%		
						i++;
					}
					
				%>
			
				<br><br><div style="text-align:right;"><input type="submit" value="Enviar respuestas"></div> <br><br>
			</form>
			
		</div>		
	</body>
</html>