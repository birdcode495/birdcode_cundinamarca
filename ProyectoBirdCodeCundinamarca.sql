-- Creación de extensión PostGIS para soporte de datos espaciales

CREATE EXTENSION postgis;

-- Consulta de especies de colibries en el territorio del departamento de Cundinamarca
-- y número de registros en la base de datos de la GBIF para cada especie presente

SELECT species, COUNT(DISTINCT id) AS rec_gbif
FROM trochilidae_cundinamarca
GROUP BY species ORDER BY rec_gbif DESC;

