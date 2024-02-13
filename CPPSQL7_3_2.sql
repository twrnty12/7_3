
--1. Название и продолжительность самого длительного трека.
SELECT name, duration FROM tracks
WHERE duration = (SELECT max(duration) FROM tracks);

--2. Название треков, продолжительность которых не менее 3,5 минут.
SELECT name, duration FROM tracks 
WHERE duration >= '00:03:30';

--3. Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT name, date FROM collection 
WHERE date >= '2018-01-01' AND date < '2022-01-01';

--4. Исполнители, чьё имя состоит из одного слова.
SELECT name FROM performers 
WHERE name NOT LIKE '% %';

--5. Название треков, которые содержат слово «мой» или «my».
SELECT name FROM tracks 
WHERE name LIKE '%my%' OR name LIKE '%мой%';