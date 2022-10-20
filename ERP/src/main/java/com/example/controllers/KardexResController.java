package com.example.controllers;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.example.demo.Entity.kardex.Kardex;
import com.example.demo.services.InterfaceKardexService;

@RestController
@RequestMapping("/api")

public class KardexResController {
	
	@Autowired
	private InterfaceKardexService kardexService;
	
	@GetMapping ("/kardex")
	public List<Kardex> index(){
		
		return kardexService.FindAll();
	}

}
