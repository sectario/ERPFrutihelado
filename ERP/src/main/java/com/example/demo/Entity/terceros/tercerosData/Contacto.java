package com.example.demo.Entity.terceros.tercerosData;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;


@Entity
@Table(name = "contactos")
public class Contacto {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id_registro_tercero;
	
	@NotEmpty(message="El campo documento no puede estar vacio")
	@Column(nullable = false)
	private String contacto;
	
	@NotEmpty(message="El campo tipo documento no puede estar vacio")
	@Column(nullable = false)
	private String email;
	
	@NotEmpty(message="El campo nombres no puede estar vacio")
	@Column(nullable = false)
	private String telefono;
}
