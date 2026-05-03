-- Створення схеми
CREATE SCHEMA IF NOT EXISTS pandemic;

-- Вибір схеми за замовчуванням
USE pandemic;

-- Перевірка кількості завантажених записів:
SELECT COUNT(*) FROM infectious_cases;