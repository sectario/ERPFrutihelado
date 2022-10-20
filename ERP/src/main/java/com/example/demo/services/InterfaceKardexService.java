package com.example.demo.services;

import java.util.List;

import com.example.demo.Entity.kardex.Kardex;

public interface InterfaceKardexService {

		public List<Kardex> FindAll();
		
		public Kardex FinById(Long id);
		
		public Kardex save(Kardex kardex);
		
		public void Delete(Kardex kardex);
}