package com.example.demo.dto;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="terceros")
public class Tercero {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id_registro;
	private String nombre;
	private String direccion;
	private String pasword;
	private String telefono;
	private String email;
	
	public Tercero() {
	}
	
	public Tercero(Long id_registro, String nombre, String direccion, String pasword, String telefono,
			String email) {
		this.id_registro = id_registro;
		this.nombre = nombre;

		this.direccion = direccion;
		this.pasword = pasword;
		this.telefono = telefono;
		this.email = email;
	}
	public Long getId_registro() {
		return id_registro;
	}
	public void setId_registro(Long id_registro) {
		this.id_registro = id_registro;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	public String getPasword() {
		return pasword;
	}
	public void setPasword(String pasword) {
		this.pasword = pasword;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "Tercero [id_registro=" + id_registro + ", nombre=" + nombre + ", direccion="
				+ direccion + ", pasword=" + pasword + ", telefono=" + telefono + ", email=" + email + "]";
	}	
}
