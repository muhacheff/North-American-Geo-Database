-- Создание таблицы A
CREATE TABLE A (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    univ VARCHAR(100)
);

-- Создание таблицы B
CREATE TABLE B (
    id_s SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

-- Вставка данных в таблицу A
INSERT INTO A (id, name, univ) OVERRIDING SYSTEM VALUE VALUES
(5, 'JORA', 'MFTI');
-- Вставка данных в таблицу B
INSERT INTO B (id_s, name) OVERRIDING SYSTEM VALUE VALUES
(1, 'SASHA'),
(3, 'JORA');
