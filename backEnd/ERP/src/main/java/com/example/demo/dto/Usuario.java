package com.example.demo.dto;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name="usuarios")
public class Usuario {
	
	@Id
	@Column(unique = true)
	private String username;
	private String password;
	private String area;
	private String subarea;
	


}


