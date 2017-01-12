<%@page language="java"%>
<%@page import="java.util.Iterator" %>
<%@page import="java.util.List"%>
<%@page import="com.ibm.logica.modelo.Material" %>
<%@page import="com.ibm.logica.gestion.gMaterial" %>

<!DOCTYPE html>

<html lang="es">
	<head>
		<title>Administrador - Gestión de Material</title>
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
			<h1> Gestión de material </h1>
			<%
				HttpSession s = request.getSession();	
				gMaterial materiales = new gMaterial();
				List<Material> mat = materiales.getMaterial();
				Iterator<Material> iter = mat.iterator();
				Material material;
				
				String catActual = "";
				int nMat = 0;
				
				while (iter.hasNext()) {
					material = iter.next();
					nMat++;
					
					if (!catActual.equals(material.getCategoria())) {
						catActual = material.getCategoria();
			%>
						<br><h2 align="center"><%= catActual %></h2>
			<%	
					}
			%>
					<form action="/gestion" method="post">
						<div align="center">
							<h3><%= material.getNombre() %>: <a href="<%= material.getLink() %>" class="enlace"><%= material.getLink() %></a><% if (material.getOculto().equals("yes")) { %> (O) <% } %>
							
							<% String accion = "accion" + nMat; %>
							<input type="hidden" name="pagina" value="material">		
							<input type="hidden" name="nombre" value="<%= material.getNombre() %>">
							<input type="hidden" name="descripcion" value="<%= material.getDescripcion() %>">
							<input type="hidden" name="categoria" value="<%= material.getCategoria() %>">
							<input type="hidden" name="link" value="<%= material.getLink() %>">
							<input type="hidden" name="oculto" value="<%= material.getOculto() %>">
							
							<input type="hidden" name="accion" id="<%= accion %>" value="novalue">&nbsp;&nbsp;
							<input type="image" src="images/editar.png" alt="Editar" onClick="document.getElementById('<%= accion %>').value='editar';">
							<input type="image" src="images/eliminar.png" alt="Eliminar" onClick="document.getElementById('<%= accion %>').value='eliminar'; return confirm('¿Estás seguro de que deseas eliminar este material?');"></h3>
							<p class="descripcion" align="center"><%= material.getDescripcion() %></p><br>
						</div>
					</form>
			<%
				}
			%>
			<br> <br>
			<div style="text-align: center;">
				<a href="aniadirMaterial.jsp"><button>Añadir nuevo material</button></a>
			</div>
		</div>
	</body>
</html>