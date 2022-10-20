package com.example.demo.dao;

import org.springframework.data.jpa.repository.support.JpaRepositoryImplementation;

import com.example.demo.dto.Tercero;
import com.example.demo.dto.Usuario;

public interface IUsuarioDao extends JpaRepositoryImplementation<Usuario, Long>{

}
