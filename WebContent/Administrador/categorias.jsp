<%@page language="java"%>
<%@page import="java.util.Iterator" %>
<%@page import="java.util.List"%>
<%@page import="com.ibm.logica.modelo.Categoria" %>
<%@page import="com.ibm.logica.gestion.gCategorias" %>

<!DOCTYPE html>

<html lang="es">
	<head>
		<title>Administrador - Gesti�n de Categor�as</title>
		<meta charset="UTF-8">
		<meta name="author" content="Noelia Herranz & Mauro Lucchini">
		<meta name="application-name" content="Administraci�n">
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
			<h1> Gesti�n de categor�as </h1>
			<%
				HttpSession s = request.getSession();
				gCategorias categorias = new gCategorias();
				String sesion = (String)s.getAttribute("sesion");
				List<Categoria> cats = categorias.getCategoria();
				Iterator<Categoria> iter = cats.iterator();
				Categoria categoria;
				
				String tipActual = "";
				int nCats = 0;
				
				while (iter.hasNext()) {
					categoria = iter.next();
					nCats++;
					
					if (!tipActual.equals(categoria.getTipo())) {
						tipActual = categoria.getTipo();
			%>
						<br><h2 align="center"><%= tipActual %></h2>
			<%	
					}
			%>
					<form action="/gestion" method="post">
						<div align="center">
							<%= categoria.getNombre() %>
							<% String accion = "accion" + nCats; %>
							<input type="hidden" name="pagina" value="categorias">		
											
							<input type="hidden" name="nombre" value="<%= categoria.getNombre() %>">
							<input type="hidden" name="tipo" value="<%= categoria.getTipo() %>">
							
							<input type="hidden" name="accion" id="<%= accion %>" value="novalue">&nbsp;&nbsp;
							<input type="image" src="images/eliminar.png" alt="Eliminar" onClick="document.getElementById('<%= accion %>').value='eliminar'; return confirm('�Est�s seguro de que deseas eliminar esta categoria?');">
						</div>
					</form>
			<%
				}
			%>
			<br> <br>
			<div style="text-align: center;">
				<a href="aniadirCategoria.jsp"><button>A�adir nueva categor�a</button></a>
			</div>
		</div>
	</body>
</html>