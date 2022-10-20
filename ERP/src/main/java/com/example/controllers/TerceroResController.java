package com.example.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.Entity.terceros.Tercero;
import com.example.demo.services.InterfaceTerceroService;

@RestController
@RequestMapping("/api")
public class TerceroResController {

	@Autowired
	private InterfaceTerceroService terceroService;
	
	@GetMapping("/terceros")
	public List<Tercero> index(){
		
		return terceroService.FindAll();
	}
	
}
