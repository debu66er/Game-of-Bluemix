package com.ibm.logica;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.ibm.conexion.Conexion;

public class Lista {
	
	public List<Material> getMaterial () {
		List<Material> material = new ArrayList<Material>();
		try {
			Connection con = Conexion.init();
			Statement st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			ResultSet rs = st.executeQuery("SELECT * FROM MATERIALBM WHERE OCULTO = 'no' ORDER BY CATEGORIA");
			
			String nombre, descripcion, categoria, link;
			
			while (rs.next()) {
				nombre = rs.getString("nombre");
				descripcion = rs.getString("descripcion");
				categoria = rs.getString("categoria");
				link = rs.getString("link");
				
				Material mat = new Material (nombre, descripcion, categoria, link);
				material.add(mat);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return material;
	}
	
	public List<Enlace> getLink() {
		List<Enlace> enlaces = new ArrayList<Enlace>();
		try {
			Connection con = Conexion.init();
			Statement st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			ResultSet rs = st.executeQuery("SELECT * FROM ENLACESBM  WHERE OCULTO = 'no' ORDER BY CATEGORIA");
			
			String alias, categoria, link;
			
			while (rs.next()) {
				
				alias = rs.getString("alias");
				categoria = rs.getString("categoria");
				link = rs.getString("link");
				
				Enlace enlace = new Enlace (alias, categoria, link);
				enlaces.add(enlace);
			}
			
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return enlaces;
	}
	
	public List<Evento> getEventos() {
		List<Evento> eventos = new ArrayList<Evento>();
		try {
			Connection con = Conexion.init();
			Statement st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			ResultSet rs = st.executeQuery("SELECT * FROM EVENTOSBM WHERE FECHA >= CURRENT_DATE AND OCULTO = 'no' ORDER BY FECHA");
			
			String nombre, lugar, fechaS, responsable, contacto;
			Date fecha;
			DateFormat formato = new SimpleDateFormat("dd.MM.yyyy");
			
			while (rs.next()) {
				
				nombre = rs.getString("nombre");
				lugar = rs.getString("lugar");
				fecha = rs.getDate("fecha");
				responsable = rs.getString("responsable");
				contacto = rs.getString("contacto");
				
				fechaS = formato.format(fecha);
				
				Evento evento = new Evento (nombre, lugar, fechaS, responsable, contacto);
				eventos.add(evento);
			}
			
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return eventos;
	}
	
	public List<Pregunta> getPreguntasAleatorias(int n) {  //n = número de preguntas que se quieren mostrar
		List<Pregunta> preguntas = new ArrayList<Pregunta>();
		try {
			Connection con = Conexion.init();
			Statement st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			ResultSet rs = st.executeQuery("SELECT * FROM CUESTIONARIOBM WHERE OCULTA = 'no'");
			
			int max;			
			int[] num = new int[n];
			int aux;
			boolean existe;
			
			String pregunta, resp1, resp2, resp3, resp4;
			int correcta;
			
			rs.last();
			max = rs.getRow();
			
			if (n > max) {
				System.out.println("No hay suficientes preguntas en la BBDD");
				n = max;
			}
			
			for (int i = 0; i < n; i++) {

				rs.first();
				do {
					existe = false;
					aux = (int) Math.floor(Math.random()*(max)+1);
					for (int j = 0; j < i; j++) {
						if (num [j] == aux) {
							existe = true;
						}
					}
				} while (existe);
				
				num[i] = aux;
				
				rs.relative(aux-1);
				
				pregunta = rs.getString("pregunta");
				resp1 = rs.getString("resp1");
				resp2 = rs.getString("resp2");
				resp3 = rs.getString("resp3");
				resp4 = rs.getString("resp4");
				correcta = rs.getInt("correcta");
				
				Pregunta preg = new Pregunta (pregunta, resp1, resp2, resp3, resp4, correcta);
				preguntas.add(preg);
			}
			
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return preguntas;
	}
}
