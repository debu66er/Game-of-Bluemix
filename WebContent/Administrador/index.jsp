<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<html lang="es">

	<head>
		<title>Administración Bluemix</title>
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
	
	<body class="cuerpo">
		<% String user =(String) request.getSession().getAttribute("userName");
	    if (user!=null){
	       RequestDispatcher rs = request.getServletContext().getRequestDispatcher("/Administrador/elegir.jsp"); 
	        rs.forward(request, response);
   		 }%>
		<h1>Portal de administración</h1><br><br>
		<form action="/index" method="POST">
			<input type="hidden" name="pagina" value="index">
			<%String error = (String) request.getSession().getAttribute("errorMsg");
        	if (error!=null && error!="") out.println(error);%>
        	<br>
        	<br>
			<label for="user">Usuario: </label><input type="text" name="user" required><br><br>
			<label for="pass">Contraseña: </label><input type="password" name="pass" required><br><br>
			<!-- Aquí habría que autenticarlo con el signle sign on... De momento dejo pasar con mi pass -->
			<br>
			<input type="submit" value="Login">
		</form>	
	</body>
</html>