CREATE TABLE Languages (
    id_language SERIAL PRIMARY KEY,
    name_language VARCHAR(50) NOT NULL UNIQUE CHECK(name_language !=''),
    number_speakers INT NOT NULL CHECK(number_speakers >= 0)
);
