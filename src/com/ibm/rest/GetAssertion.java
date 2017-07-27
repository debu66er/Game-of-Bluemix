package com.ibm.rest;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.ws.rs.ApplicationPath;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Application;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import com.ibm.conexion.Conexion;



@ApplicationPath("/rest")
@Path("/getAssertion")

public class GetAssertion extends Application{
	
	@GET
    @Produces(MediaType.APPLICATION_JSON)
	public Response postService(@QueryParam("email") String email, @QueryParam("evento") String evento) 
	{
		String assertion = null;
		try {
			Connection con = Conexion.init();
			Statement st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			ResultSet rs = st.executeQuery("SELECT ASSERTION FROM BADGES WHERE EMAIL = '"+email+"' AND EVENTO = '"+evento+"'");
			
			
			
			while (rs.next()) {
				assertion = rs.getString("assertion");
			}
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}



	return Response.status(200).type(MediaType.APPLICATION_JSON).entity(assertion).build();
	}

}
