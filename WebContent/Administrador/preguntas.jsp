<%@page language="java"%>
<%@page import="java.util.Iterator" %>
<%@page import="java.util.List"%>
<%@page import="com.ibm.logica.modelo.Pregunta" %>
<%@page import="com.ibm.logica.gestion.gPreguntas" %>

<!DOCTYPE html>

<html lang="es">
	<head>
		<title>Administrador - Gestión de Preguntas</title>
		<meta charset="UTF-8">
		<meta name="author" content="Noelia Herranz & Mauro Lucchini">
		<meta name="application-name" content="Administración">
		<meta name="keywords" content="IBM, Bluemix, SoftLayer, Lunes, Jueves, Cloud">
		<link rel="stylesheet" href="/Administrador/admin.css" type="text/css" media="all"/>
		<link rel="icon" type="image/png" href="images/favicon.png">
	</head>
	
	<body>
		<div class="cuerpo">
			<h1> Gestión de preguntas </h1>
			<%
				HttpSession s = request.getSession();	
				gPreguntas preguntas = new gPreguntas();
				String sesion = (String) s.getAttribute("sesion");
				List<Pregunta> pregs = preguntas.getPregunta(sesion);
				Iterator<Pregunta> iter = pregs.iterator();
				Pregunta pregunta;
				
				int nPregs = 0;
				
				while (iter.hasNext()) {
					pregunta = iter.next();
					nPregs++;
			%>
					<form action="/gestion" method="post">
						<div align="center">
							<% String accion = "accion" + nPregs; %>
							<input type="hidden" name="pagina" value="preguntas">		
											
							<input type="hidden" name="id" value="<%= pregunta.getId() %>">
							<input type="hidden" name="preg" value="<%= pregunta.getPregunta() %>">
							<input type="hidden" name="resp1" value="<%= pregunta.getResp1() %>">
							<input type="hidden" name="resp2" value="<%= pregunta.getResp2() %>">
							<input type="hidden" name="resp3" value="<%= pregunta.getResp3() %>">
							<input type="hidden" name="resp4" value="<%= pregunta.getResp4() %>">
							<input type="hidden" name="correcta" value="<%= pregunta.getCorrecta() %>">
							<input type="hidden" name="oculta" value="<%= pregunta.getOculta() %>">
							
							<input type="hidden" name="accion" id="<%= accion %>" value="novalue">
							<br>
							<h3><%= pregunta.getPregunta() %> <% if (pregunta.getOculta().equals("yes")) { %> (O) <% } %>
							&nbsp;&nbsp;<input type="image" src="images/editar.png" alt="Editar" onClick="document.getElementById('<%= accion %>').value='editar';">
							<input type="image" src="images/eliminar.png" alt="Eliminar" onClick="document.getElementById('<%= accion %>').value='eliminar'; return confirm('¿Estás seguro de que deseas eliminar esta pregunta?');"></h3>
							
							<p><%= pregunta.getResp1() %> <% if (pregunta.getCorrecta() == 1) { %> - (C) <% } %></p>
							<p><%= pregunta.getResp2() %> <% if (pregunta.getCorrecta() == 2) { %> - (C) <% } %></p>
							<p><%= pregunta.getResp3() %> <% if (pregunta.getCorrecta() == 3) { %> - (C) <% } %></p>
							<p><%= pregunta.getResp4() %> <% if (pregunta.getCorrecta() == 4) { %> - (C) <% } %></p>
							
						</div>
					</form>
			<%
				}
			%>
			<br> <br>
			<div style="text-align: center;">
				<a href="aniadirPregunta.jsp"><button>Añadir nueva pregunta</button></a>
			</div>
		</div>
	</body>
</html>