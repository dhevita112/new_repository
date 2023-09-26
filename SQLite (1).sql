-- Dhevita Intan Ervandra
-- create table
CREATE TABLE input_table (
    id INT AUTO_INCREMENT PRIMARY KEY,
    num INT
);

3
CREATE TABLE input_table (
4
    id INT AUTO_INCREMENT PRIMARY KEY,
5
    num INT
6
);
7
​
-- input example value
INSERT INTO input_table (num) VALUES
    (1),
    (2),
    (2),
    (2),
    (2),
    (1),
    (1),
    (1),
    (1);

-- query for get value
SELECT DISTINCT num AS consecutive_num
FROM (
    SELECT num,
           LAG(num) OVER (ORDER BY id) AS prev_num,
           LEAD(num) OVER (ORDER BY id) AS next_num
    FROM input_table
) AS subquery
WHERE num = prev_num AND num = next_num
ORDER BY consecutive_num ASC;