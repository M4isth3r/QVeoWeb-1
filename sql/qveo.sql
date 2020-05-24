DROP DATABASE qveo;
CREATE DATABASE qveo;
USE qveo;

CREATE TABLE rol(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
NOMBRE VARCHAR(20)
);

CREATE TABLE pais(
ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
NOMBRE VARCHAR(50)
);

CREATE TABLE genero(
ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
NOMBRE VARCHAR(50)
);

CREATE TABLE usuario(
ID INT NOT NULL auto_increment PRIMARY KEY,
NOMBRE VARCHAR(50),
APELLIDOS VARCHAR(50),
EMAIL VARCHAR(50),
ID_ROL INT NOT NULL ,
FOTO VARCHAR(120),
FECHA_NACIMIENTO DATE,
SEXO VARCHAR(1),
PASSWORD VARCHAR(50),
ID_PAIS INT NOT NULL,
FECHA_ALTA DATE,
FOREIGN KEY (ID_ROL) REFERENCES rol(ID),
FOREIGN KEY (ID_PAIS) REFERENCES pais(ID)
);

CREATE TABLE serie(
ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
TITULO VARCHAR(100),
FECHA_INICIO DATE,
SINOPSIS TEXT(400),
POSTER VARCHAR(100),
TEMPORADAS INT,
CAPITULOS INT,
ID_PAIS INT NOT NULL,
FOREIGN KEY (ID_PAIS) REFERENCES pais(ID)
);

CREATE TABLE actor(
ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
NOMBRE VARCHAR(100),
SEXO VARCHAR(1),
FOTO VARCHAR(100),
ID_PAIS INT NOT NULL,
FOREIGN KEY (ID_PAIS) REFERENCES pais (ID)
);

CREATE TABLE director(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
NOMBRE VARCHAR(100),
FOTO VARCHAR(100)
);

CREATE TABLE plataforma(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
NOMBRE VARCHAR(50),
LOGO VARCHAR(100)
);

CREATE TABLE pelicula(
ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
TITULO VARCHAR(50),
DURACION TIME,
GUION VARCHAR(20),
POSTER VARCHAR(100),
SINOPSIS VARCHAR(400),
ANIO DATE,
ID_PAIS INT NOT NULL,
FOREIGN KEY (ID_PAIS) REFERENCES pais(ID)
);

CREATE TABLE usuario_plataforma(
ID_USUARIO INT NOT NULL,
ID_PLATAFORMA INT NOT NULL,
FOREIGN KEY (ID_USUARIO) REFERENCES usuario(ID),
FOREIGN KEY (ID_PLATAFORMA) REFERENCES plataforma(ID)
);

CREATE TABLE usuario_pelicula(
ID_USUARIO INT NOT NULL,
ID_PELICULA INT NOT NULL,
FOREIGN KEY (ID_USUARIO) REFERENCES usuario(ID),
FOREIGN KEY (ID_PELICULA) REFERENCES pelicula(ID)
);

CREATE TABLE usuario_serie(
ID_USUARIO INT NOT NULL,
ID_SERIE INT NOT NULL,
FOREIGN KEY (ID_USUARIO) REFERENCES usuario(ID),
FOREIGN KEY (ID_SERIE) REFERENCES serie(ID)
);

CREATE TABLE genero_pelicula(
ID_GENERO INT NOT NULL,
ID_PELICULA INT NOT NULL,
FOREIGN KEY (ID_GENERO) REFERENCES genero(ID),
FOREIGN KEY (ID_PELICULA) REFERENCES pelicula(ID)
);
CREATE TABLE genero_serie(
ID_GENERO INT NOT NULL,
ID_SERIE INT NOT NULL,
FOREIGN KEY (ID_GENERO) REFERENCES genero(ID),
FOREIGN KEY (ID_SERIE) REFERENCES serie(ID)
);

CREATE TABLE director_serie(
ID_SERIE INT NOT NULL,
ID_DIRECTOR INT NOT NULL,
FOREIGN KEY (ID_SERIE) REFERENCES serie (ID),
FOREIGN KEY (ID_DIRECTOR) REFERENCES director (ID)
);


CREATE TABLE pelicula_plataforma(
ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
CADUCA DATE,
ID_PELICULA INT NOT NULL,
ID_PLATAFORMA INT NOT NULL,
CADUCA DATE,
FOREIGN KEY (ID_PELICULA) REFERENCES pelicula(ID),
FOREIGN KEY (ID_PLATAFORMA) REFERENCES plataforma(ID)
);

CREATE TABLE serie_plataforma(
ID_SERIE INT NOT NULL,
ID_PLATAFORMA INT NOT NULL,
FOREIGN KEY (ID_SERIE) REFERENCES serie(ID),
FOREIGN KEY (ID_PLATAFORMA) REFERENCES plataforma(ID)
);

CREATE TABLE pelicula_director(
ID_PELICULA INT NOT NULL,
ID_DIRECTOR INT NOT NULL,
FOREIGN KEY (ID_PELICULA) REFERENCES pelicula(ID),
FOREIGN KEY (ID_DIRECTOR) REFERENCES director(ID)
);

CREATE TABLE actor_pelicula(
ID_ACTOR INT NOT NULL,
ID_PELICULA INT NOT NULL,
FOREIGN KEY (ID_ACTOR) REFERENCES actor(ID),
FOREIGN KEY (ID_PELICULA) REFERENCES pelicula(ID)
);

CREATE TABLE actor_serie(
ID_ACTOR INT NOT NULL,
ID_SERIE INT NOT NULL,
FOREIGN KEY (ID_ACTOR) REFERENCES actor(ID),
FOREIGN KEY (ID_SERIE) REFERENCES serie(ID)
);
