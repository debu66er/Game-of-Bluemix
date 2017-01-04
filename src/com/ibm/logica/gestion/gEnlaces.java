package com.ibm.logica.gestion;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.ibm.conexion.Conexion;
import com.ibm.logica.modelo.Enlace;

public class gEnlaces {
	
	private Connection con = null;
	private Statement st = null;
	private ResultSet rs = null;

	public List<Enlace> getLink() {
		
		List<Enlace> enlaces = new ArrayList<Enlace>();
		
		try {
			con = Conexion.init();
			st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
					
			///NO FUNCIONA EL ORDER BY CASE
			rs = st.executeQuery("SELECT * FROM ENLACESBM ORDER BY CASE CATEGORIA WHEN 'Páginas oficiales' THEN 1 WHEN 'Documentación oficial' THEN 2 ELSE 3 END");
			String alias, categoria, link, oculto;
			
			while (rs.next()) {
				
				alias = rs.getString("alias");
				categoria = rs.getString("categoria");
				link = rs.getString("link");
				oculto = rs.getString("oculto");
				
				Enlace enlace = new Enlace (alias, categoria, link, oculto);
				enlaces.add(enlace);
			}
		    
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return enlaces;
	}
	
	public List<String> getCategorias() {
		List<String> categorias = new ArrayList<String>();
		
		try {
			con = Conexion.init();
			st = con.createStatement();
			rs = st.executeQuery("SELECT NOMBRE FROM CATEGORIA WHERE TIPO='Enlaces'");
			
			while (rs.next()) {
				categorias.add(rs.getString(1));
			}
		    
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
		return categorias;
	}

	public void editarEnlace(String alias, String categoria, String link, String oculto) {
		String query;
		try {
			con = Conexion.init();
			st = con.createStatement();
			query = "UPDATE ENLACESBM SET ALIAS = '" + alias + "', CATEGORIA = '" + categoria + "', OCULTO = '" + oculto + "' WHERE LINK = '" + link + "'";
			st.executeUpdate(query);
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}	
	}

	public void eliminarEnlace(String link) {
		String query;
		try {
			con = Conexion.init();
			st = con.createStatement();		
			query = "DELETE FROM ENLACESBM WHERE LINK='" + link + "'"; 
			st.executeUpdate(query);
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void aniadirEnlace(String alias, String categoria, String link, String oculto) {
		String query;
		try {
			con = Conexion.init();
			st = con.createStatement();		
			query = "INSERT INTO ENLACESBM VALUES" + "('"	+ alias + "','" + categoria + "','" + link + "','" + oculto + "')";
			st.executeUpdate(query);
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}	
	}
}
