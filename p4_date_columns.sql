SELECT 
    year,
    MAKEDATE(year, 1) AS start_of_year, -- Дата 1 січня відповідного року
    CURDATE() AS today_date,            -- Поточна дата
    TIMESTAMPDIFF(YEAR, MAKEDATE(year, 1), CURDATE()) AS diff_in_years -- Різниця в роках
FROM cases;