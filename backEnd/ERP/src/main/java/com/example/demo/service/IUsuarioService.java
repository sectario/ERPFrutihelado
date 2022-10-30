package com.example.demo.service;

import java.util.List;
import com.example.demo.dto.Usuario;

public interface IUsuarioService {
	
	public List<Usuario> listarUsuarios();
	
	public Usuario guardarUsuario(Usuario usuario);
	
	public Usuario usuarioPorID(String username);
	
	public Usuario actualizarUsuario(Usuario usuario);
	
	public void eliminarUsuario(String username);
}
