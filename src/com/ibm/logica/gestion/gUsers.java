package com.ibm.logica.gestion;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.ibm.conexion.Conexion;
import com.ibm.logica.modelo.Categoria;

public class gUsers {
	private Connection con = null;
	private Statement st = null;
	private ResultSet rs = null;

	public boolean authenticate(String login, String password) {
		
		boolean auth = false;
		String pwd = null;


		
		try {
			con = Conexion.init();
			st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs = st.executeQuery("SELECT * FROM USERS WHERE LOGIN='"+login+"'");
			
			if (rs.next()) { //check if the rs is empty
				
				pwd = rs.getString("pass");
				

			}
			
			if (pwd!=null && pwd.equals(password)){
				
				auth=true;
			}
			
		    
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
		return auth;
	}

}
