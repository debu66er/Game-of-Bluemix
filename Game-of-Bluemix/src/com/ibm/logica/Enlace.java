package com.ibm.logica;

public class Enlace {
	
	public String alias, categoria, link;

	public Enlace (String alias, String categoria, String link) {
		this.alias = alias;
		this.categoria = categoria;
		this.link = link;
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
}
