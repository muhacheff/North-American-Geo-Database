CREATE TABLE Country_languages (
    id_cl SERIAL PRIMARY KEY,
    id_country INT REFERENCES Countries(id_country),
    id_language INT REFERENCES Languages(id_language),
    number_speakers INT NOT NULL CHECK(number_speakers >= 0)
);

CREATE INDEX idx_country_languages_id_language ON country_languages (id_language);