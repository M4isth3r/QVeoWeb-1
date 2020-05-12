package com.qveo.qveoweb.service.Imp;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.qveo.qveoweb.model.Pelicula;
import com.qveo.qveoweb.service.IUploadFileService;
import com.qveo.qveoweb.service.PeliculaService;

@Service
public class UploadFileServiceImpl implements IUploadFileService {
	

	private final Logger log = LoggerFactory.getLogger(getClass());

	private final static String UPLOADS_FOLDER = "src/main/webapp/resources/img";

	@Autowired
	PeliculaService peliculaService;

	@Override
	public String copy(MultipartFile file, Integer accion, Integer id) throws IOException {
		
			String nombre = String.valueOf(id);

			String uniqueFilename = null;

			uniqueFilename = file.getOriginalFilename();

			String extension = uniqueFilename.substring(uniqueFilename.lastIndexOf(".") + 1);

			String nombreFinal = nombre + "." + extension;

			Path rootPath = getPath(nombreFinal, accion);

			log.info("rootPath: " + rootPath);

			Files.deleteIfExists(rootPath);

			Files.copy(file.getInputStream(), rootPath);

			return nombreFinal;
		
	}
	
	@Override
	public String defaultFoto(Integer accion, Integer id) throws IOException {
		
		String nombreFinal = null;
		
		switch (accion) {
		case 1:
			
			break;

		case 2:
			if(peliculaService.getPelicula(id).getPoster() != null) {
				String nombre = peliculaService.getPelicula(id).getPoster();
				 nombreFinal = nombre.substring(nombre.lastIndexOf('/') + 1);
			} else if(peliculaService.getPelicula(id).getPoster() == null && peliculaService.getPelicula(id).getPoster() != "/resources/img/peliculas/defaultFoto.png") {
				nombreFinal = "defaultFoto.png";
				System.out.println(nombreFinal);
				System.out.println("Hola");
			}
			
			break;
		case 3:
			
			break;
		case 4:
			
			break;
		case 5:
			
			break;
		case 6:
			
			break;
		}
		
		return nombreFinal;
	}

	@Override
	public boolean delete(String filename, Integer accion) {

		Path rootPath = getPath(filename, accion);
		log.info("pathBorrar1: " + rootPath);

		File archivo = rootPath.toFile();

		log.info("pathBorrar2: " + rootPath);

		if (archivo.exists() && archivo.canRead()) {
			if (archivo.delete()) {
				return true;
			}
		}
		return false;
	}

	public Path getPath(String filename, Integer accion) {
		String ruta = "";

		switch (accion) {
		case 1:
			ruta = UPLOADS_FOLDER + "/serie";
			break;

		case 2:
			ruta = UPLOADS_FOLDER + "/peliculas";
			break;
		case 3:
			ruta = UPLOADS_FOLDER + "/actores";
			break;
		case 4:
			ruta = UPLOADS_FOLDER + "/directores";
			break;
		case 5:
			ruta = UPLOADS_FOLDER + "/plataforma";
			break;
		case 6:
			ruta = UPLOADS_FOLDER + "/usuarios";
			break;
		}
		return Paths.get(ruta).resolve(filename).toAbsolutePath();
	}


}