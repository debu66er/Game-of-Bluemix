package com.ibm.logica;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.ibm.conexion.Conexion;

public class Encuesta {
	
	public void guardarDatos (HttpServletRequest request) {
		
		HttpSession sesion=request.getSession();
		String mensaje;
		boolean correcto = true;
		int filas;
		
		sesion.setAttribute("empresa", request.getParameter("empresa"));
		
		String evento = null, nombre = null, empresa = null, email = null, telefono = null, ciudad =null;
		int vEvento = 0, vInstructor = 0, vOrganizacion = 0, vAgenda = 0, vPresentaciones = 0, vLaboratorios = 0;
		String mas = null, menos = null;
		int cAntes = 0, cDespues = 0;
		String sugerencias = null;
		String contacto = null;
		
		nombre = request.getParameter("nombre");
		empresa = request.getParameter("empresa");
		email = request.getParameter("email");
		telefono = request.getParameter("telefono");
		evento = request.getParameter("evento");
		ciudad = request.getParameter("ciudad");
		vEvento = aEntero(request.getParameter("vEvento"));
		vInstructor = aEntero(request.getParameter("vInstructor"));
		vOrganizacion = aEntero(request.getParameter("vOrganizacion"));
		vAgenda = aEntero(request.getParameter("vAgenda"));
		vPresentaciones = aEntero(request.getParameter("vPresentaciones"));
		vLaboratorios = aEntero(request.getParameter("vLaboratorios"));
		mas = request.getParameter("mas");
		menos = request.getParameter("menos");
		cAntes = aEntero(request.getParameter("cAntes"));
		cDespues = aEntero(request.getParameter("cDespues"));
		sugerencias = request.getParameter("sugerencias");
		contacto = request.getParameter("contacto");
		
		if (contacto == null) {
			contacto = "yes";
		}
		
		try {
			Connection con = Conexion.init();
			Statement st = con.createStatement(); 
			
			String qInsert = "INSERT INTO ENCUESTA VALUES(CURRENT_TIMESTAMP, '"
								+ nombre + "', '" 
								+ empresa + "', '" 
								+ email + "', '" 
								+ telefono + "', '"
								+ evento + "', '" 
								+ ciudad + "', " 
								+ vEvento + ", " 
								+ vInstructor + ", " 
								+ vOrganizacion + ", " 
								+ vAgenda + ", " 
								+ vPresentaciones + ", " 
								+ vLaboratorios + ", '" 
								+ mas + "', '" 
								+ menos + "', " 
								+ cAntes + ", " 
								+ cDespues + ", '" 
								+ sugerencias + "', '" 
								+ contacto + "')";
			
			System.out.println(qInsert);
			
			filas = st.executeUpdate(qInsert);
			
			if (filas <= 0) {
				correcto = false;
			} 
			
			if (correcto) {
				mensaje = "\u00a1Gracias por rellenar la encuesta!  Los datos se han guardado correctamente.";
				request.setAttribute("evento", evento);
			} else {
				mensaje = "Ha habido un error, por favor, intenta rellenar la encuesta de nuevo.";
			}
			request.setAttribute("mensaje", mensaje);
			
			con.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private int aEntero(String palabra) {
		int valor = 0;
		
		if (palabra == null) {
			valor = 0;
		}
		else {
			if (palabra.equals("mBajo")) {
				valor = 1;
			} else if (palabra.equals("bajo")) {
				valor = 2;
			} else if (palabra.equals("medio")) {
				valor = 3;
			} else if (palabra.equals("alto")) {
				valor = 4;
			} else if (palabra.equals("mAlto")) {
				valor = 5;
			} 
		}
		
		return valor;
	}
}