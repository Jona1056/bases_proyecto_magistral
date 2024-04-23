--consulta 7
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