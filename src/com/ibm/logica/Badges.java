package com.ibm.logica;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.ibm.conexion.Conexion;

public class Badges {
	
	public void guardarBadge(HttpServletRequest request){
		
		HttpSession sesion=request.getSession();
		String workshop = (String) sesion.getAttribute("workshop");
		
		//Formatear el nombre del workshop para crear los JSON 
		String evento = workshop.toLowerCase(); //minusculas
		evento = evento.replace(" ", "");  //sin espacios
		if (evento.contains("&")){
			evento = evento.replace("&", "and"); //sustituir & por and
		}
		
		
		String email=request.getParameter("email");
		String user = email.substring(0, email.indexOf("@"));
		System.out.println(user);
		TimeZone tz = TimeZone.getTimeZone("UTC");
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm'Z'"); // Quoted "Z" to indicate UTC, no timezone offset
		df.setTimeZone(tz);
		String nowAsISO = df.format(new Date());

		
		String dir = "http://backpack.openbadges.org/baker?assertion=http://gameofbluemix.mybluemix.net/rest/getAssertion?email="+email+"&evento="+evento;
		sesion.setAttribute("dir", dir);
		
		JSONObject json = new JSONObject();
		JSONObject recjson = new JSONObject();
		JSONObject verjson = new JSONObject();

		json.put("uid", UUID.randomUUID().toString());
		
		
		//recipient
		recjson.put("type","email");
		recjson.put("identity",email);
		recjson.put("hashed", false);
		json.put("recipient", recjson);
		
		json.put("issuedOn", nowAsISO);
		json.put("badge", "http://gameofbluemix.mybluemix.net/badges/"+evento+"-badge-class.json");
		   
		verjson.put("type","hosted");
		verjson.put("url","http://gameofbluemix.mybluemix.net/rest/getAssertion?email="+email+"&evento="+evento);
		json.put("verify", verjson);
		

		try {
			Connection con = Conexion.init();
			Statement st = con.createStatement();
			String qInsert = "INSERT INTO BADGES VALUES('"+email+"','"+evento+"','"+json.toString()+"')";			
			System.out.println(qInsert);
			st.executeUpdate(qInsert);
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} 
		



		
	}

}