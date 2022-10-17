package com.example.demo.dto;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="terceros")
public class Tercero {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id_registro;
	private Long id_tercero;
	private String tipo_documento;
	private String numero;
	private String nombre;
	private String apellido;
	
	
public Tercero() {
		
	}
	
	public Tercero(Long id_registro, Long id_tercero, String tipo_documento, String numero, String nombre,
			String apellido) {
		this.id_registro = id_registro;
		this.id_tercero = id_tercero;
		this.tipo_documento = tipo_documento;
		this.numero = numero;
		this.nombre = nombre;
		this.apellido = apellido;
	}

	public Long getId_registro() {
		return id_registro;
	}


	public void setId_registro(Long id_registro) {
		this.id_registro = id_registro;
	}


	public Long getId_tercero() {
		return id_tercero;
	}


	public void setId_tercero(Long id_tercero) {
		this.id_tercero = id_tercero;
	}


	public String getTipo_documento() {
		return tipo_documento;
	}


	public void setTipo_documento(String tipo_documento) {
		this.tipo_documento = tipo_documento;
	}


	public String getNumero() {
		return numero;
	}


	public void setNumero(String numero) {
		this.numero = numero;
	}


	public String getNombre() {
		return nombre;
	}


	public void setNombre(String nombre) {
		this.nombre = nombre;
	}


	public String getApellido() {
		return apellido;
	}


	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	
	@Override
	public String toString() {
		return "Tercero [id_registro=" + id_registro + ", id_tercero=" + id_tercero + ", tipo_documento="
				+ tipo_documento + ", numero=" + numero + ", nombre=" + nombre + ", apellido=" + apellido + "]";
	}
	
	
	
}
