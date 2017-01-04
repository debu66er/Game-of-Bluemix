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

	public List<Pregunta> getPregunta() {
		
		List<Pregunta> preguntas = new ArrayList<Pregunta>();
		
		try {
			con = Conexion.init();
			st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);			
			rs = st.executeQuery("SELECT * FROM CUESTIONARIOBM");
			String pregunta, resp1, resp2, resp3, resp4, oculta, workshop;
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
				workshop = rs.getString("workshop");
				
				Pregunta preg = new Pregunta(id, pregunta, resp1, resp2, resp3, resp4, correcta, oculta, workshop);
				preguntas.add(preg);
			}
		    
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return preguntas;
	}
	
	public void editarPregunta(int id, String pregunta, String resp1, String resp2, String resp3, String resp4, int correcta, String oculta, String workshop) {
		String query;
		
		try {
			con = Conexion.init();
			st = con.createStatement();
			
			query = "UPDATE CUESTIONARIOBM SET PREGUNTA = '" + pregunta 
					+ "', RESP1 = '" + resp1 
					+ "', RESP2 = '" + resp2 
					+ "', RESP3 = '" + resp3 
					+ "', RESP4 = '" + resp4 
					+ "', CORRECTA = '" + correcta
					+ "', OCULTA = '" + oculta
					+ "', WORKSHOP = '" + workshop
					+ "' WHERE ID = '" + id + "'";
			
			st.executeUpdate(query);
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}

	public void eliminarPregunta(int id) {
		String query;
		try {
			con = Conexion.init();
			st = con.createStatement();
			query = "DELETE FROM CUESTIONARIOBM WHERE ID='" + id + "'"; 
			st.executeUpdate(query);
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void aniadirPregunta(String pregunta, String resp1, String resp2, String resp3, String resp4, int correcta, String oculta, String workshop) {
		String query;
		try {
			con = Conexion.init();
			st = con.createStatement();			
			query = "INSERT INTO CUESTIONARIOBM VALUES" + "(DEFAULT, '"	+ pregunta + "','" + resp1 + "','" + resp2 + "','" + resp3 + "','" + resp4 + "','" + correcta + "','" + oculta + "','"+workshop+"')";
			st.executeUpdate(query);
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}
}
