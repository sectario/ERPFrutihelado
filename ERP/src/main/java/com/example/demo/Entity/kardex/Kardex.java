package com.example.demo.Entity.kardex;

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
@Table(name = "kardex")

public class Kardex {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id_kardex;
	
	@NotEmpty(message="El campo producto no puede estar vacio")
	@Column(nullable = false)
	private String producto_id_producto;
	
	@NotEmpty(message="El campo factura no puede estar vacio")
	@Column(nullable = false)
	private String factura_id_factura;
	
	@NotEmpty(message="El campo unidades no puede estar vacio")
	@Column(nullable = false)
	private String unidades;
	
	@NotEmpty(message="El campo valor unidad no puede estar vacio")
	@Column(nullable = false)
	private String valor_unidad;
	

}