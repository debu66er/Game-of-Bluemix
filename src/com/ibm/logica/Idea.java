package com.ibm.logica;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.ibm.conexion.Conexion;

public class Idea {
	
	public void guardarDatos (HttpServletRequest request) {
		HttpSession sesion=request.getSession();
		boolean correcto = true;
		String mensaje;
		String idea = null, empresa = null;
		int filas;
		
		sesion.setAttribute("empresa", request.getParameter("empresa"));
		
		empresa = request.getParameter("empresa");
		idea = request.getParameter("idea");
		
		try {
			
			Connection con = Conexion.init();
			Statement st = con.createStatement(); 
			
			String qInsert = "INSERT INTO IDEABM VALUES(CURRENT_TIMESTAMP, '" + idea + "', '" + empresa + "')";
			
			filas = st.executeUpdate(qInsert);
			
			if (filas <= 0) {
				correcto = false;
			} 
			
			if (correcto) {
				mensaje = "\u00a1Gracias por tu idea! La tendremos en cuenta.";
			} else {
				mensaje = "Ha habido un error, por favor, inténtalo de nuevo.";
			}
			
			request.setAttribute("mensaje", mensaje);
	
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
