<%@page language="java"%>
<%@page import="java.util.Iterator" %>
<%@page import="java.util.List"%>
<%@page import="java.io.File" %>
<%@page import="com.ibm.logica.modelo.Encuesta" %>
<%@page import="com.ibm.logica.estadisticas.Consultas" %>

<!DOCTYPE html>

<html lang="es">
	<head>
		<title>Estad�sticas</title>
		<meta charset="UTF-8">
		<meta name="application-name" content="AdminBluemixSoftLayer">
		<meta name="keywords" content="IBM, Bluemix, SoftLayer, Cloud">
		<link rel="stylesheet" href="/Administrador/admin.css" type="text/css" media="all" />
	</head>
	
	<body>
		<% String user =(String) request.getSession().getAttribute("userName");
	    if (user==null){
	       RequestDispatcher rs = request.getServletContext().getRequestDispatcher("/Administrador/index.jsp"); 
	        rs.forward(request, response);
   		 }%>	
		<div class="banner">
			<a class="enlace" href="http://gameofbluemix.mybluemix.net/"><img src="images/bluemix-logo.png" style="padding-top:2px; vertical-align: middle;">&nbsp;&nbsp;&nbsp;&nbsp;Game of Bluemix </a>
			<div class="admin">
				<a class="enlace" href="/Administrador/index.jsp"> Administrador </a>
			</div>
		</div>
		
		<div class="cuerpo">
			<h1>Estad�sticas</h1>
			<%	
				HttpSession s = request.getSession();
				Consultas encuestas = new Consultas();
				String sesion = (String)s.getAttribute("sesion");
				List<Encuesta> enc = encuestas.getDatos();
				s.setAttribute("encuestas", enc);
				Iterator<Encuesta> iter = enc.iterator();
				Encuesta encuesta;				
			%>
			<table>
				<tr>
					<th scope="col">Evento</th>
					<th scope="col">Fecha</th>
					<th scope="col">Nombre y apellidos</th>
					<th scope="col">Empresa</th>
					<th scope="col">E-mail</th>
					<th scope="col">Tel�fono</th>
					<th scope="col">Valoraci�n del evento</th>
					<th scope="col">Valoraci�n del instructor</th>
					<th scope="col">Valoraci�n de la organizaci�n</th>
					<th scope="col">Valoraci�n de la agenda</th>
					<th scope="col">Valoraci�n de las presentaciones</th>
					<th scope="col">Valoraci�n de los laboratorios</th>
					<th scope="col">Mejor presentaci�n o laboratorio</th>
					<th scope="col">Peor presentaci�n o laboratorio</th>
					<th scope="col">Conocimientos previos</th>
					<th scope="col">Conocimientos despu�s</th>
					<th scope="col">Sugerencias</th>
					<th scope="col">Contacto</th>
				</tr>
				<%						
					while (iter.hasNext()) {
						encuesta = iter.next();
						
				%>
						<tr>
							<td><%= encuesta.getEvento() %></td>
							<td><%= encuesta.getFecha() %></td>
							<td><%= encuesta.getNombre() %></td>
							<td><%= encuesta.getEmpresa() %></td>
							<td><%= encuesta.getEmail() %></td>
							<td><%= encuesta.getTelefono() %></td>
							<td><%= encuesta.getVevento() %></td>
							<td><%= encuesta.getVinstructor() %></td>
							<td><%= encuesta.getVorganizacion() %></td>
							<td><%= encuesta.getVagenda() %></td>
							<td><%= encuesta.getVpresentaciones() %></td>
							<td><%= encuesta.getVlaboratorios() %></td>
							<td><%= encuesta.getMejor() %></td>
							<td><%= encuesta.getPeor() %></td>
							<td><%= encuesta.getCantes() %></td>
							<td><%= encuesta.getCdespues() %></td>
							<td><%= encuesta.getSugerencias() %></td>
							<td><%= encuesta.getContacto() %></td>
						</tr>
				<%
					}
				%>
			</table>
			
			<form action="/descargarCSV" method="post">
				<input type="hidden" name="narchivo" value="prueba.csv">
				<input type="hidden" name="pagina" value="descargar">
				<input type="submit" value="Descargar CSV">
			</form>
			
			<br> <br>
		</div>
	</body>
</html>