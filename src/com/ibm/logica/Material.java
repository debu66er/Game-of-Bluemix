package com.ibm.logica;

public class Material {
	private String nombre, descripcion, categoria, link;

	public Material(String nombre, String descripcion, String categoria, String link) {
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.categoria = categoria;
		this.link = link;
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
}
