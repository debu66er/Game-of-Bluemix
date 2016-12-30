package com.ibm.logica.gestion;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.ibm.conexion.Conexion;
import com.ibm.logica.modelo.Categoria;

public class gCategorias {
	
	private Connection con = null;
	private Statement st = null;
	private ResultSet rs = null;

	public List<Categoria> getCategoria() {
		
		List<Categoria> categorias = new ArrayList<Categoria>();
		
		try {
			con = Conexion.init();
			st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs = st.executeQuery("SELECT * FROM CATEGORIA ORDER BY TIPO");
			String nombre, tipo;
			
			while (rs.next()) {
				
				nombre = rs.getString("nombre");
				tipo = rs.getString("tipo");
				
				Categoria categoria = new Categoria (nombre, tipo);
				categorias.add(categoria);
			}
		    
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return categorias;
	}

	public void eliminarCategoria(String nombre, String tipo) {
		String query;
		try {
			con = Conexion.init();
			st = con.createStatement();
			query = "DELETE FROM CATEGORIA WHERE NOMBRE='" + nombre + "' AND TIPO ='" + tipo + "'"; 
			st.executeUpdate(query);
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void aniadirEnlace(String nombre, String tipo) {
		String query;
		try {
			con = Conexion.init();
			st = con.createStatement();
			query = "INSERT INTO CATEGORIA VALUES" + "('"	+ nombre + "','" + tipo + "')";
			st.executeUpdate(query);
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}	
	}
}
