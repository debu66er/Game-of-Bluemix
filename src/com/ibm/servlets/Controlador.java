package com.ibm.servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.channels.Channels;
import java.nio.channels.ReadableByteChannel;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.ibm.logica.Badges;
import com.ibm.logica.Encuesta;
import com.ibm.logica.Idea;
import com.ibm.logica.Reto;

@WebServlet({"/servlet", "/encuesta", "/idea", "/reto", "/badge"})
public class Controlador extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session=request.getSession();
		try {
			if (request.getParameter("pagina").equals("retoworkshop")) {
				String workshop = request.getParameter("workshop");
				session.setAttribute("workshop", workshop);	
				request.getRequestDispatcher("/reto.jsp").forward(request, response);
			} else if (request.getParameter("pagina").equals("encuesta")) {
				Encuesta encuesta = new Encuesta();
				String evento = request.getParameter("evento");
				session.setAttribute("encuesta",true);
				session.setAttribute("evento",evento);
				encuesta.guardarDatos(request);
				String mensaje = (String) request.getAttribute("mensaje");
				session.setAttribute("mensaje", mensaje);
				request.getRequestDispatcher("/respuesta.jsp").forward(request, response);
			} else if (request.getParameter("pagina").equals("reto")) {
				Reto reto = new Reto();
				reto.corregir(request);
				request.getRequestDispatcher("/rReto.jsp").forward(request, response);
			} else if (request.getParameter("pagina").equals("idea")) {
				Idea idea = new Idea();
				idea.guardarDatos(request);
				request.getRequestDispatcher("/rIdea.jsp").forward(request, response);
			} else if (request.getParameter("pagina").equals("rReto")) {
				
				Badges badges = new Badges();
				badges.guardarBadge(request);
				
				//Mostrar una pagina con el badge y las instrucciones para obtenerla
				//request.getRequestDispatcher("/badge.jsp").forward(request, response);
				request.getRequestDispatcher("/badge.jsp").forward(request, response);
			} else if (request.getParameter("pagina").equals("poll")) {
				boolean done = false;
				String mensaje;
				String evento = request.getParameter("evento");
				String email = request.getParameter("email");
				Encuesta encuesta = new Encuesta();
				done=encuesta.alreadyDone(email, evento);
				if(done){
					mensaje = "\u00a1Gracias por haber rellenado la encuesta!";
					request.setAttribute("evento", evento);
				} else {
					mensaje = "TodavÃ­a no has rellenado la encuesta del workshop seleccionado.";				
				}
				request.setAttribute("mensaje", mensaje);
				request.setAttribute("correcto", done);
				request.getRequestDispatcher("/respuesta.jsp").forward(request, response);

				
			}
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
