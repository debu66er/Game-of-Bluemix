package com.ibm.conexion;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class gestionTablas {
	
	public static void comprobarTablas(Connection con){
		DatabaseMetaData metadata = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			metadata = con.getMetaData();
			rs = metadata.getTables(null, null, "encuesta", null); 
			if(!rs.next())
			{
				System.out.println("#### Creating the table ENCUESTA...");
				pstmt = con.prepareStatement(Tablas.getEncuesta());
				pstmt.executeUpdate();
				pstmt.close();
			} else {
				System.out.println("#### ENCUESTA table already exists...");
			}
			
			rs = metadata.getTables(null, null, "ideasl", null); 
			if(!rs.next())
			{
				System.out.println("#### Creating the table IDEASL...");
				pstmt = con.prepareStatement(Tablas.getIdeaSL());
				pstmt.executeUpdate();
				pstmt.close();
			} else {
				System.out.println("#### IDEASL table already exists...");
			}
			
			rs = metadata.getTables(null, null, "ideabm", null); 
			if(!rs.next())
			{
				System.out.println("#### Creating the table IDEABM...");
				pstmt = con.prepareStatement(Tablas.getIdeaBM());
				pstmt.executeUpdate();
				pstmt.close();
			} else {
				System.out.println("#### IDEABM table already exists...");
			}
			
			rs = metadata.getTables(null, null, "cuestionariobm", null); 
			if(!rs.next())
			{
				System.out.println("#### Creating the table CUESTIONARIOBM...");
				pstmt = con.prepareStatement(Tablas.getCuestionarioBM());
				pstmt.executeUpdate();
				pstmt.close();
			} else {
				System.out.println("#### CUESTIONARIOBM table already exists...");
			}
			
			rs = metadata.getTables(null, null, "cuestionariosl", null); 
			if(!rs.next())
			{
				System.out.println("#### Creating the table CUESTIONARIOSL...");
				pstmt = con.prepareStatement(Tablas.getCuestionarioSL());
				pstmt.executeUpdate();
				pstmt.close();
			} else {
				System.out.println("#### CUESTIONARIOSL table already exists...");
			}
			
			rs = metadata.getTables(null, null, "eventosbm", null); 
			if(!rs.next())
			{
				System.out.println("#### Creating the table EVENTOSBM...");
				pstmt = con.prepareStatement(Tablas.getEventosBM());
				pstmt.executeUpdate();
				pstmt.close();
			} else {
				System.out.println("#### EVENTOSBM table already exists...");
			}
			
			rs = metadata.getTables(null, null, "eventossl", null); 
			if(!rs.next())
			{
				System.out.println("#### Creating the table EVENTOSSL...");
				pstmt = con.prepareStatement(Tablas.getEventosSL());
				pstmt.executeUpdate();
				pstmt.close();
			} else {
				System.out.println("#### EVENTOSSL table already exists...");
			}
			
			rs = metadata.getTables(null, null, "enlacesbm", null); 
			if(!rs.next())
			{
				System.out.println("#### Creating the table ENLACESBM...");
				pstmt = con.prepareStatement(Tablas.getEnlacesBM());
				pstmt.executeUpdate();
				pstmt.close();
			} else {
				System.out.println("#### ENLACESBM table already exists...");
			}
			
			rs = metadata.getTables(null, null, "enlacessl", null); 
			if(!rs.next())
			{
				System.out.println("#### Creating the table ENLACESSL...");
				pstmt = con.prepareStatement(Tablas.getEnlacesSL());
				pstmt.executeUpdate();
				pstmt.close();
			} else {
				System.out.println("#### ENLACESSL table already exists...");
			}
			
			rs = metadata.getTables(null, null, "materialbm", null); 
			if(!rs.next())
			{
				System.out.println("#### Creating the table MATERIALBM...");
				pstmt = con.prepareStatement(Tablas.getMaterialBM());
				pstmt.executeUpdate();
				pstmt.close();
			} else {
				System.out.println("#### MATERIALBM table already exists...");
			}
			
			rs = metadata.getTables(null, null, "materialsl", null); 
			if(!rs.next())
			{
				System.out.println("#### Creating the table MATERIALSL...");
				pstmt = con.prepareStatement(Tablas.getMaterialSL());
				pstmt.executeUpdate();
				pstmt.close();
			} else {
				System.out.println("#### MATERIALSL table already exists...");
			}
			
			rs = metadata.getTables(null, null, "categoria", null); 
			if(!rs.next())
			{
				System.out.println("#### Creating the table CATEGORIA...");
				pstmt = con.prepareStatement(Tablas.getCategoria());
				pstmt.executeUpdate();
				pstmt.close();
			} else {
				System.out.println("#### CATEGORIA table already exists...");
			}
		} catch(SQLException ex) {
			ex.printStackTrace();
		}
	}
	
	public static void borrarTablas(Connection con) {
		PreparedStatement pstmt = null;
		String tabla[] = {"ENCUESTA", "IDEASL", "IDEABM", "CUESTIONARIOBM", "CUESTIONARIOSL", "EVENTOSBM", "EVENTOSSL", "ENLACESBM", "ENLACESSL", "MATERIALBM", "MATERIALSL", "CATEGORIA"};
		
		try {
			for (int i=0; i<tabla.length; i++) {
				System.out.println("#### Deleting the table " + tabla[i] + "...");
				pstmt = con.prepareStatement(Tablas.borrar(tabla[i]));
				pstmt.executeUpdate();
				pstmt.close();
			}
		} catch(SQLException ex) {
			ex.printStackTrace();
		}	
	}
	
	public static void borrarTabla(Connection con, String tabla) {
		PreparedStatement pstmt = null;
		
		try {
				System.out.println("#### Deleting the table " + tabla + "...");
				pstmt = con.prepareStatement(Tablas.borrar(tabla));
				pstmt.executeUpdate();
				pstmt.close();
			
		} catch(SQLException ex) {
			ex.printStackTrace();
		}	
	}
}
