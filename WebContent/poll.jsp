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
			<div class="admin"><a class="enlace" href="/Administrador/index.jsp" target="_blank">Administrador</a></div>
			<div class="menu">
				<a class="enlace" href="eventos.jsp" style="padding-right: 10px;">Próximos eventos</a>
				<a class="enlace" href="enlaces.jsp" style="padding-left: 10px;">Enlaces de interés</a>
			</div>
		</div>
		<div class="cuerpo">
			<h1>Indique el workshop que ha realizado</h1><br><br>
			<form action="/encuesta" method="post">
				<input type="hidden" name="pagina" value="poll">
				<table class=form>
				<h2>Email</h2>
					<tr>
						<td class="form">E-mail: </td>
						<td class="form"><input type="email" name="email" size=60 maxlength=60 required oninvalid="setCustomValidity('Por favor, complete su e-mail')" oninput="setCustomValidity('')"/></td>
					</tr>
				</table>
				<br><br>
				
				<table class=form>
				<h2>Workshop realizado</h2>
					<tr class="par">
						<td>Game of Bluemix: Essentials</td>
						<td class="input"><input type="radio" name="evento" value="essentials" checked="checked"></td>
					</tr>
					<tr class="impar">
						<td>Game of Bluemix: Experienced - CloudFoundry & OpenWhisk</td>
						<td class="input"><input type="radio" name="evento" value="cloudfoundry&openwhisk"></td>
					</tr>
					<tr class="par">
						<td>Game of Bluemix: Experienced - Infrastructure</td>
						<td class="input"><input type="radio" name="evento" value="infrastructure"></td>
					</tr>
					<tr class="impar">
						<td>Game of Bluemix: Experienced - Containers</td>
						<td class="input"><input type="radio" name="evento" value="containers"></td>
					</tr>
					<tr class="par">
						<td>Game of Bluemix: Experienced - Mobile & IoT</td>
						<td class="input"><input type="radio" name="evento" value="mobile&IoT"></td>
					</tr>
					<tr class="impar">
						<td>Game of Bluemix: Experienced - Data Analytics</td>
						<td class="input"><input type="radio" name="evento" value="data&analytics"></td>
					</tr>
				</table>
				<br><br>
				<br><br><div style="text-align:center;"><input type="submit" value="Enviar"></div>
				<br><br><br>
			</form>
		</div>		
	</body>
</html>
