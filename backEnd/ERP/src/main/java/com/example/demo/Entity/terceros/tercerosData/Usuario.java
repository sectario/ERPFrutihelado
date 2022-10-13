package com.example.demo.Entity.terceros.tercerosData;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;


@Entity
@Table(name = "usuarios")
public class Usuario {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id_registro_tercero;
	
	@NotEmpty(message="El campo documento no puede estar vacio")
	@Column(nullable = false, unique=true)
	private String usuarname;
	
	@NotEmpty(message="El campo tipo documento no puede estar vacio")
	@Column(nullable = false)
	private String password;
	
	@NotEmpty(message="El campo nombres no puede estar vacio")
	@Column(nullable = false)
	private String area;
	
	@NotEmpty(message="El campo apellidos no puede estar vacio")
	@Column(nullable = false)
	private String subarea;
	
	//@OneToOne(mappedBy="usuarios")
	//private Usuario usuario;
	
	//@OneToMany(mappedBy="contactos")
	//private Contacto contacto;
}
