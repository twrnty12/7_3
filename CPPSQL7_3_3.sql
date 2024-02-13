
--1. Количество исполнителей в каждом жанре.
SELECT genres_id, count(performers_id) FROM genres_performers
GROUP BY genres_id ;

--2. Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT count(*) FROM tracks
JOIN albums ON albums.id = tracks.fk_albums
WHERE albums."date" BETWEEN '2019-01-01' AND '2021-01-01'; 

--3. Средняя продолжительность треков по каждому альбому.
SELECT albums.name, AVG(tracks.duration) FROM albums
JOIN tracks ON albums.id = tracks.fk_albums
GROUP BY albums.id;

--4. Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT performers.name, albums."date"  FROM performers
JOIN performers_albums ON performers.id = performers_albums.performers_id
JOIN albums ON albums.id = performers_albums.albums_id
WHERE albums.date < '2020-01-01' OR albums."date" >='2021-01-01';

--5. Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
SELECT c."name" FROM collection c
JOIN collection_tracks ct ON ct.collection_id = c.id
JOIN tracks t ON ct.tracks_id = t.id
JOIN albums a ON t.fk_albums = a.id
JOIN performers_albums pa ON pa.albums_id  = a.id
JOIN performers p ON p.id = pa.performers_id
WHERE p.name = 'Mikhail Gorshenev'
GROUP BY c.name;
