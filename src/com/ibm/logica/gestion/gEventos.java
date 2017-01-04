package com.ibm.logica.gestion;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.ibm.conexion.Conexion;
import com.ibm.logica.modelo.Evento;

public class gEventos {

	private Connection con = null;
	private Statement st = null;
	private ResultSet rs = null;

	public List<Evento> getEvento() {
		
		List<Evento> eventos = new ArrayList<Evento>();
		
		try {
			con = Conexion.init();
			st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);			
			rs = st.executeQuery("SELECT * FROM EVENTOSBM ORDER BY FECHA");
			String nombre, lugar, fecha, responsable, contacto, oculto;
			DateFormat form = new SimpleDateFormat("dd.MM.yyyy");
			
			while (rs.next()) {
				
				nombre = rs.getString("nombre");
				lugar = rs.getString("lugar");
				fecha = form.format(rs.getDate("fecha"));
				responsable = rs.getString("responsable");
				contacto = rs.getString("contacto");
				oculto = rs.getString("oculto");
				
				Evento evento = new Evento (nombre, lugar, fecha, responsable, contacto, oculto);
				eventos.add(evento);
			}
		    
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return eventos;
	}
	
	public void editarEvento(String nombre, String lugar, String fecha, String responsable, String contacto, String oculto) {
		String query;
		
		try {
			con = Conexion.init();
			st = con.createStatement();
								
			String fechas[] = fecha.split("[.]");
			fecha = fechas[2] + "-" + fechas[1] + "-" + fechas[0];
			
			query = "UPDATE EVENTOSBM SET RESPONSABLE = '" + responsable + "', CONTACTO = '" + contacto + "', OCULTO = '" + oculto + "' WHERE NOMBRE = '" + nombre + "' AND LUGAR = '" + lugar + "' AND FECHA = '" + fecha + "'";
			
			st.executeUpdate(query);
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}

	public void eliminarEvento(String nombre, String fecha, String lugar) {
		String query;
		try {
			con = Conexion.init();
			st = con.createStatement();
									
			String fechas[] = fecha.split("[.]");
			fecha = fechas[2] + "-" + fechas[1] + "-" + fechas[0];
			
			query = "DELETE FROM EVENTOSBM WHERE NOMBRE='" + nombre + "' AND FECHA = '" + fecha + "' AND LUGAR = '" + lugar + "'"; 
			st.executeUpdate(query);
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void aniadirEvento(String nombre, String fecha, String lugar, String responsable, String contacto, String oculto) {
		String query;
		try {
			con = Conexion.init();
			st = con.createStatement();
					
			String fechas[] = fecha.split("[.]");
			fecha = fechas[2] + "-" + fechas[1] + "-" + fechas[0];
			
			query = "INSERT INTO EVENTOSBM VALUES" + "('"	+ nombre + "','" + lugar + "','" + fecha + "','" + responsable + "','" + contacto + "','" + oculto + "')";
			st.executeUpdate(query);
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}
}
