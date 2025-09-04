CREATE TABLE PopularAttractions (
    id_attraction SERIAL PRIMARY KEY,
    name_attraction VARCHAR(100) NOT NULL UNIQUE,
    in_WHS BOOLEAN NOT NULL,
    id_city INT REFERENCES BigCities(id_city)
);

CREATE INDEX idx_popularattractions ON popularattractions (in_whs);