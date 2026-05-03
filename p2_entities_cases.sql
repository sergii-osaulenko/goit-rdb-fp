-- Створюємо таблицю довідник для країн/регіонів
CREATE TABLE entities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    entity VARCHAR(255) NOT NULL,
    code VARCHAR(10)
);

-- Заповнюємо унікальними комбінаціями Entity та Code
INSERT INTO entities (entity, code)
SELECT DISTINCT Entity, Code
FROM infectious_cases;

-- Створюємо нормалізовану таблицю для випадків захворювань
CREATE TABLE cases (
    id INT AUTO_INCREMENT PRIMARY KEY,
    entity_id INT,
    year INT,
    number_yaws VARCHAR(50),
    polio_cases VARCHAR(50),
    cases_guinea_worm VARCHAR(50),
    number_rabies VARCHAR(50),
    number_malaria VARCHAR(50),
    number_hiv VARCHAR(50),
    number_tuberculosis VARCHAR(50),
    number_smallpox VARCHAR(50),
    number_cholera_cases VARCHAR(50),
    FOREIGN KEY (entity_id) REFERENCES entities(id)
);

-- Переносимо дані, замінюючи Entity та Code на entity_id
INSERT INTO cases (
    entity_id, year, number_yaws, polio_cases, cases_guinea_worm, 
    number_rabies, number_malaria, number_hiv, number_tuberculosis, 
    number_smallpox, number_cholera_cases
)
SELECT 
    e.id, ic.Year, ic.Number_yaws, ic.polio_cases, ic.cases_guinea_worm, 
    ic.Number_rabies, ic.Number_malaria, ic.Number_hiv, ic.Number_tuberculosis, 
    ic.Number_smallpox, ic.Number_cholera_cases
FROM infectious_cases ic
JOIN entities e 
  ON ic.Entity = e.entity AND (ic.Code = e.code OR (ic.Code IS NULL AND e.code IS NULL));