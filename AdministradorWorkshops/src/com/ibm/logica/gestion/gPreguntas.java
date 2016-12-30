package com.ibm.logica.gestion;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.ibm.conexion.Conexion;
import com.ibm.logica.modelo.Pregunta;

public class gPreguntas {
	private Connection con = null;
	private Statement st = null;
	private ResultSet rs = null;

	public List<Pregunta> getPregunta(String sesion) {
		
		List<Pregunta> preguntas = new ArrayList<Pregunta>();
		
		try {
			con = Conexion.init();
			st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			
			String tabla = null;
			if (sesion.equals("bluemix")) {
				tabla = "CUESTIONARIOBM";
			} else if (sesion.equals("softlayer")) {
				tabla = "CUESTIONARIOSL";
			}
			
			rs = st.executeQuery("SELECT * FROM " + tabla);
			String pregunta, resp1, resp2, resp3, resp4, oculta;
			int id, correcta;
			
			while (rs.next()) {
				
				id = rs.getInt("id");
				pregunta = rs.getString("pregunta");
				resp1 = rs.getString("resp1");
				resp2 = rs.getString("resp2");
				resp3 = rs.getString("resp3");
				resp4 = rs.getString("resp4");
				correcta = rs.getInt("correcta");
				oculta = rs.getString("oculta");
				
				Pregunta preg = new Pregunta(id, pregunta, resp1, resp2, resp3, resp4, correcta, oculta);
				preguntas.add(preg);
			}
		    
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return preguntas;
	}
	
	public void editarPregunta(String sesion, int id, String pregunta, String resp1, String resp2, String resp3, String resp4, int correcta, String oculta) {
		String query;
		
		try {
			con = Conexion.init();
			st = con.createStatement();
			
			String tabla = null;
			if (sesion.equals("bluemix")) {
				tabla = "CUESTIONARIOBM";
			} else if (sesion.equals("softlayer")) {
				tabla = "CUESTIONARIOSL";
			}
			
			query = "UPDATE " + tabla + " SET PREGUNTA = '" + pregunta 
					+ "', RESP1 = '" + resp1 
					+ "', RESP2 = '" + resp2 
					+ "', RESP3 = '" + resp3 
					+ "', RESP4 = '" + resp4 
					+ "', CORRECTA = '" + correcta
					+ "', OCULTA = '" + oculta
					+ "' WHERE ID = '" + id + "'";
			st.executeUpdate(query);
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}

	public void eliminarPregunta(String sesion, int id) {
		String query;
		try {
			con = Conexion.init();
			st = con.createStatement();
			
			String tabla = null;
			if (sesion.equals("bluemix")) {
				tabla = "CUESTIONARIOBM";
			} else if (sesion.equals("softlayer")) {
				tabla = "CUESTIONARIOSL";
			}
			
			query = "DELETE FROM " + tabla + " WHERE ID='" + id + "'"; 
			st.executeUpdate(query);
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void aniadirPregunta(String sesion, String pregunta, String resp1, String resp2, String resp3, String resp4, int correcta, String oculta) {
		String query;
		try {
			con = Conexion.init();
			st = con.createStatement();
			
			String tabla = null;
			if (sesion.equals("bluemix")) {
				tabla = "CUESTIONARIOBM";
			} else if (sesion.equals("softlayer")) {
				tabla = "CUESTIONARIOSL";
			}
			
			query = "INSERT INTO " + tabla + " VALUES" + "(DEFAULT, '"	+ pregunta + "','" + resp1 + "','" + resp2 + "','" + resp3 + "','" + resp4 + "','" + correcta + "','" + oculta + "')";
			st.executeUpdate(query);
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}
}
