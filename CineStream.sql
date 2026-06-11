CREATE Database CineStream;
Use CineStream;

CREATE TABLE Movies(
movie_id INT (50) Primary Key Auto_Increment,
title VARCHAR(100) Not Null,
genre VARCHAR(50) Not Null,
release_year INT(50),
rental_rate decimal
);
CREATE TABLE Users(
user_id INT Primary Key Auto_Increment,
username VARCHAR (100) Unique Not Null,
email VARCHAR (100) Unique Not Null,
join_date DATE,
status VARCHAR(100)
);

CREATE TABLE WatchLog(
log_id INT(50) Primary Key Auto_Increment,
user_id INT(50),
movie_id INT(50),
watch_date DATETIME,
duration_minutes INT
);

INSERT INTO MOVIES (title, genre, release_year,  rental_rate)
values 
("Intersteller","Sci-Fi",2014,4.99),
("Inception","Sci-Fi/Thriller",2010,3.99),
("The Dark Knight","Action/Crime",2008,3.99),
("The Shawshank Redemption","Drama",1994,2.99),
("Avatar","Sci-Fi/Adventure",2009,4.49),
("Titanic","Romance/Drama",1997,3.49),
("The Matrix","Sci-Fi/Action",1999,3.99),
("Parasite","Thriller/Drama",2019,4.99),
("Joker","Crime/Drama",2019,4.49),
("Dune","Sci-Fi/Adventure",2021,5.99);

INSERT INTO Users (username, email, join_date, status)
VALUES
('Miley_Cyrus', 'miley@example.com', '2025-01-15', 'Active'),
('Kendall_Jenner', 'kendall@example.com', '2026-02-10', 'Active'),
('Anirudh_Sarkar', 'bunny@example.com', '2025-02-25', 'Inactive'),
('JJ_Singhal', 'jj@example.com', '2026-03-05', 'Active'),
('Ultra_Voilet', 'violet@example.com', '2024-03-20', 'Inactive'),
('Emma_Watson', 'emma@example.com', '2024-04-01', 'Active'),
('Megan_Fox', 'foxy@example.com', '2024-04-18', 'Inactive'),
('Oliver_James', 'oliver@example.com', '2024-05-07', 'Active'),
('Red_Label', 'red@example.com', '2024-05-21', 'Active'),
('Marlboro_Red', 'marlboro@example.com', '2024-06-12', 'Inactive');

INSERT INTO WatchLog (user_id, movie_id, watch_date, duration_minutes)
VALUES
(1, 1, '2025-06-01 19:30:00', 169),
(2, 3, '2025-06-02 20:15:00', 152),
(3, 5, '2025-06-03 18:45:00', 162),
(4, 2, '2025-06-04 21:00:00', 148),
(5, 7, '2025-06-05 17:20:00', 136),
(6, 4, '2025-06-06 22:10:00', 142),
(7, 8, '2025-06-07 16:30:00', 132),
(8, 6, '2025-06-08 19:50:00', 194),
(9, 10, '2025-06-09 20:40:00', 155),
(10, 9, '2025-06-10 18:15:00', 122);

SELECT * FROM users
where join_date LIKE "2025%" OR join_date LIKE "2026%"
AND Status = "Active";

INSERT INTO Users (username, email, join_date, status)
VALUES ('Test_User', 'test@example.com', '2026-06-01', 'Inactive');

DELETE FROM Users
WHERE status = 'Inactive'
AND user_id NOT IN (
    SELECT user_id
    FROM WatchLog
);

SELECT
    u.username,
    m.title,
    m.genre,
    w.watch_date,
    w.duration_minutes
FROM Users u
INNER JOIN WatchLog w
    ON u.user_id = w.user_id
INNER JOIN Movies m
    ON w.movie_id = m.movie_id;

SELECT
    m.genre AS Genre_Name,
    COUNT(w.log_id) AS Total_Watch_Count
FROM Movies m
INNER JOIN WatchLog w
    ON m.movie_id = w.movie_id
GROUP BY m.genre
ORDER BY Total_Watch_Count DESC;