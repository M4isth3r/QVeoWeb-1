package com.qveo.qveoweb.service;

import java.io.IOException;
import java.util.List;

import com.qveo.qveoweb.dto.ContrasenaDto;
import com.qveo.qveoweb.dto.PersonalInfoDto;
import com.qveo.qveoweb.dto.PlataformaDto;
import org.springframework.web.multipart.MultipartFile;

import com.qveo.qveoweb.model.Usuario;

public interface UsuarioService {

	List<Usuario> findAllUsuarios();
    public Usuario saveUser(Usuario usuario, MultipartFile foto) throws IOException;
    public Usuario getUsuario(Integer id);
    public void deleteUser(Integer id);
    public List<Usuario> findUsuarioPorNombre(String nombre);
    public boolean usuarioExiste(Integer id);
    public boolean validarContrasena(ContrasenaDto contrasenaDto);
    public ContrasenaDto saveContrasena(ContrasenaDto contrasenaDto);
    PersonalInfoDto savePersonalInfo(PersonalInfoDto personalInfoDto, MultipartFile file);
    PlataformaDto savePlataformas(PlataformaDto plataformaDto);
}