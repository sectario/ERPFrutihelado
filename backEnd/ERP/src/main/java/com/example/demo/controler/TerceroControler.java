package com.example.demo.controler;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.dto.Tercero;
import com.example.demo.service.TerceroImpl.TerceroImpl;

@RestController
@RequestMapping("/api")
public class TerceroControler {

	@Autowired
	TerceroImpl terceroServiceImpl;
	
	@GetMapping("/tercero")
	public List<Tercero> listarTercero(){
		return terceroServiceImpl.listarTercero();
	}
	
}
