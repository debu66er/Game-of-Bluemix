<%@page language="java"%>
<%@page import="com.ibm.logica.gestion.gEventos" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Iterator" %>

<!DOCTYPE html>

<html lang="es">
	<head>
		<title>Administrador - Añadir Evento</title>
		<meta charset="UTF-8">
		<meta name="author" content="Noelia Herranz & Mauro Lucchini">
		<meta name="application-name" content="Administraciï¿½n">
		<meta name="keywords" content="IBM, Bluemix, SoftLayer, Lunes, Jueves, Cloud">
		<link rel="stylesheet" href="./admin.css" type="text/css" media="all"/>
		<link rel="icon" type="image/png" href="images/favicon.png">
	</head>
	
	<body>
		<div class="cuerpo">
			<form action="aniadir" method="post">
				<input type="hidden" name="pagina" value="aniadirEvento">
				<table class=form>
					<tr>
						<td class="form">Nombre</td>
						<td class="form"><input type="text" name="nombre" size=60 maxlength=60 required oninvalid="setCustomValidity('Por favor, complete el nombre')" oninput="setCustomValidity('')"></td>
					</tr><tr>	
						<td class="form">Lugar</td>
						<td class="form"><input type="text" name="lugar" size=60 maxlength=60 required oninvalid="setCustomValidity('Por favor, complete el lugar')" oninput="setCustomValidity('')"></td>
					</tr><tr>	
						<td class="form">Fecha</td>
						<td class="form"><input type="text" name="fecha" size=10 maxlength=10 pattern="(0[1-9]|1[0-9]|2[0-9]|3[01]).(0[1-9]|1[012]).[0-9]{4}" title="La fecha debe tener el formato dd.mm.yyyy"></td>
					</tr><tr>
						<td class="form">Responsable</td>
						<td class="form"><input type="text" name="responsable" size=60 maxlength=60 required oninvalid="setCustomValidity('Por favor, complete el responsable')" oninput="setCustomValidity('')"></td>
					</tr><tr>	
						<td class="form">Contacto</td>
						<td class="form"><input type="email" name="contacto" size=60 maxlength=60 required oninvalid="setCustomValidity('Por favor, complete el contacto')" oninput="setCustomValidity('')"></td>
					</tr><tr>	
						<td><input type="checkbox" name="oculto" value="yes">Oculto</td>
					</tr>
				</table>
				<input type="submit" value="Guardar">
			</form>
		</div>
</body>
</html>