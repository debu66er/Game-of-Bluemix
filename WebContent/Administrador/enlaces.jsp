<%@page language="java"%>
<%@page import="java.util.Iterator" %>
<%@page import="java.util.List"%>
<%@page import="com.ibm.logica.modelo.Enlace" %>
<%@page import="com.ibm.logica.gestion.gEnlaces" %>
<%@page import="com.ibm.servlets.adminControlador" %>

<!DOCTYPE html>

<html lang="es">
	<head>
		<title>Administrador - Gestión de Enlaces</title>
		<meta charset="UTF-8">
		<meta name="author" content="Noelia Herranz & Mauro Lucchini">
		<meta name="application-name" content="Administración">
		<meta name="keywords" content="IBM, Bluemix, SoftLayer, Lunes, Jueves, Cloud">
		<link rel="stylesheet" href="/Administrador/admin.css" type="text/css" media="all"/>
		<link rel="icon" type="image/png" href="images/favicon.png">
	</head>
	
	<body>
		<div class="cuerpo">
			<h1> Gestión de enlaces </h1>
			<%
				HttpSession s = request.getSession();
				gEnlaces enlaces = new gEnlaces();
				String sesion = (String)s.getAttribute("sesion");
				List<Enlace> links = enlaces.getLink(sesion);
				Iterator<Enlace> iter = links.iterator();
				Enlace link;
				
				String catActual = "";
				int nLink = 0;
				
				while (iter.hasNext()) {
					link = iter.next();
					nLink++;
					
					if (!catActual.equals(link.getCategoria())) {
						catActual = link.getCategoria();
			%>
						<br><h2 align="center"><%= catActual %></h2>
			<%	
					}
			%>
					<form action="/gestion" method="post">
						<div align="center">
							<%= link.getAlias() %>: <a href="<%= link.getLink() %>" class="enlace"><%= link.getLink() %></a><% if (link.getOculto().equals("yes")) { %> (O) <% } %>
							<% String accion = "accion" + nLink; %>
							<input type="hidden" name="pagina" value="enlaces">		
											
							<input type="hidden" name="codLink" value="<%= link.getLink() %>">
							<input type="hidden" name="alias" value="<%= link.getAlias() %>">
							<input type="hidden" name="categoria" value="<%= link.getCategoria() %>">
							<input type="hidden" name="oculto" value="<%= link.getOculto() %>">
							
							<input type="hidden" name="accion" id="<%= accion %>" value="novalue">&nbsp;&nbsp;
							<input type="image" src="images/editar.png" alt="Editar" onClick="document.getElementById('<%= accion %>').value='editar';">
							<input type="image" src="images/eliminar.png" alt="Eliminar" onClick="document.getElementById('<%= accion %>').value='eliminar'; return confirm('¿Estás seguro de que deseas eliminar este enlace?');">
						</div>
					</form>
			<%
				}
			%>
			<br> <br>
			<div style="text-align: center;">
				<a href="aniadirEnlace.jsp"><button>Añadir nuevo enlace</button></a>
			</div>
		</div>
	</body>
</html>