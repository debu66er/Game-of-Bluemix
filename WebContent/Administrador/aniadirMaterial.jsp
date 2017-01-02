<%@page language="java"%>
<%@page import="com.ibm.logica.gestion.gMaterial" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Iterator" %>

<!DOCTYPE html>

<html lang="es">
	<head>
		<title>Administrador - A�adir Material</title>
		<meta charset="UTF-8">
		<meta name="author" content="Noelia Herranz & Mauro Lucchini">
		<meta name="application-name" content="Administraci�n">
		<meta name="keywords" content="IBM, Bluemix, SoftLayer, Lunes, Jueves, Cloud">
		<link rel="stylesheet" href="/Administrador/admin.css" type="text/css" media="all"/>
		<link rel="icon" type="image/png" href="images/favicon.png">
	</head>
	
	<body>
		<div class="cuerpo">
			<form action="/aniadir" method="post">
				<input type="hidden" name="pagina" value="aniadirMaterial">
				<table class=form>
					<tr>
						<td class="form">Nombre</td>
						<td class="form"><input type="text" name="nombre" size=40 maxlength=40 required oninvalid="setCustomValidity('Por favor, complete el nombre')" oninput="setCustomValidity('')"></td>
					</tr><tr>	
						<td class="form">Descripcion</td>
						<td class="form"><textarea name="descripcion" rows=4 cols=50 maxlength=200 required oninvalid="setCustomValidity('Por favor, complete la descripci�n')" oninput="setCustomValidity('')"></textarea></td>
					</tr><tr>	
						<td class="form">Categor�a</td>
						<td class="form">
							<select name="categoria">
							<% 
								HttpSession s = request.getSession();
								gMaterial mat = new gMaterial();
								String sesion = (String) s.getAttribute("sesion");
								List<String> categorias = mat.getCategorias(sesion);
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