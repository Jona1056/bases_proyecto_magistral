-- cargar paises
LOAD DATA INFILE 'D:/Desktop/BASES DE DATOS/bases_proyecto_magistral/pais.csv' 
INTO TABLE pais
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\n'
ignore 1 lines;

-- cargar sexo
LOAD DATA INFILE 'D:/Desktop/BASES DE DATOS/bases_proyecto_magistral/sexo.csv' 
INTO TABLE sexo
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\n'
ignore 1 lines;

--cargar region 
LOAD DATA INFILE 'D:/Desktop/BASES DE DATOS/bases_proyecto_magistral/region.csv' 
INTO TABLE region
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\n'
ignore 1 lines;


--cargar raza
LOAD DATA INFILE 'D:/Desktop/BASES DE DATOS/bases_proyecto_magistral/raza.csv' 
INTO TABLE raza
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\n'
ignore 1 lines;


--cargar partidos
LOAD DATA INFILE 'D:/Desktop/BASES DE DATOS/bases_proyecto_magistral/partido.csv' 
INTO TABLE partido
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\n'
ignore 1 lines;

-- cargar elecciones

LOAD DATA INFILE 'D:/Desktop/BASES DE DATOS/bases_proyecto_magistral/nombre_eleccion.csv' 
INTO TABLE eleccion
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\n'
ignore 1 lines;

--cargar municipios 
LOAD DATA INFILE 'D:/Desktop/BASES DE DATOS/bases_proyecto_magistral/municipio.csv' 
INTO TABLE municipio
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\n'
ignore 1 lines;

--cargar departamento 
LOAD DATA INFILE 'D:/Desktop/BASES DE DATOS/bases_proyecto_magistral/departamento.csv' 
INTO TABLE departamento
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\n'
ignore 1 lines;

LOAD DATA INFILE "D:/Desktop/BASES DE DATOS/bases_proyecto_magistral/anoeleccion.csv"
INTO TABLE año_eleccion
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

--CARGAR CARacteristicas
LOAD DATA INFILE "D:/Desktop/BASES DE DATOS/bases_proyecto_magistral/caracteristicas.csv"
INTO TABLE caracteristicas
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

--CARGAR ZONA
LOAD DATA INFILE "D:/Desktop/BASES DE DATOS/bases_proyecto_magistral/zona.csv"
INTO TABLE zona
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
;

-- cargar resultados
LOAD DATA INFILE "D:/Desktop/BASES DE DATOS/bases_proyecto_magistral/resultados.csv"
INTO TABLE resultados
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
;