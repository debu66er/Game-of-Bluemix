package com.ibm.logica.modelo;

public class Badge {
	private String email;
	private String evento;
	private String assertion;
	
	public Badge(String email, String evento, String assertion) {
		super();
		this.email = email;
		this.evento = evento;
		this.assertion = assertion;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEvento() {
		return evento;
	}
	public void setEvento(String evento) {
		this.evento = evento;
	}
	public String getAssertion() {
		return assertion;
	}
	public void setAssertion(String assertion) {
		this.assertion = assertion;
	}

}
