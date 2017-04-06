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
			
		<%
		
		if(session.getAttribute("encuesta") == null || session.getAttribute("encuesta").equals("")){
			session.setAttribute("encuesta", false);
			
		}
		boolean encuesta = (Boolean) session.getAttribute("encuesta");
		
		if(encuesta){
			request.getRequestDispatcher("/respuesta.jsp").forward(request, response);
		}
		else{

		%>
		
		<div class="cuerpo">
			<h1>¡Gracias por tu asistencia!  Nos interesan mucho tu opinión</h1><br><br>
			<form action="/encuesta" method="post">
				<input type="hidden" name="pagina" value="encuesta">
				<table class=form>
					<tr>
						<td class="form">*Nombre y apellidos: </td>
						<td class="form"><input type="text" name="nombre" size=60 maxlength=60 required oninvalid="setCustomValidity('Por favor, complete su nombre y apellidos')" oninput="setCustomValidity('')"/></td>
					</tr>
					<tr>
						<td class="form">*Empresa: </td>
						<td class="form"><input type="text" name="empresa" size=60 maxlength=60 required oninvalid="setCustomValidity('Por favor, complete su empresa')" oninput="setCustomValidity('')" value="<% if (session.getAttribute("empresa") != null) out.print(session.getAttribute("empresa")); %>"/></td>
					</tr>
					<tr>
						<td class="form">*e-mail: </td>
						<td class="form"><input type="email" name="email" size=60 maxlength=60 required oninvalid="setCustomValidity('Por favor, complete su e-mail')" oninput="setCustomValidity('')"/></td>
					</tr>
					<tr>
						<td class="form">*Teléfono: </td>
						<td class="form"><input type="tel" name="telefono" size=60 maxlength=12 required oninvalid="setCustomValidity('Por favor, complete su teléfono')" oninput="setCustomValidity('')"/></td>
					</tr>
					
				</table>
				<br><br>
				
				<h2>Workshop realizado</h2>
				<table class=form>
					<tr class="par">
						<td>Game of Bluemix: Essentials</td>
						<td class="input"><input type="radio" name="evento" value="essentials"></td>
					</tr>
					<tr class="impar">
						<td>Game of Bluemix: Experienced - CloudFoundry & Openwhisk</td>
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
				
				<h2>Ciudad donde se ha realizado el Workshop</h2>
				<table class=form>
					<tr class="par">
					<td>Barcelona</td>
						<td class="input"><input type="radio" name="ciudad" value="barcelona"></td>
						
					</tr>
					<tr class="impar">
						<td>Bilbao</td>
						<td class="input"><input type="radio" name="ciudad" value="bilbao"></td>
					</tr>
					
					<tr class="par">
						<td>Madrid</td>
						<td class="input"><input type="radio" name="ciudad" value="madrid"></td>
					</tr>
					<tr class="impar">
						<td>Otra</td>
						<td class="input"><input type="radio" name="ciudad" value="otra"></td>
					</tr>
				</table>
				<br><br>

				
				<h2>Satisfacción general</h2>
				<table class=form>
					<tr>
						<th></th>
						<th>1</th>
						<th>2</th>
						<th>3</th>
						<th>4</th>
						<th>5</th>
					</tr>
					<tr class="par">
						<td>Valoración general del evento</td>
						<td class="input"><input type="radio" name="vEvento" value="mBajo"></td>
						<td class="input"><input type="radio" name="vEvento" value="bajo"></td>
						<td class="input"><input type="radio" name="vEvento" value="medio"></td>
						<td class="input"><input type="radio" name="vEvento" value="alto"></td>
						<td class="input"><input type="radio" name="vEvento" value="mAlto"></td>
					</tr>
					<tr class="impar">
						<td>Valoración del instructor/es</td>
						<td class="input"><input type="radio" name="vInstructor" value="mBajo"></td>
						<td class="input"><input type="radio" name="vInstructor" value="bajo"></td>
						<td class="input"><input type="radio" name="vInstructor" value="medio"></td>
						<td class="input"><input type="radio" name="vInstructor" value="alto"></td>
						<td class="input"><input type="radio" name="vInstructor" value="mAlto"></td>
					</tr>
					<tr class="par">
						<td>Valoración de la logística, organización y atención recibida</td>
						<td class="input"><input type="radio" name="vOrganizacion" value="mBajo"></td>
						<td class="input"><input type="radio" name="vOrganizacion" value="bajo"></td>
						<td class="input"><input type="radio" name="vOrganizacion" value="medio"></td>
						<td class="input"><input type="radio" name="vOrganizacion" value="alto"></td>
						<td class="input"><input type="radio" name="vOrganizacion" value="mAlto"></td>
					</tr>
					<tr class="impar">
						<td>Valoración de la agenda y contenido</td>
						<td class="input"><input type="radio" name="vAgenda" value="mBajo"></td>
						<td class="input"><input type="radio" name="vAgenda" value="bajo"></td>
						<td class="input"><input type="radio" name="vAgenda" value="medio"></td>
						<td class="input"><input type="radio" name="vAgenda" value="alto"></td>
						<td class="input"><input type="radio" name="vAgenda" value="mAlto"></td>
					</tr>
					<tr class="par">
						<td>Valoración de las presentaciones</td>
						<td class="input"><input type="radio" name="vPresentaciones" value="mBajo"></td>
						<td class="input"><input type="radio" name="vPresentaciones" value="bajo"></td>
						<td class="input"><input type="radio" name="vPresentaciones" value="medio"></td>
						<td class="input"><input type="radio" name="vPresentaciones" value="alto"></td>
						<td class="input"><input type="radio" name="vPresentaciones" value="mAlto"></td>
					</tr>
					<tr class="impar">
						<td>Valoración de los laboratorios</td>
						<td class="input"><input type="radio" name="vLaboratorios" value="mBajo"></td>
						<td class="input"><input type="radio" name="vLaboratorios" value="bajo"></td>
						<td class="input"><input type="radio" name="vLaboratorios" value="medio"></td>
						<td class="input"><input type="radio" name="vLaboratorios" value="alto"></td>
						<td class="input"><input type="radio" name="vLaboratorios" value="mAlto"></td>
					</tr>
					<tr class="par">
						<td colspan="6" style="text-align:center;">Valoración: 1-muy mala, 2-mala, 3-normal, 4-buena, 5-excelente</td>
					</tr>
				</table>
				<br><br>

				<h2>Preferencias</h2>
				<p>¿Qué presentación y/o laboratorio te ha gustado más? ¿Por qué? &nbsp;&nbsp;&nbsp; <span class="subtitulo">(Máx. 500 caracteres)</span></p>
				<textarea name="mas" rows="5" maxlength=500></textarea><br>
				<p>¿Qué presentación y/o laboratorio te ha gustado menos? ¿Por qué? &nbsp;&nbsp;&nbsp; <span class="subtitulo">(Máx. 500 caracteres)</span></p>
				<textarea name="menos" rows="5" maxlength=500></textarea><br>
				<br><br>	
				
				<h2>Conocimientos adquiridos</h2>
				<table class=form>
					<tr>
						<th></th>
						<th>1</th>
						<th>2</th>
						<th>3</th>
						<th>4</th>
						<th>5</th>
					</tr>
					<tr class="par">
						<td>Antes de asistir a este seminario, ¿qué nivel de conocimiento tení­as sobre la materia vista en el curso?</td>
						<td class="input"><input type="radio" name="cAntes" value="mBajo"></td>
						<td class="input"><input type="radio" name="cAntes" value="bajo"></td>
						<td class="input"><input type="radio" name="cAntes" value="medio"></td>
						<td class="input"><input type="radio" name="cAntes" value="alto"></td>
						<td class="input"><input type="radio" name="cAntes" value="mAlto"></td>
					</tr>
					<tr class="impar">
						<td>Después de asistir a este seminario, ¿qué nivel de conocimiento tienes sobre la materia vista en el curso?</td>
						<td class="input"><input type="radio" name="cDespues" value="mBajo"></td>
						<td class="input"><input type="radio" name="cDespues" value="bajo"></td>
						<td class="input"><input type="radio" name="cDespues" value="medio"></td>
						<td class="input"><input type="radio" name="cDespues" value="alto"></td>
						<td class="input"><input type="radio" name="cDespues" value="mAlto"></td>
					</tr>
					<tr class="par">
						<td colspan="6" style="text-align:center;">Valoración: 1-muy bajo, 2-bajo, 3-intermedio, 4-avanzado, 5-muy avanzado</td>
					</tr>
				</table>
				<br><br>
				
				<h2>Comentarios y/o sugerencias&nbsp;&nbsp;&nbsp; <span class="subtitulo">(Máx. 1000 caracteres)</span></h2>
				<textarea name="sugerencias" rows="10" maxlength=1000></textarea><br>
				<br><br>	
				
				<p style="text-align:justify;">En cumplimiento de lo dispuesto en la Ley Orgánica 15/1999 de 13 de diciembre 
				de Protección de Datos de Carácter Personal, le informamos que los datos personales 
				que usted nos facilite serán incorporados a nuestro/s fichero/s automatizado/s de 
				Marketing. Usted puede ejercitar el derecho de acceso, rectificación, oposición y 
				cancelación previstos en la Ley dirigiendo un escrito a International Business 
				Machines S.A. (IBM), Santa Hortensia, 26-28, 28002 Madrid. IBM, o entidades 
				seleccionadas por ésta, podrán usar dichos datos para enviarle información comercial 
				o de marketing sobre nuestros productos y servicios.</p>
				
				<p style="font-weight:bold"><input type="checkbox" name="contacto" value="no">Marca esta casilla si no deseas ser contactado.</p>
				
				<br><br><div style="text-align:center;"><input type="submit" value="Enviar"></div>
				<br><br><br>
			</form>
		</div>	
		<% } %>	
	</body>
</html>
