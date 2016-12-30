<%@page language="java"%>
<%@page import="com.ibm.logica.gestion.gEnlaces" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Iterator" %>

<!DOCTYPE html>

<html lang="es">
	<head>
		<title>Administrador - Añadir Enlace</title>
		<meta charset="UTF-8">
		<meta name="author" content="Noelia Herranz & Mauro Lucchini">
		<meta name="application-name" content="Administración">
		<meta name="keywords" content="IBM, Bluemix, SoftLayer, Lunes, Jueves, Cloud">
		<link rel="stylesheet" href="./admin.css" type="text/css" media="all"/>
		<link rel="icon" type="image/png" href="images/favicon.png">
	</head>
	
	<body>
		<div class="cuerpo">
			<form action="aniadir" method="post">
				<input type="hidden" name="pagina" value="aniadirEnlace">
				<table class=form>
					<tr>
						<td class="form">Alias</td>
						<td class="form"><input type="text" name="alias" size=40 maxlength=40 required oninvalid="setCustomValidity('Por favor, complete el alias')" oninput="setCustomValidity('')"></td>
					</tr><tr>	
						<td class="form">Categoría</td>
						<td class="form">
							<select name="categoria">
							<% 
								HttpSession s = request.getSession();
								gEnlaces cat = new gEnlaces();
								String sesion = (String) s.getAttribute("sesion");
								List<String> categorias = cat.getCategorias(sesion);
								Iterator<String> iter = categorias.iterator();
								String categoria;
	
								while (iter.hasNext()) {
									categoria = iter.next();
							%>
									<option value="<%= categoria %>"><%= categoria %></option>
							<%
								}
							%>
							</select>
						</td>
					</tr><tr>	
						<td class="form">Link</td>
						<td class="form"><input type="text" name="link" size=50 maxlength=500 required oninvalid="setCustomValidity('Por favor, complete el link')" oninput="setCustomValidity('')"></td>
					</tr><tr>	
						<td><input type="checkbox" name="oculto" value="yes">Oculto</td>
					</tr>
				</table>
				<input type="submit" value="Guardar">
			</form>
		</div>
</body>
</html>