package com.ibm.logica.gestion;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.ibm.conexion.Conexion;
import com.ibm.logica.modelo.Material;

public class gMaterial {
	private Connection con = null;
	private Statement st = null;
	private ResultSet rs = null;

	public List<Material> getMaterial(String sesion) {
		
		List<Material> material = new ArrayList<Material>();
		
		try {
			con = Conexion.init();
			st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			
			String tabla = null;
			if (sesion.equals("bluemix")) {
				tabla = "MATERIALBM";
			} else if (sesion.equals("softlayer")) {
				tabla = "MATERIALSL";
			}
			
			rs = st.executeQuery("SELECT * FROM " + tabla + " ORDER BY CATEGORIA");
			String nombre, descripcion, categoria, link, oculto;
			
			while (rs.next()) {
				
				nombre = rs.getString("nombre");
				descripcion = rs.getString("descripcion");
				categoria = rs.getString("categoria");
				link = rs.getString("link");
				oculto = rs.getString("oculto");
				
				Material mat = new Material (nombre, descripcion, categoria, link, oculto);
				material.add(mat);
			}
		    
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return material;
	}
	
	public List<String> getCategorias(String sesion) {
		List<String> categorias = new ArrayList<String>();
		
		try {
			con = Conexion.init();
			st = con.createStatement();
			rs = st.executeQuery("SELECT NOMBRE FROM CATEGORIA WHERE TIPO='Material'");
			
			while (rs.next()) {
				categorias.add(rs.getString(1));
			}
		    
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
		return categorias;
	}
	
	public void editarMaterial(String sesion, String nombre, String descripcion, String categoria, String link, String oculto) {
		String query;
		
		try {
			con = Conexion.init();
			st = con.createStatement();
			
			String tabla = null;
			if (sesion.equals("bluemix")) {
				tabla = "MATERIALBM";
			} else if (sesion.equals("softlayer")) {
				tabla = "MATERIALSL";
			}
			
			query = "UPDATE " + tabla + " SET NOMBRE = '" + nombre + "', DESCRIPCION = '" + descripcion + "', CATEGORIA = '" + categoria + "', OCULTO = '" + oculto + "' WHERE LINK = '" + link + "'";
			System.out.println(query);
			st.executeUpdate(query);
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}

	public void eliminarMaterial(String sesion, String link) {
		String query;
		try {
			con = Conexion.init();
			st = con.createStatement();
			
			String tabla = null;
			if (sesion.equals("bluemix")) {
				tabla = "MATERIALBM";
			} else if (sesion.equals("softlayer")) {
				tabla = "MATERIALSL";
			}
			
			query = "DELETE FROM " + tabla + " WHERE LINK='" + link + "'"; 
			st.executeUpdate(query);
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void aniadirMaterial(String sesion, String nombre, String descripcion, String categoria, String link, String oculto) {
		String query;
		try {
			con = Conexion.init();
			st = con.createStatement();
			
			String tabla = null;
			if (sesion.equals("bluemix")) {
				tabla = "MATERIALBM";
			} else if (sesion.equals("softlayer")) {
				tabla = "MATERIALSL";
			}
			
			query = "INSERT INTO " + tabla + " VALUES" + "('"	+ nombre + "','" + descripcion + "','" + categoria + "','" + link + "','" + oculto + "')";
			st.executeUpdate(query);
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}
}
