package com.example.demo.service.TerceroImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.ITerceroDao;
import com.example.demo.dto.Tercero;
import com.example.demo.service.ITerceroService;


@Service
public class TerceroImpl implements ITerceroService{

	@Autowired
	ITerceroDao iTerceroDao;
	
	@Override
	public List<Tercero> listarTercero() {
		
		return iTerceroDao.findAll();
	}

	@Override
	public Tercero guardarTercero(Tercero tercero) {
		
		return iTerceroDao.save(tercero);
	}

	@Override
	public Tercero terceroPorID(Long id_registro) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Tercero actualizarTercero(Tercero tercero) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void eliminarTercero(Long id_registro) {
		// TODO Auto-generated method stub
		
	}

}
