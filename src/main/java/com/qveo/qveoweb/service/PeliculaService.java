package com.qveo.qveoweb.service;

import java.util.Optional;

import com.qveo.qveoweb.model.Pelicula;

public interface PeliculaService {

	Optional<Pelicula> getPelicula(Integer id);
}