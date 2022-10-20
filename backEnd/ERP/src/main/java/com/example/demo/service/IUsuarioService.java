package com.example.demo.service;

import java.util.List;

import com.example.demo.dto.Tercero;

public interface IUsuarioService {
	
	public List<Tercero> listarUsuarios();
	
	public Tercero guardarUsuario(Tercero tercero);
	
	public Tercero usuarioPorID(Long id_registro);
	
	public Tercero actualizarUsuario(Tercero tercero);
	
	public void eliminarUsuario(Long id_registro);
}
