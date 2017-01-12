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
	
	<div class="banner">
		<a class="enlace" href="http://gameofbluemix.mybluemix.net/"><img src="images/bluemix-logo.png" style="padding-top:2px; vertical-align: middle;">&nbsp;&nbsp;&nbsp;&nbsp;Game of Bluemix </a>
		<div class="admin">
			<a class="enlace" href="/Administrador/index.jsp"> Administrador </a>
		</div>
	</div>
	
	<body>
		<% String user =(String) request.getSession().getAttribute("userName");
	    if (user==null){
	       RequestDispatcher rs = request.getServletContext().getRequestDispatcher("/Administrador/index.jsp"); 
	        rs.forward(request, response);
   		 }%>
		<div class="cuerpo">
			<form action="/aniadir" method="post">
				<input type="hidden" name="pagina" value="aniadirPregunta">
				<table class=form>
					<tr>
					<td class="form">Workshop</td>
					<td class="form">
						<select name="workshop" required oninvalid="setCustomValidity('Por favor, complete la pregunta')" oninput="setCustomValidity('')">
						 	<option value="Essentials">Essentials</option> 
						   	<option value="Cloudfoundry & Openwhisk">Cloudfoundry & Openwhisk</option> 
						   	<option value="Infrastructure">Infrastructure</option>
						   	<option value="Containers">Containers</option> 
						   	<option value="Mobile & IoT">Mobile & IoT</option> 
						   	<option value="Data & Analytics">Data & Analytics</option>
						</select>
					</td>
					</tr><tr>	
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