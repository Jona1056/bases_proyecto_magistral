-- consulta 1

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