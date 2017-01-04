package com.ibm.servlets;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ibm.logica.estadisticas.Consultas;
import com.ibm.logica.gestion.gCategorias;
import com.ibm.logica.gestion.gEnlaces;
import com.ibm.logica.gestion.gEventos;
import com.ibm.logica.gestion.gMaterial;
import com.ibm.logica.gestion.gPreguntas;
import com.ibm.logica.modelo.Encuesta;

@WebServlet({"/admin", "/index", "/gestion", "/aniadir", "/editar", "/descargarCSV"})
public class adminControlador extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@SuppressWarnings("unchecked")
	public void doPost(HttpServletRequest request, HttpServletResponse response) {

		String pagina = request.getParameter("pagina");

		if (pagina.equals("index")) {
			try {
				//pendiente añadir servicio SSO
				if (request.getParameter("pass").equals("pass1234")) 
				request.getRequestDispatcher("/Administrador/elegir.jsp").forward(request, response);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		if (pagina.equals("descargar")) {
			
			response.setContentType("text/html;charset=UTF-8");
	        try {
	        	Consultas consulta = new Consultas();
	        	String url = request.getSession().getServletContext().getRealPath("/") + "/documents/prueba.csv";
	        	List<Encuesta> usuarios = (List<Encuesta>) request.getSession().getAttribute("encuestas");
	        	File archivo = new File (url);
	        	ServletOutputStream out = response.getOutputStream();
	        	
	        	consulta.generarArchivo(usuarios, archivo);
	        	
	        	response.setContentType("text/csv");
	            response.setHeader("Content-Disposition", "filename=prueba.csv");
	        	
	        	consulta.descargar(archivo, out);      
	        	
	        	archivo.delete();
	            
	        } catch (IOException e){
	        	e.printStackTrace();
	        } 
		}
		
		if (pagina.equals("enlaces")) {
			String accion = request.getParameter("accion");	
			String link = request.getParameter("codLink");

			try {
				if (accion.equals("editar")) {
					request.getRequestDispatcher("/Administrador/editarEnlace.jsp").forward(request, response);
				}
				else if (accion.equals("eliminar")) {
					gEnlaces enlace = new gEnlaces();
					enlace.eliminarEnlace(link);
					response.sendRedirect("/Administrador/enlaces.jsp");
				}
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		else if (pagina.equals("eventos")) {			
			String accion = request.getParameter("accion");	
			String nombre = request.getParameter("nombre");
			String lugar = request.getParameter("lugar");
			String fecha = request.getParameter("fecha");

			try {
				if (accion.equals("editar")) {
					request.getRequestDispatcher("/Administrador/editarEvento.jsp").forward(request, response);
				}
				else if (accion.equals("eliminar")) {
					gEventos evento = new gEventos();
					evento.eliminarEvento(nombre, fecha, lugar);
					response.sendRedirect("/Administrador/geventos.jsp");
				}
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		else if (pagina.equals("material")) {
			String accion = request.getParameter("accion");
			String link = request.getParameter("link");
			
			try {
				if (accion.equals("editar")) {
					request.getRequestDispatcher("/Administrador/editarMaterial.jsp").forward(request, response);
				}
				else if (accion.equals("eliminar")) {
					gMaterial material = new gMaterial();
					material.eliminarMaterial(link);
					response.sendRedirect("/Administrador/material.jsp");
				}
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		else if (pagina.equals("categorias")) {
			String accion = request.getParameter("accion");
			String nombre = request.getParameter("nombre");
			String tipo = request.getParameter("tipo");
			
			try {
				if (accion.equals("eliminar")) {
					gCategorias categoria = new gCategorias();
					categoria.eliminarCategoria(nombre, tipo);
					response.sendRedirect("/Administrador/categorias.jsp");
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		else if (pagina.equals("preguntas")) {
			String accion = request.getParameter("accion");
			int id = Integer.parseInt(request.getParameter("id"));

			try {
				if (accion.equals("editar")) {
					request.getRequestDispatcher("/Administrador/editarPregunta.jsp").forward(request, response);
				}
				else if (accion.equals("eliminar")) {
					gPreguntas pregunta = new gPreguntas();
					pregunta.eliminarPregunta(id);
					response.sendRedirect("/Administrador/preguntas.jsp");
				}
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		else if (pagina.equals("aniadirEnlace")) {
			String alias = request.getParameter("alias");
			String categoria = request.getParameter("categoria");
			String link = request.getParameter("link");
			String oculto = request.getParameter("oculto");
			
			if ((oculto == null) || (!(oculto.equals("yes")))) oculto = "no";
			
			gEnlaces enlace = new gEnlaces();
			enlace.aniadirEnlace(alias, categoria, link, oculto);
			try {
				response.sendRedirect("/Administrador/enlaces.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		else if (pagina.equals("aniadirEvento")) {			
			String nombre = request.getParameter("nombre");
			String lugar = request.getParameter("lugar");
			String fecha = request.getParameter("fecha");
			String responsable = request.getParameter("responsable");
			String contacto = request.getParameter("contacto");
			String oculto = request.getParameter("oculto");
			
			if ((oculto == null) || (!(oculto.equals("yes")))) oculto = "no";
			
			gEventos evento = new gEventos();
			evento.aniadirEvento(nombre, fecha, lugar, responsable, contacto, oculto);
			try {
				response.sendRedirect("/Administrador/eventos.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		else if (pagina.equals("aniadirMaterial")) {			
			String nombre = request.getParameter("nombre");
			String descripcion = request.getParameter("descripcion");
			String categoria = request.getParameter("categoria");
			String link = request.getParameter("link");
			String oculto = request.getParameter("oculto");
			
			if ((oculto == null) || (!(oculto.equals("yes")))) oculto = "no";
			
			gMaterial material = new gMaterial();
			material.aniadirMaterial(nombre, descripcion, categoria, link, oculto);
			try {
				response.sendRedirect("/Administrador/material.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		else if (pagina.equals("aniadirCategoria")) {			
			String nombre = request.getParameter("nombre");
			String tipo = request.getParameter("tipo");
			
			gCategorias categoria = new gCategorias();
			categoria.aniadirEnlace(nombre, tipo);
			try {
				response.sendRedirect("/Administrador/categorias.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		else if (pagina.equals("aniadirPregunta")) {			
			String preg = request.getParameter("preg");
			String resp1 = request.getParameter("resp1");
			String resp2 = request.getParameter("resp2");
			String resp3 = request.getParameter("resp3");
			String resp4 = request.getParameter("resp4");
			int correcta = Integer.parseInt(request.getParameter("correcta"));
			String workshop = request.getParameter("workshop");
			String oculta = request.getParameter("oculta");
			
			if ((oculta == null) || (!(oculta.equals("yes")))) oculta = "no";
			
			gPreguntas pregunta = new gPreguntas();
			pregunta.aniadirPregunta(preg, resp1, resp2, resp3, resp4, correcta, oculta, workshop);
			try {
				response.sendRedirect("/Administrador/preguntas.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		else if (pagina.equals("editarEnlace")) {
			String alias = request.getParameter("alias");
			String categoria = request.getParameter("categoria");
			String link = request.getParameter("codLink");
			String oculto = request.getParameter("oculto");
			
			if ((oculto == null) || (!(oculto.equals("yes")))) oculto = "no";
			
			gEnlaces enlace = new gEnlaces();
			enlace.editarEnlace(alias, categoria, link, oculto);
			try {
				response.sendRedirect("/Administrador/enlaces.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		else if (pagina.equals("editarEvento")) {			
			String nombre = request.getParameter("nombre");
			String lugar = request.getParameter("lugar");
			String fecha = request.getParameter("fecha");
			String responsable = request.getParameter("responsable");
			String contacto = request.getParameter("contacto");
			String oculto = request.getParameter("oculto");
			
			if ((oculto == null) || (!(oculto.equals("yes")))) oculto = "no";
			
			gEventos evento = new gEventos();
			evento.editarEvento(nombre, lugar, fecha, responsable, contacto, oculto);
			try {
				response.sendRedirect("/Administrador/eventos.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		else if (pagina.equals("editarMaterial")) {			
			String nombre = request.getParameter("nombre");
			String descripcion = request.getParameter("descripcion");
			String categoria = request.getParameter("categoria");
			String link = request.getParameter("link");
			String oculto = request.getParameter("oculto");
			
			if ((oculto == null) || (!(oculto.equals("yes")))) oculto = "no";
			
			gMaterial material = new gMaterial();
			material.editarMaterial(nombre, descripcion, categoria, link, oculto);
			try {
				response.sendRedirect("/Administrador/material.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		else if (pagina.equals("editarPregunta")) {	
			int id = Integer.parseInt(request.getParameter("id"));
			String preg = request.getParameter("preg");
			String resp1 = request.getParameter("resp1");
			String resp2 = request.getParameter("resp2");
			String resp3 = request.getParameter("resp3");
			String resp4 = request.getParameter("resp4");
			int correcta = Integer.parseInt(request.getParameter("correcta"));
			String oculta = request.getParameter("oculta");
			String workshop = request.getParameter("workshop");
			
			if ((oculta == null) || (!(oculta.equals("yes")))) oculta = "no";
			
			gPreguntas pregunta = new gPreguntas();
			pregunta.editarPregunta(id, preg, resp1, resp2, resp3, resp4, correcta, oculta, workshop);
			try {
				response.sendRedirect("/Administrador/preguntas.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}