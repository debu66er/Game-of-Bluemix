package com.ibm.logica.modelo;

public class Material {
	
	private String nombre, descripcion, categoria, link, oculto;

	public Material(String nombre, String descripcion, String categoria, String link, String oculto) {
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.categoria = categoria;
		this.link = link;
		this.oculto = oculto;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	public String getCategoria() {
		return categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}
	
	public String getOculto() {
		return oculto;
	}
	
	public void setOculto(String oculto) {
		this.oculto = oculto;
	}
}
