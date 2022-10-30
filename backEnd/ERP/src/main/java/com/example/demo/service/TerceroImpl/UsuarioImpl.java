package com.example.demo.service.TerceroImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.example.demo.dao.IUsuarioDao;
import com.example.demo.dto.Usuario;
import com.example.demo.service.IUsuarioService;

public class UsuarioImpl implements IUsuarioService{

	@Autowired
	IUsuarioDao iUsuarioDao;
	
	@Override
	public List<Usuario> listarUsuarios() {
		return iUsuarioDao.findAll();
	}

	@Override
	public Usuario guardarUsuario(Usuario usuario) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Usuario usuarioPorID(String username) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Usuario actualizarUsuario(Usuario usuario) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void eliminarUsuario(String username) {
		// TODO Auto-generated method stub
		
	}

	
	
}
