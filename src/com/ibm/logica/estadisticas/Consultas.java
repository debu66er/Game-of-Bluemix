package com.ibm.logica.estadisticas;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletOutputStream;

import com.csvreader.CsvWriter;
import com.ibm.conexion.Conexion;
import com.ibm.logica.modelo.Encuesta;

public class Consultas {
	
	private Connection con = null;
	private Statement st = null;
	private ResultSet rs = null;

	public List<Encuesta> getDatos() {
		
		List<Encuesta> usuarios = new ArrayList<Encuesta>();
		
		try {
			con = Conexion.init();
			st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			st.executeUpdate("DELETE FROM ENCUESTA WHERE NOMBRE='Prueba'");
			
			rs = st.executeQuery("SELECT * FROM ENCUESTA");
			
			String evento, ciudad, fecha, nombre, empresa, email, telefono, mejor, peor, sugerencias, contacto;
			int vevento, vinstructor, vorganizacion, vagenda, vpresentaciones, vlaboratorios, cantes, cdespues;
			
			DateFormat form = new SimpleDateFormat("dd.MM.yyyy");
					
			while (rs.next()) {
				evento = rs.getString("evento");
				ciudad = rs.getString("ciudad");
				fecha = form.format(rs.getDate("instante"));
				nombre = rs.getString("nombre");
				empresa = rs.getString("empresa");
				email = rs.getString("email");
				telefono = rs.getString("telefono");
				vevento = rs.getInt("vevento");
				vinstructor = rs.getInt("vinstructor");
				vorganizacion = rs.getInt("vorganizacion");
				vagenda = rs.getInt("vagenda");
				vpresentaciones = rs.getInt("vpresentaciones");
				vlaboratorios = rs.getInt("vlaboratorios");
				mejor = rs.getString("mas");
				peor = rs.getString("menos");
				cantes = rs.getInt("cantes");
				cdespues = rs.getInt("cdespues");
				sugerencias = rs.getString("sugerencias");
				contacto = rs.getString("contacto");
				
				Encuesta usuario = new Encuesta(evento, ciudad, fecha, nombre, empresa, email, telefono, mejor, peor, sugerencias, contacto, vevento, vinstructor, vorganizacion, vagenda, vpresentaciones, vlaboratorios, cantes, cdespues);
				System.out.println(evento);
				System.out.println(ciudad);			
				usuarios.add(usuario);
			}
			
			con.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return usuarios;
	}
	
	public void generarArchivo(List<Encuesta> usuarios, File archivo) {
		Iterator<Encuesta> iter = usuarios.iterator();
		Encuesta usr;

		try {
            CsvWriter csv = new CsvWriter(archivo.getPath(), ';', StandardCharsets.ISO_8859_1);
            
            csv.write("Evento");
            csv.write("Ciudad");
            csv.write("Fecha");
            csv.write("Nombre y apellidos");
            csv.write("Empresa");
            csv.write("E-mail");
            csv.write("Telefono");
            csv.write("ValoraciÃ³n del evento");
            csv.write("ValoracÃ³�n del instructor");
            csv.write("ValoraÃ³i�n de la organizÃ³ci�n");
            csv.write("ValorÃ³ci�n de la agenda");
            csv.write("ValoÃ³aci�n de las presentaciones");
            csv.write("ValÃ³raci�n de los laboratorios");
            csv.write("Mejor presÃ³ntaci�n o laboratorio");
            csv.write("Peor preÃ³entaci�n o laboratorio");
            csv.write("Conocimientos previos");
            csv.write("ConocimientÃ©±s despu�s");
            csv.write("Sugerencias");
            csv.write("Contacto");
            csv.endRecord();
             
            while (iter.hasNext()) {
                usr = iter.next();
                
                csv.write(usr.getEvento());
                csv.write(usr.getCiudad());
                csv.write(usr.getFecha());
                csv.write(usr.getNombre());
                csv.write(usr.getEmpresa());
                csv.write(usr.getEmail());
                csv.write(usr.getTelefono());
                csv.write(Integer.toString(usr.getVevento()));
                csv.write(Integer.toString(usr.getVinstructor()));
                csv.write(Integer.toString(usr.getVorganizacion()));
                csv.write(Integer.toString(usr.getVagenda()));
                csv.write(Integer.toString(usr.getVpresentaciones()));
                csv.write(Integer.toString(usr.getVlaboratorios()));
                csv.write(usr.getMejor());
                csv.write(usr.getPeor());
                csv.write(Integer.toString(usr.getCantes()));
                csv.write(Integer.toString(usr.getCdespues()));
                csv.write(usr.getSugerencias());
                csv.write(usr.getContacto());
                csv.endRecord();                   
            }
             
            csv.close();
         
        } catch (IOException e) {
            e.printStackTrace();
        }
	}
	
	public void descargar (File archivo, ServletOutputStream out) {
		try {
			FileInputStream in = new FileInputStream(archivo);
		
	        byte[] buf = new byte[1024];
	        int len;
	         
	        while ((len = in.read(buf)) > 0) {
	        	out.write(buf, 0, len);
	        }
	        
	        out.close();
	        in.close();
	     
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
