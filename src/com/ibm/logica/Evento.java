package com.ibm.logica;

public class Evento {

	private String nombre, lugar, fecha, responsable, contacto;

	public Evento(String nombre, String lugar, String fecha, String responsable, String contacto) {
		this.nombre = nombre;
		this.lugar = lugar;
		this.fecha = fecha;
		this.responsable = responsable;
		this.contacto = contacto;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getLugar() {
		return lugar;
	}

	public void setLugar(String lugar) {
		this.lugar = lugar;
	}

	public String getFecha() {
		return fecha;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

	public String getResponsable() {
		return responsable;
	}

	public void setResponsable(String responsable) {
		this.responsable = responsable;
	}

	public String getContacto() {
		return contacto;
	}

	public void setContacto(String contacto) {
		this.contacto = contacto;
	}
}
