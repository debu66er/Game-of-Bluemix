<%@page language="java"%>
<%@page import="com.ibm.logica.gestion.gCategorias" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Iterator" %>

<!DOCTYPE html>

<html lang="es">
	<head>
		<title>Administrador - Añadir Categoría</title>
		<meta charset="UTF-8">
		<meta name="author" content="Noelia Herranz & Mauro Lucchini">
		<meta name="application-name" content="Administración">
		<meta name="keywords" content="IBM, Bluemix, SoftLayer, Lunes, Jueves, Cloud">
		<link rel="stylesheet" href="/Administrador/admin.css" type="text/css" media="all"/>
		<link rel="icon" type="image/png" href="images/favicon.png">
	</head>
	
	<div class="banner">
		<a class="enlace" href="http://gameofbluemix.mybluemix.net/"><img src="images/bluemix-logo.png" style="padding-top:2px; vertical-align: middle;">&nbsp;&nbsp;&nbsp;&nbsp;Game of Bluemix </a>
		<div class="admin">
			<a class="enlace" href="/Administrador/index.jsp"> Administrador </a>
		</div>
	</div>
	
	<body>
		<div class="cuerpo">
			<form action="/aniadir" method="post">
				<input type="hidden" name="pagina" value="aniadirCategoria">
				<table class=form>
					<tr>
						<td class="form">Nombre</td>
						<td class="form"><input type="text" name="nombre" size=40 maxlength=40 required oninvalid="setCustomValidity('Por favor, complete el nombre')" oninput="setCustomValidity('')"></td>
					</tr><tr>
						<td class="form">Tipo</td>	
						<td class="form">
							<select name="tipo">
								<option value="Enlaces">Enlaces</option>
								<option value="Material">Material</option>
							</select>
						</td>
					</tr>
				</table>
				<input type="submit" value="Guardar">
			</form>
		</div>
</body>
</html>