<%@page language="java"%>

<!DOCTYPE html>

<html lang="es">
	<head>
		<title>Martes de Bluemix - Idea</title>
		<meta charset="UTF-8">
		<meta name="author" content="Noelia Herranz">
		<meta name="application-name" content="Martes de Bluemix">
		<meta name="keywords" content="IBM, Bluemix, Martes, Cloud">
		<link rel="stylesheet" href="./bluemix.css" type="text/css" media="all" />
		<link rel="icon" type="image/png" href="images/favicon.png">
	</head>
	
	<body>
		<div class="banner">
			<a class="titulo" href="index.html"><img src="images/bluemix-logo.png" style="padding-top:2px; vertical-align: middle;">&nbsp;&nbsp;&nbsp;&nbsp;Martes de Bluemix </a>
			<div class="admin"><a class="enlace" href="http://adminbmsl.mybluemix.net/" target="_blank">Administrador</a></div>
			<div class="menu">
				<a class="enlace" href="eventos.jsp" style="padding-right: 10px;">Próximos eventos</a>
				<a class="enlace" href="enlaces.jsp" style="padding-left: 10px;">Enlaces de interés</a>
			</div>
		</div>
		
		<%
			HttpSession sesion=request.getSession();
		%>
		
		<div class="cuerpo">
			<h1> ¿Tienes una buena idea? ¡Cuéntanosla! </h1><br><br>
			<form action="/idea" method="post">
				<input type="hidden" name="pagina" value="idea">
				<h2>Si tienes una idea sobre cómo aplicar Bluemix en tu empresa, puedes contárnosla en este espacio. &nbsp; <span class="subtitulo">(Máx. 1000 caracteres)</span></h2><br>
				<table><tr>
					<td class="form">Empresa: </td>
					<td class="form"><input type="text" name="empresa" size=60 maxlength=60 value="<% if (sesion.getAttribute("empresa") != null) out.print(sesion.getAttribute("empresa")); %>"/></td>
				</tr></table><br>
				<textarea name="idea" rows="10" maxlength=1000></textarea><br>
				<br><br>	
				
				<br><br><div style="text-align:center;"><input type="submit" value="Enviar"></div>
				<br><br><br>
			</form>
		</div>		
	</body>
</html>
