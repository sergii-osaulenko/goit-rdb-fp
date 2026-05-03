-- Змінюємо делімітер, щоб MySQL правильно розпізнав тіло функції
DELIMITER //

CREATE FUNCTION CalculateYearDifference(input_year INT) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE start_date DATE;
    DECLARE diff INT;
    
    -- Генеруємо дату 1 січня з переданого року
    SET start_date = MAKEDATE(input_year, 1);
    
    -- Рахуємо різницю в роках до поточної дати
    SET diff = TIMESTAMPDIFF(YEAR, start_date, CURDATE());
    
    RETURN diff;
END //

DELIMITER ;

-- Використання створеної функції:
SELECT 
    year,
    CalculateYearDifference(year) AS years_passed
FROM cases;