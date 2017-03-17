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
				encuesta.guardarDatos(request);
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
				String email=request.getParameter("email");
				TimeZone tz = TimeZone.getTimeZone("UTC");
				DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm'Z'"); // Quoted "Z" to indicate UTC, no timezone offset
				df.setTimeZone(tz);
				String nowAsISO = df.format(new Date());

				
				JSONObject json = new JSONObject();
				JSONObject recjson = new JSONObject();
				JSONObject verjson = new JSONObject();
		
				json.put("uid", UUID.randomUUID().toString());
				
				
				//recient
				recjson.put("type","email");
				recjson.put("identity",email);
				recjson.put("hashed", false);
				json.put("recipient", recjson);
				
				json.put("issuedOn", nowAsISO);
				json.put("badge", "http://gameofbluemix.mybluemix.net/badges/essentials-badge-class.json");
				   
				verjson.put("type","hosted");
				verjson.put("url","http://gameofbluemix.mybluemix.net/badges/awards/essentials-badge-award.json");
				json.put("verify", verjson);
				
				File currentDir = new File("");
				System.out.println(currentDir.getAbsolutePath());
				
				FileWriter file = new FileWriter(currentDir.getAbsolutePath()+"/apps/myapp.war/badges/awards/essentials-badge-award.json");
				
				//FileWriter file = new FileWriter("C:\\Users\\IBM_ADMIN\\git\\Game-of-Bluemix\\WebContent\\badges\\essentials-badge-award.json");
				
				file.write(json.toJSONString());
				
				file.close();
				
				String dir = "http://backpack.openbadges.org/baker?assertion=http://gameofbluemix.mybluemix.net/badges/awards/essentials-badge-award.json";
				//Mostrar una pagina con el badge y las instrucciones para obtenerla			
				request.getRequestDispatcher("/badge.jsp").forward(request, response);
			}
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
