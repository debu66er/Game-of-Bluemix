package com.ibm.logica.modelo;

public class Encuesta {
	private String evento, ciudad, fecha, nombre, empresa, email, telefono, mejor, peor, sugerencias, contacto;
	private int vevento, vinstructor, vorganizacion, vagenda, vpresentaciones, vlaboratorios, cantes, cdespues;
	
	public Encuesta(String evento, String ciudad, String fecha, String nombre, String empresa, String email, String telefono,
			String mejor, String peor, String sugerencias, String contacto, int vevento, int vinstructor,
			int vorganizacion, int vagenda, int vpresentaciones, int vlaboratorios, int cantes, int cdespues) {
		this.evento = evento;
		this.ciudad = ciudad;
		this.fecha = fecha;
		this.nombre = nombre;
		this.empresa = empresa;
		this.email = email;
		this.telefono = telefono;
		this.mejor = mejor;
		this.peor = peor;
		this.sugerencias = sugerencias;
		this.contacto = contacto;
		this.vevento = vevento;
		this.vinstructor = vinstructor;
		this.vorganizacion = vorganizacion;
		this.vagenda = vagenda;
		this.vpresentaciones = vpresentaciones;
		this.vlaboratorios = vlaboratorios;
		this.cantes = cantes;
		this.cdespues = cdespues;
	}

	public String getEvento() {
		return evento;
	}

	public void setEvento(String evento) {
		this.evento = evento;
	}

	public String getFecha() {
		return fecha;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getEmpresa() {
		return empresa;
	}

	public void setEmpresa(String empresa) {
		this.empresa = empresa;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getMejor() {
		return mejor;
	}

	public void setMejor(String mejor) {
		this.mejor = mejor;
	}

	public String getPeor() {
		return peor;
	}

	public void setPeor(String peor) {
		this.peor = peor;
	}

	public String getSugerencias() {
		return sugerencias;
	}

	public void setSugerencias(String sugerencias) {
		this.sugerencias = sugerencias;
	}

	public String getContacto() {
		return contacto;
	}

	public void setContacto(String contacto) {
		this.contacto = contacto;
	}

	public int getVevento() {
		return vevento;
	}

	public void setVevento(int vevento) {
		this.vevento = vevento;
	}

	public int getVinstructor() {
		return vinstructor;
	}

	public void setVinstructor(int vinstructor) {
		this.vinstructor = vinstructor;
	}

	public int getVorganizacion() {
		return vorganizacion;
	}

	public void setVorganizacion(int vorganizacion) {
		this.vorganizacion = vorganizacion;
	}

	public int getVagenda() {
		return vagenda;
	}

	public void setVagenda(int vagenda) {
		this.vagenda = vagenda;
	}

	public int getVpresentaciones() {
		return vpresentaciones;
	}

	public void setVpresentaciones(int vpresentaciones) {
		this.vpresentaciones = vpresentaciones;
	}
	
	public int getVlaboratorios() {
		return vlaboratorios;
	}

	public void setVlaboratorios(int vlaboratorios) {
		this.vlaboratorios = vlaboratorios;
	}

	public int getCantes() {
		return cantes;
	}

	public void setCantes(int cantes) {
		this.cantes = cantes;
	}

	public int getCdespues() {
		return cdespues;
	}

	public void setCdespues(int cdespues) {
		this.cdespues = cdespues;
	}

	public String getCiudad() {
		return ciudad;
	}

	public void setCiudad(String ciudad) {
		this.ciudad = ciudad;
	}	
}
