<%@page language="java"%>

<!DOCTYPE html>

<html lang="es">
	<head>
		<title>Game of Bluemix - Encuesta</title>
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
			
		<%
			HttpSession sesion=request.getSession();
		%>
		
		<div class="cuerpo">
			<h1>Seleccione que workshop esta realizando</h1><br><br>
			<form action="/encuesta" method="post">
				<input type="hidden" name="pagina" value="retoworkshop">

				<table class=form>
					<tr class="par">
						<td>Game of Bluemix: Essentials</td>
						<td class="input"><input type="radio" name="workshop" value="Essentials" checked="checked"></td>
					</tr>
					<tr class="impar">
						<td>Game of Bluemix: Experienced - CloudFoundry & Openwhisk</td>
						<td class="input"><input type="radio" name="workshop" value="Cloudfoundry & Openwhisk"></td>
					</tr>
					<tr class="par">
						<td>Game of Bluemix: Experienced - Infrastructure</td>
						<td class="input"><input type="radio" name="workshop" value="Infrastructure"></td>
					</tr>
					<tr class="impar">
						<td>Game of Bluemix: Experienced - Containers</td>
						<td class="input"><input type="radio" name="workshop" value="Containers"></td>
					</tr>
					<tr class="par">
						<td>Game of Bluemix: Experienced - Mobile & IoT</td>
						<td class="input"><input type="radio" name="workshop" value="Mobile & IoT"></td>
					</tr>
					<tr class="impar">
						<td>Game of Bluemix: Experienced - Data Analytics</td>
						<td class="input"><input type="radio" name="workshop" value="Data & Analytics"></td>
					</tr>
				</table>
				<br><br>
				
				<br><br><div style="text-align:center;"><input type="submit" value="Enviar"></div>
				<br><br><br>
			</form>
		</div>		
	</body>
</html>
