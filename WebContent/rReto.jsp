<%@page language="java"%>
<%@page session="true"%>
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
			<h1><%= (String)request.getAttribute("titulo") %></h1>
			<br><br>
			
			<%
			
				HttpSession sesion=request.getSession();
				@SuppressWarnings("unchecked")
				List<Pregunta> preguntas = (List<Pregunta>) sesion.getAttribute("listaPreg");
				Iterator<Pregunta> iter = preguntas.iterator();
				Pregunta pregunta;
				
				String parametro, pImagen, pCheck;
				int i = 1;

				String imagen[] = new String[4];
				String checked[] = new String[4];
				
				while (iter.hasNext()) {
					pregunta = iter.next();
					parametro = "respuesta" + i;
					pImagen = "imagen" + i;
					pCheck = "check" + i;
					
					imagen = (String[]) request.getAttribute(pImagen);
					checked = (String[]) request.getAttribute(pCheck);
					
			%>
					<h3><%= i %>. <%= pregunta.getPregunta() %></h3>
					<p><input type="radio" name="<%= parametro %>" value="1" <%= checked[0] %>><%= pregunta.getResp1() %> <%= imagen[0] %>
					<p><input type="radio" name="<%= parametro %>" value="2" <%= checked[1] %>><%= pregunta.getResp2() %> <%= imagen[1] %>
					<% if ((pregunta.getResp3() != null) && (!pregunta.getResp3().equals(""))) { %>
					<p><input type="radio" name="<%= parametro %>" value="3" <%= checked[2] %>><%= pregunta.getResp3() %> <%= imagen[2] %>
					<% } if ((pregunta.getResp4() != null) && (!pregunta.getResp4().equals(""))) { %>
					<p><input type="radio" name="<%= parametro %>" value="4" <%= checked[3] %>><%= pregunta.getResp4() %> <%= imagen[3] %>
					<% } %> <br><br>
			<%
				i++;
				}
			%>
		
			<br><br><div style="text-align:right;"><a href="idea.jsp"><button>Continuar</button></a></div> <br><br>
			
		</div>		
	</body>
</html>