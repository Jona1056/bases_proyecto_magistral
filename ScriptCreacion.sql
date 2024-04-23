CREATE DATABASE proyecto_final_bases_magistral;
USE proyecto_final_bases_magistral;
CREATE TABLE  año_eleccion (
    id_eleccion INT AUTO_INCREMENT PRIMARY KEY,
    año         INT NOT NULL
);



CREATE TABLE departamento (
    id_departamento INT AUTO_INCREMENT PRIMARY KEY,
    nombre          VARCHAR(100) NOT NULL
);

CREATE TABLE eleccion (
    id_eleccion INT AUTO_INCREMENT PRIMARY KEY,
    nombre      VARCHAR(100) NOT NULL
);

CREATE TABLE municipio (
    id_municipio INT AUTO_INCREMENT PRIMARY KEY,
    nombre       VARCHAR(100) NOT NULL
);

CREATE TABLE pais (
    id_pais INT AUTO_INCREMENT PRIMARY KEY,
    nombre  VARCHAR(100) NOT NULL
);

CREATE TABLE partido (
    id_partido      INT AUTO_INCREMENT PRIMARY KEY,
    siglas_partidos VARCHAR(100) NOT NULL,
    nombre          VARCHAR(100) NOT NULL
);

CREATE TABLE raza (
    id_raza INT AUTO_INCREMENT PRIMARY KEY,
    nombre  VARCHAR(100) NOT NULL
);

CREATE TABLE region (
    id_region INT AUTO_INCREMENT PRIMARY KEY,
    nombre    VARCHAR(100) NOT NULL
);



CREATE TABLE sexo (
    id_genero INT AUTO_INCREMENT PRIMARY KEY,
    genero    VARCHAR(100) NOT NULL
);
CREATE TABLE caracteristicas (
    id_caracteristicas INT AUTO_INCREMENT PRIMARY KEY,
    analfabetos        INT NOT NULL,
    alfabetos          INT NOT NULL,
    primaria           INT NOT NULL,
    nivel_medio        INT NOT NULL,
    universitarios     INT NOT NULL,
    raza_id_raza       INT NOT NULL,
    sexo_id_genero     INT NOT NULL,
    FOREIGN KEY (raza_id_raza) REFERENCES raza (id_raza),
    FOREIGN KEY (sexo_id_genero) REFERENCES sexo (id_genero)
);

CREATE TABLE zona (
    id_zona                      INT AUTO_INCREMENT PRIMARY KEY,
    pais_id_pais                 INT NOT NULL,
    region_id_region             INT NOT NULL,
    departamento_id_departamento INT NOT NULL,
    municipio_id_municipio       INT NOT NULL,
    FOREIGN KEY (pais_id_pais) REFERENCES pais (id_pais),
    FOREIGN KEY (region_id_region) REFERENCES region (id_region),
    FOREIGN KEY (departamento_id_departamento) REFERENCES departamento (id_departamento),
    FOREIGN KEY (municipio_id_municipio) REFERENCES municipio (id_municipio)
);
CREATE TABLE resultados (
    id_resultado                       INT AUTO_INCREMENT PRIMARY KEY,
    eleccion_id_eleccion               INT NOT NULL,
    año_eleccion_id_eleccion           INT NOT NULL,
    zona_id_zona                       INT NOT NULL,
    partido_id_partido                 INT NOT NULL, 
    caracteristicas_id_caracteristicas INT NOT NULL,
    FOREIGN KEY (eleccion_id_eleccion) REFERENCES eleccion (id_eleccion),
    FOREIGN KEY (año_eleccion_id_eleccion) REFERENCES año_eleccion (id_eleccion),
    FOREIGN KEY (zona_id_zona) REFERENCES zona (id_zona),
    FOREIGN KEY (partido_id_partido) REFERENCES partido (id_partido),
    FOREIGN KEY (caracteristicas_id_caracteristicas) REFERENCES caracteristicas (id_caracteristicas)
);