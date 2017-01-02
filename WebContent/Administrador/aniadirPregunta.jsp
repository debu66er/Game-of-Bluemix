<%@page language="java"%>
<%@page import="com.ibm.logica.gestion.gPreguntas" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Iterator" %>

<!DOCTYPE html>

<html lang="es">
	<head>
		<title>Administrador - Añadir Pregunta</title>
		<meta charset="UTF-8">
		<meta name="author" content="Noelia Herranz & Mauro Lucchini">
		<meta name="application-name" content="Administración">
		<meta name="keywords" content="IBM, Bluemix, SoftLayer, Lunes, Jueves, Cloud">
		<link rel="stylesheet" href="/Administrador/admin.css" type="text/css" media="all"/>
		<link rel="icon" type="image/png" href="images/favicon.png">
	</head>
	
	<body>
		<div class="cuerpo">
			<form action="/aniadir" method="post">
				<input type="hidden" name="pagina" value="aniadirPregunta">
				<table class=form>
					<tr>
						<td class="form">Pregunta</td>
						<td class="form"><input type="text" name="preg" size=50 maxlength=200 required oninvalid="setCustomValidity('Por favor, complete la pregunta')" oninput="setCustomValidity('')"></td>
					</tr><tr>	
						<td class="form">Respuesta 1</td>
						<td class="form"><input type="text" name="resp1" size=50 maxlength=200 required oninvalid="setCustomValidity('Por favor, complete la pregunta')" oninput="setCustomValidity('')"></td>
					</tr><tr>
						<td class="form">Respuesta 2</td>
						<td class="form"><input type="text" name="resp2" size=50 maxlength=200 required oninvalid="setCustomValidity('Por favor, complete la pregunta')" oninput="setCustomValidity('')"></td>
					</tr><tr>
						<td class="form">Respuesta 3</td>
						<td class="form"><input type="text" name="resp3" size=50 maxlength=200></td>
					</tr><tr>
						<td class="form">Respuesta 4</td>
						<td class="form"><input type="text" name="resp4" size=50 maxlength=200></td>
					</tr><tr>
						<td class="form">Correcta</td>
						<td class="form"><input type="text" name="correcta" size=50 maxlength=200 pattern="[1-4]" title="Indique un número del 1 al 4"></td>
					</tr><tr>	
						<td><input type="checkbox" name="oculta" value="yes">Oculta</td>
					</tr>
				</table>
				<input type="submit" value="Guardar">
			</form>
		</div>
</body>
</html>