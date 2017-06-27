package com.ibm.logica;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class Reto {

	public void corregir (HttpServletRequest request) {
		
		HttpSession sesion=request.getSession();
		@SuppressWarnings("unchecked")
		List<Pregunta> preguntas = (List<Pregunta>) sesion.getAttribute("listaPreg");
		Iterator<Pregunta> iter = preguntas.iterator();
		Pregunta pregunta;
		
		String parametro, pImagen, pCheck;
		String mensaje = "";
		int i = 1, valor, nCorrectas = 0, maxResp = 4;
		boolean correcto;
		boolean badge = false;
		
		String imagen[][] = new String[preguntas.size()][maxResp];
		String checked[][] = new String[preguntas.size()][maxResp];
		
		while (iter.hasNext()) {
			pregunta = iter.next();
			correcto = false;
			parametro = "respuesta" + i;
			pImagen = "imagen" + i;
			pCheck = "check" + i;
			
			if (request.getParameter(parametro) == null) {
				valor = 0;
			} else {
				valor = Integer.parseInt(request.getParameter(parametro));
			}
			
			for (int j = 0; j < maxResp; j++) {
				imagen[i-1][j] = "";
				checked[i-1][j] = "";
			}
			
			imagen[i-1][pregunta.getCorrecta() - 1] = "&nbsp;&nbsp;&nbsp;&nbsp;<img src=\"images/correcto.png\" alt=\"Correcta\">";
			
			if (valor == pregunta.getCorrecta()) {
				correcto = true;
				nCorrectas++;
			} 
			
			if (valor == 1) {
				checked[i-1][0] = "checked=\"checked\"";
				if (!correcto) imagen[i-1][0] = "&nbsp;&nbsp;&nbsp;&nbsp;<img src=\"images/incorrecto.png\" alt=\"Incorrecta\">";
			} else if (valor == 2) {
				checked[i-1][1] = "checked=\"checked\"";
				if (!correcto) imagen[i-1][1] = "&nbsp;&nbsp;&nbsp;&nbsp;<img src=\"images/incorrecto.png\" alt=\"Incorrecta\">";
			} else if (valor == 3) {
				checked[i-1][2] = "checked=\"checked\"";
				if (!correcto) imagen[i-1][2] = "&nbsp;&nbsp;&nbsp;&nbsp;<img src=\"images/incorrecto.png\" alt=\"Incorrecta\">";
			} else if (valor == 4) {
				checked[i-1][3] = "checked=\"checked\"";
				if (!correcto) imagen[i-1][3] = "&nbsp;&nbsp;&nbsp;&nbsp;<img src=\"images/incorrecto.png\" alt=\"Incorrecta\">";
			}
			
			request.setAttribute(pImagen, imagen[i-1]);
			request.setAttribute(pCheck, checked[i-1]);
			
			i++;
		}

		if (nCorrectas >= Math.ceil((double)(i-1)*0.6)) {
			mensaje = "\u00a1Enhorabuena! Has acertado " + nCorrectas + " preguntas.";
			badge=true;
		}
		else mensaje = "\u00a1Lo siento! Has acertado " + nCorrectas + " preguntas.";
		
		request.setAttribute("titulo", mensaje);
		request.setAttribute("badge", badge);
	}
}
