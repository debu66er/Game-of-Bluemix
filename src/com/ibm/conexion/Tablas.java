package com.ibm.conexion;

public class Tablas {
	
	private static String encuesta = "CREATE TABLE ENCUESTA (" +
			"INSTANTE TIMESTAMP NOT NULL," +
			"NOMBRE VARCHAR(60) NOT NULL," +
			"EMPRESA VARCHAR(60) NOT NULL," +
			"EMAIL VARCHAR(60) NOT NULL," +
			"TELEFONO VARCHAR(12) NOT NULL," +
			"EVENTO VARCHAR(60) NOT NULL," +
			"CIUDAD VARCHAR(20) NOT NULL," +
			"VEVENTO SMALLINT," +
			"VINSTRUCTOR SMALLINT," +
			"VORGANIZACION SMALLINT," +
			"VAGENDA SMALLINT," +
			"VPRESENTACIONES SMALLINT," +
			"VLABORATORIOS SMALLINT," +
			"MAS VARCHAR(500)," +
			"MENOS VARCHAR(500)," +
			"CANTES SMALLINT," +
			"CDESPUES SMALLINT," +
			"SUGERENCIAS VARCHAR(1000)," +
			"CONTACTO VARCHAR(3)," +
			"PRIMARY KEY (INSTANTE, EVENTO, NOMBRE)" +
		")";
	
	private static String ideaBM = "CREATE TABLE IDEABM (" +
			"INSTANTE TIMESTAMP NOT NULL," +
		 	"IDEA VARCHAR(1000) NOT NULL," +
		 	"EMPRESA VARCHAR(60)," +
		 	"PRIMARY KEY (INSTANTE)" +
		")";
	
	
	private static String cuestionarioBM = "CREATE TABLE CUESTIONARIOBM (" +  //no le ha gustado serial
			"ID SERIAL NOT NULL," + 
			"PREGUNTA VARCHAR(200) NOT NULL," +
			"RESP1 VARCHAR(200) NOT NULL," +
			"RESP2 VARCHAR(200) NOT NULL," +
			"RESP3 VARCHAR(200)," +
			"RESP4 VARCHAR(200)," +
			"CORRECTA SMALLINT NOT NULL," +
			"OCULTA VARCHAR(3) NOT NULL," +
			"PRIMARY KEY (ID)" +
		")";
	
	private static String eventosBM = "CREATE TABLE EVENTOSBM (" +
			"NOMBRE VARCHAR(60) NOT NULL," +
			"LUGAR VARCHAR(60) NOT NULL," +
			"FECHA DATE NOT NULL," +
			"RESPONSABLE VARCHAR (60) NOT NULL," +
			"CONTACTO VARCHAR(60) NOT NULL," +
			"OCULTO VARCHAR(3) NOT NULL," +
			"PRIMARY KEY (NOMBRE, LUGAR, FECHA)" +
		")";

	private static String enlacesBM = "CREATE TABLE ENLACESBM (" +
			"ALIAS VARCHAR(40) NOT NULL UNIQUE," +
			"CATEGORIA VARCHAR(40) NOT NULL," +
			"LINK VARCHAR(500) NOT NULL," +
			"OCULTO VARCHAR(3) NOT NULL," +
			"PRIMARY KEY (LINK)" +
		")";
	
	private static String materialBM = "CREATE TABLE MATERIALBM (" +
			"NOMBRE VARCHAR (40) NOT NULL UNIQUE," +
			"DESCRIPCION VARCHAR(200)," +
			"CATEGORIA VARCHAR (40)," +
			"LINK VARCHAR(500) NOT NULL," +
			"OCULTO VARCHAR(3) NOT NULL," +
			"PRIMARY KEY (LINK)" +
		")";

	private static String categoria = "CREATE TABLE CATEGORIA (" +
			"NOMBRE VARCHAR (40) NOT NULL," +
			"TIPO VARCHAR (20) NOT NULL,  " +
			"PRIMARY KEY (NOMBRE, TIPO)" +
		")";
	
	public static String getEncuesta() {
		return encuesta;
	}

	public static String getIdeaBM() {
		return ideaBM;
	}

	public static String getCuestionarioBM() {
		return cuestionarioBM;
	}

	public static String getEventosBM() {
		return eventosBM;
	}

	public static String getEnlacesBM() {
		return enlacesBM;
	}

	public static String getMaterialBM() {
		return materialBM;
	}

	public static String getCategoria() {
		return categoria;
	}
	
	public static String borrar(String tabla) {
		String query = "DROP TABLE " + tabla;
		return query;
	}
}