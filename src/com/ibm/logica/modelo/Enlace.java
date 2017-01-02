package com.ibm.logica.modelo;

public class Enlace {
	private String alias, categoria, link, oculto;

	public Enlace (String alias, String categoria, String link, String oculto) {
		this.alias = alias;
		this.categoria = categoria;
		this.link = link;
		this.oculto = oculto;
	}

	public String getAlias() {
		return this.alias;
	}

	public void setAlias(String alias) {
		this.alias = alias;
	}

	public String getCategoria() {
		return this.categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

	public String getLink() {
		return this.link;
	}

	public void setLink(String link) {
		this.link = link;
	}
	
	public String getOculto() {
		return this.oculto;
	}
	
	public void setOculto(String oculto) {
		this.oculto = oculto;
	}
}
