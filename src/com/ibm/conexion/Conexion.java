package com.ibm.conexion;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class Conexion {
	public static Connection init() {
		DataSource datasource = null;
		Connection con = null;

		try {
			Context initialContext = new InitialContext();
			datasource = (DataSource)initialContext.lookup("jdbc/Compose for PostgreSQL");  //en prod
			//datasource = (DataSource)initialContext.lookup("jdbc/Compose for PostgreSQL-u2");  //pruebas de compose psql en local
			//datasource = (DataSource)initialContext.lookup("jdbc/Compose for MySQL");  //pruebas en local
			con = datasource.getConnection();
		}
		catch (NamingException e) {
			e.printStackTrace();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
}