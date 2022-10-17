package com.example.demo.service;

import java.util.List;

import com.example.demo.dto.Tercero;

public interface ITerceroService {
	public List<Tercero> listarTercero();
	
	public Tercero guardarTercero(Tercero tercero);
	
	public Tercero terceroPorID(Long id_registro);
	
	public Tercero actualizarTercero(Tercero tercero);
	
	public void eliminarTercero(Long id_registro);
}
