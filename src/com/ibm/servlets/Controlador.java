package com.ibm.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ibm.logica.Encuesta;
import com.ibm.logica.Idea;
import com.ibm.logica.Reto;

@WebServlet({"/servlet", "/encuesta", "/idea", "/reto"})
public class Controlador extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) {
		try {
			if (request.getParameter("pagina").equals("encuesta")) {
				Encuesta encuesta = new Encuesta();
				encuesta.guardarDatos(request);
				request.getRequestDispatcher("/respuesta.jsp").forward(request, response);
			} else if (request.getParameter("pagina").equals("reto")) {
				Reto reto = new Reto();
				reto.corregir(request);
				request.getRequestDispatcher("/rReto.jsp").forward(request, response);
			} else if (request.getParameter("pagina").equals("idea")) {
				Idea idea = new Idea();
				idea.guardarDatos(request);
				request.getRequestDispatcher("/respuesta.jsp").forward(request, response);
			}
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
