-- Creación de extensión PostGIS para soporte de datos espaciales

CREATE EXTENSION postgis;

-- Consulta de especies de colibries en el territorio del departamento de Cundinamarca
-- y número de registros en la base de datos de la GBIF para cada especie presente

SELECT species, COUNT(DISTINCT id) AS rec_gbif
FROM trochilidae_cundinamarca
GROUP BY species ORDER BY rec_gbif DESC;

-- Creación de campo de municipios en la base de datos de colibries de Cundinamarca

ALTER TABLE trochilidae_cundinamarca ADD COLUMN municipio varchar(90);

-- Segmentación geográfica de registros de colibries de cundinamarca por Municipio

UPDATE trochilidae_cundinamarca SET municipio = municipios_cundinamarca.mpio_cnmbr
FROM municipios_cundinamarca 
WHERE ST_Intersects(trochilidae_cundinamarca.geom, municipios_cundinamarca.geom);

UPDATE trochilidae_cundinamarca SET municipio = bogota.mpio_cnmbr
FROM bogota
WHERE ST_Intersects(trochilidae_cundinamarca.geom, bogota.geom);

