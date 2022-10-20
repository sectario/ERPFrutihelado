package com.example.demo.Entity.terceros;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;


@Entity
@Table(name = "terceros")
public class Tercero {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id_registro_tercero;
	
	@NotEmpty(message="El campo documento no puede estar vacio")
	@Column(nullable = false, unique=true)
	private String id_tercero;
	
	@NotEmpty(message="El campo tipo documento no puede estar vacio")
	@Column(nullable = false)
	private String tipo_documento;
	
	@NotEmpty(message="El campo nombres no puede estar vacio")
	@Column(nullable = false)
	private String nombres;
	
	@NotEmpty(message="El campo apellidos no puede estar vacio")
	@Column(nullable = false)
	private String apellidos;
	
	//@OneToOne(mappedBy="usuarios")
	//private Usuario usuario;
	
	//@OneToMany(mappedBy="contactos")
	//private Contacto contacto;
}