package com.example.demo.services;

import java.util.List;

import com.example.demo.Entity.terceros.Tercero;

public interface InterfaceTerceroService {

		public List<Tercero> FindAll();
		
		public Tercero FinById(Long id);
		
		public Tercero save(Tercero tercero);
		
		public void Delete(Tercero tercero);
}
