CREATE TABLE Countries (
    id_country SERIAL PRIMARY KEY,
    country_name VARCHAR(50) UNIQUE,
    population INT NOT NULL CHECK(population >= 0),
    area INT NOT NULL CHECK(area >= 0),
    year_of_found INT NOT NULL
);

CREATE INDEX idx_countries_year_found ON countries(year_found);