<%@page language="java"%>
<%@page import="com.ibm.logica.gestion.gMaterial" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Iterator" %>

<!DOCTYPE html>

<html lang="es">
	<head>
		<title>Administrador - Editar Material</title>
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
				<input type="hidden" name="pagina" value="editarMaterial">
				<table class=form>
					<tr>
						<td class="form">Nombre</td>
						<td class="form"><input type="text" name="nombre" size=40 maxlength=40 required oninvalid="setCustomValidity('Por favor, complete el alias')" oninput="setCustomValidity('')" value="<%= request.getParameter("nombre") %>"></td>
					</tr><tr>	
						<td class="form">Descripcion</td>
						<td class="form"><textarea name="descripcion" rows=4 cols=50 maxlength=200 required oninvalid="setCustomValidity('Por favor, complete la descripción')" oninput="setCustomValidity('')"><%= request.getParameter("descripcion") %></textarea></td>
					</tr><tr>	
						<td class="form">Categoría</td>
						<td class="form">
							<select name="categoria">
							<% 
								HttpSession s = request.getSession();
								gMaterial cat = new gMaterial();
								List<String> categorias = cat.getCategorias();
								Iterator<String> iter = categorias.iterator();
								String categoria;
	
								while (iter.hasNext()) {
									categoria = iter.next();
							%>
									<option value="<%= categoria %>" <% if (categoria.equals(request.getParameter("categoria"))) { %> selected <% } %>><%= categoria %></option>
							<%
								}
							%>
							</select>
						</td>
					</tr><tr>	
						<td class="form">Link</td>
						<td class="form"><input type="text" name="enlace" size=50 maxlength=50 value="<%= request.getParameter("link") %>" disabled><input type="hidden" name="link" value="<%= request.getParameter("link") %>"></td>
					</tr><tr>	
						<td><input type="checkbox" name="oculto" value="yes" <% if (request.getParameter("oculto").equals("yes")) { %> checked <% } %>>Oculto</td>
					</tr>
				</table>
				<input type="submit" value="Guardar">
			</form>
		</div>
</body>
</html>