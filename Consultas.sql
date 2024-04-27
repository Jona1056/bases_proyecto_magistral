-- consulta 1
-- consulta 2
SELECT 
    p.nombre AS nombre_pais,
    d.nombre AS nombre_departamento,
    SUM(CASE WHEN c.sexo_id_genero = 1 THEN 1 ELSE 0 END) AS total_votos_mujeres,
    (SUM(CASE WHEN c.sexo_id_genero = 1 THEN 1 ELSE 0 END) / SUM(CASE WHEN c.sexo_id_genero IN (1, 2) THEN 1 ELSE 0 END)) * 100 AS porcentaje_votos_mujeres
FROM resultados r
INNER JOIN zona z ON r.zona_id_zona = z.id_zona
INNER JOIN departamento d ON z.departamento_id_departamento = d.id_departamento
INNER JOIN pais p ON z.pais_id_pais = p.id_pais
INNER JOIN caracteristicas c ON r.caracteristicas_id_caracteristicas = c.id_caracteristicas
GROUP BY p.nombre, d.nombre;
-- consulta 3
SELECT 
    p.nombre AS 'Nombre del País',
    partido.nombre AS 'Nombre del Partido',
    COUNT(*) AS 'Número de Alcaldías'
FROM 
    resultados r
INNER JOIN 
    zona z ON r.zona_id_zona = z.id_zona
INNER JOIN 
    partido ON r.partido_id_partido = partido.id_partido
INNER JOIN 
    pais p ON z.pais_id_pais = p.id_pais
INNER JOIN (
    SELECT 
        zona_id_zona, 
        MAX(id_resultado) AS max_id_resultado
    FROM 
        resultados
    GROUP BY 
        zona_id_zona
) AS max_resultado ON r.zona_id_zona = max_resultado.zona_id_zona AND r.id_resultado = max_resultado.max_id_resultado
GROUP BY 
    p.nombre, partido.nombre;

-- consulta 5
SELECT 
    d.nombre AS nombre_departamento,
    ((COUNT(CASE WHEN c.sexo_id_genero = 1 AND c.universitarios = 1 THEN r.id_resultado END) / COUNT(CASE WHEN c.sexo_id_genero = 1 THEN r.id_resultado END)) * 100) AS porcentaje_mujeres_universitarias,
    ((COUNT(CASE WHEN c.sexo_id_genero = 2 AND c.universitarios = 1 THEN r.id_resultado END) / COUNT(CASE WHEN c.sexo_id_genero = 2 THEN r.id_resultado END)) * 100) AS porcentaje_hombres_universitarios
FROM resultados r
INNER JOIN zona z ON r.zona_id_zona = z.id_zona
INNER JOIN departamento d ON z.departamento_id_departamento = d.id_departamento
INNER JOIN caracteristicas c ON r.caracteristicas_id_caracteristicas = c.id_caracteristicas
GROUP BY d.nombre
HAVING porcentaje_mujeres_universitarias > porcentaje_hombres_universitarios;


-- consulta 6
SELECT 
    p.nombre AS nombre_pais,
    r.nombre AS nombre_region,
    AVG(total_votos_por_departamento) AS promedio_votos_por_departamento
FROM (
    SELECT 
        z.pais_id_pais,
        z.region_id_region,
        d.id_departamento,
        COUNT(r.id_resultado) AS total_votos_por_departamento
    FROM zona z
    INNER JOIN departamento d ON z.departamento_id_departamento = d.id_departamento
    LEFT JOIN resultados r ON z.id_zona = r.zona_id_zona
    GROUP BY z.pais_id_pais, z.region_id_region, d.id_departamento
) AS votos_por_departamento
INNER JOIN pais p ON votos_por_departamento.pais_id_pais = p.id_pais
INNER JOIN region r ON votos_por_departamento.region_id_region = r.id_region
GROUP BY p.nombre, r.nombre;


-- consulta 7
SELECT
    p.nombre AS nombre_pais,

    ROUND((SUM(CASE WHEN car.raza_id_raza = 1 THEN car.analfabetos + car.alfabetos + car.primaria + car.nivel_medio + car.universitarios ELSE 0 END) * 100 / SUM(car.analfabetos + car.alfabetos + car.primaria + car.nivel_medio + car.universitarios)), 2) AS porcentaje_indigenas,
    ROUND((SUM(CASE WHEN car.raza_id_raza = 2 THEN car.analfabetos + car.alfabetos + car.primaria + car.nivel_medio + car.universitarios ELSE 0 END) * 100 / SUM(car.analfabetos + car.alfabetos + car.primaria + car.nivel_medio + car.universitarios)), 2) AS porcentaje_ladinos,
    ROUND((SUM(CASE WHEN car.raza_id_raza = 3 THEN car.analfabetos + car.alfabetos + car.primaria + car.nivel_medio + car.universitarios ELSE 0 END) * 100 / SUM(car.analfabetos + car.alfabetos + car.primaria + car.nivel_medio + car.universitarios)), 2) AS porcentaje_garifunas
FROM
    pais p
INNER JOIN
    zona z ON p.id_pais = z.pais_id_pais
INNER JOIN
    resultados res ON z.id_zona = res.zona_id_zona
INNER JOIN
    caracteristicas car ON res.caracteristicas_id_caracteristicas = car.id_caracteristicas
GROUP BY
    p.id_pais;

-- Consulta 8
SELECT p.nombre AS nombre_pais
FROM (
    SELECT 
        z.pais_id_pais,
        ABS(MAX(r.id_resultado) - MIN(r.id_resultado)) AS diferencia_resultados
    FROM resultados r
    INNER JOIN zona z ON r.zona_id_zona = z.id_zona
    GROUP BY z.pais_id_pais
) AS resultados_agrupados
INNER JOIN pais p ON resultados_agrupados.pais_id_pais = p.id_pais
ORDER BY resultados_agrupados.diferencia_resultados ASC
LIMIT 1;

-- conuslta 9
SELECT p.nombre AS nombre_pais, 
       (c.analfabetos / (c.analfabetos + c.alfabetos + c.primaria + c.nivel_medio + c.universitarios)) * 100 AS porcentaje_analfabetas
FROM caracteristicas c
INNER JOIN zona z ON c.id_caracteristicas = z.id_zona
INNER JOIN pais p ON z.pais_id_pais = p.id_pais
ORDER BY porcentaje_analfabetas DESC
LIMIT 1;