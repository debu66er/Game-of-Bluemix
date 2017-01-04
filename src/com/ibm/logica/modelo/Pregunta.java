package com.ibm.logica.modelo;

public class Pregunta {
	
	private String pregunta, resp1, resp2, resp3, resp4, oculta, workshop;
	private int id, correcta;
	
	public Pregunta(int id, String pregunta, String resp1, String resp2, String resp3, String resp4, int correcta, String oculta, String workshop) {
		this.id = id;
		this.pregunta = pregunta;
		this.resp1 = resp1;
		this.resp2 = resp2;
		this.resp3 = resp3;
		this.resp4 = resp4;
		this.correcta = correcta;
		this.oculta = oculta;
		this.workshop = workshop;
	}

	public String getPregunta() {
		return pregunta;
	}
	
	public void setPregunta(String pregunta) {
		this.pregunta = pregunta;
	}
	public String getResp1() {
		return resp1;
	}
	
	public void setResp1(String resp1) {
		this.resp1 = resp1;
	}
	
	public String getResp2() {
		return resp2;
	}
	
	public void setResp2(String resp2) {
		this.resp2 = resp2;
	}
	
	public String getResp3() {
		return resp3;
	}
	
	public void setResp3(String resp3) {
		this.resp3 = resp3;
	}
	
	public String getResp4() {
		return resp4;
	}
	
	public void setResp4(String resp4) {
		this.resp4 = resp4;
	}
	
	public int getCorrecta() {
		return correcta;
	}
	
	public void setCorrecta(int correcta) {
		this.correcta = correcta;
	}
	
	public String getOculta() {
		return oculta;
	}
	
	public void setOculta(String oculta) {
		this.oculta = oculta;
	}
	
	public int getId() {
		return id;
	}

	public String getWorkshop() {
		return workshop;
	}

	public void setWorkshop(String workshop) {
		this.workshop = workshop;
	}
}
