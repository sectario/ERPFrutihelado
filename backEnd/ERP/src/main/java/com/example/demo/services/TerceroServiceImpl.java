package com.example.demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.Entity.terceros.Tercero;
import com.example.demo.Entity.terceros.tercerosDao.InterfaceTerceroDao;

@Service
public class TerceroServiceImpl implements InterfaceTerceroService {

	@Autowired
	private InterfaceTerceroDao terceroDao;
	
	@Override
	public List<Tercero> FindAll() {
		
		return (List<Tercero>) terceroDao.findAll();
	}

	@Override
	public Tercero FinById(Long id) {
		
		return terceroDao.findById(id).orElse(null);
	}

	@Override
	public Tercero save(Tercero tercero) {
		
		return terceroDao.save(tercero);
	}

	@Override
	public void Delete(Tercero tercero) {
		terceroDao.delete(tercero);
		
	}

}
