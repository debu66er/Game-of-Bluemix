<%@page language="java"%>
<%@page import="com.ibm.logica.gestion.gEnlaces" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Iterator" %>

<!DOCTYPE html>

<html lang="es">
	<head>
		<title>Administrador - Editar Enlace</title>
		<meta charset="UTF-8">
		<meta name="author" content="Noelia Herranz & Mauro Lucchini">
		<meta name="application-name" content="Administración">
		<meta name="keywords" content="IBM, Bluemix, SoftLayer, Lunes, Jueves, Cloud">
		<link rel="stylesheet" href="/Administrador/admin.css" type="text/css" media="all"/>
		<link rel="icon" type="image/png" href="images/favicon.png">
	</head>
	
	<body>
		<div class="cuerpo">
			<form action="editar" method="post">
				<input type="hidden" name="pagina" value="editarEvento">
				<table class=form>
					<tr>
						<td class="form">Nombre</td>
						<td class="form"><input type="text" name="nom" size=60 maxlength=60 value="<%= request.getParameter("nombre") %>" disabled><input type="hidden" name="nombre" value="<%= request.getParameter("nombre") %>"></td>
					</tr><tr>	
						<td class="form">Lugar</td>
						<td class="form"><input type="text" name="lug" size=60 maxlength=60 value="<%= request.getParameter("lugar") %>" disabled><input type="hidden" name="lugar" value="<%= request.getParameter("lugar") %>"></td>
					</tr><tr>	
						<td class="form">Fecha</td>
						<td class="form"><input type="text" name="date" size=10 maxlength=10 value=<%= request.getParameter("fecha") %> disabled><input type="hidden" name="fecha"  value=<%= request.getParameter("fecha") %>></td>
					</tr><tr>	
						<td class="form">Responsable</td>
						<td class="form"><input type="text" name="responsable" size=60 maxlength=60 required oninvalid="setCustomValidity('Por favor, complete el responsable')" oninput="setCustomValidity('')" value="<%= request.getParameter("responsable") %>"></td>
					</tr><tr>	
						<td class="form">Contacto</td>
						<td class="form"><input type="text" name="contacto" size=60 maxlength=60 required oninvalid="setCustomValidity('Por favor, complete el contacto')" oninput="setCustomValidity('')" value="<%= request.getParameter("contacto") %>"></td>
					</tr><tr>	
						<td><input type="checkbox" name="oculto" value="yes" <% if (request.getParameter("oculto").equals("yes")) { %> checked <% } %>>Oculto</td>
					</tr>
				</table>
				<input type="submit" value="Guardar">
			</form>
		</div>
</body>
</html>