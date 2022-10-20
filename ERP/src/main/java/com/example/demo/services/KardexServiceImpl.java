package com.example.demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.Entity.kardex.Kardex;
import com.example.demo.Entity.kardexes.kardexesDao.InterfaceKardexDao;

@Service
public class KardexServiceImpl implements InterfaceKardexService  {

	@Autowired
	private InterfaceKardexDao kardexDao;
	
	@Override
	public List<Kardex> FindAll() {
		
		return (List<Kardex>) kardexDao.findAll();
	}

	@Override
	public Kardex FinById(Long id) {
		
		return kardexDao.findById(id).orElse(null);
	}

	@Override
	public Kardex save(Kardex kardex) {
		
		return kardexDao.save(kardex);
	}

	@Override
	public void Delete(Kardex kardex) {
		kardexDao.delete(kardex);
		
	}

}
