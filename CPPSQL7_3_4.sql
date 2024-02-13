--1. Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
SELECT count(*) FROM genres_performers gp
GROUP BY gp.performers_id
HAVING count(*) > 1;

--2. Наименования треков, которые не входят в сборники.
SELECT albums.name FROM albums
JOIN performers_albums ON albums.id = performers_albums.albums_id
JOIN genres_performers ON performers_albums.performers_id = genres_performers.performers_id
GROUP BY albums.name
HAVING count(genres_performers.genres_id) > 1;

--3. Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.
SELECT tracks."name" FROM tracks
LEFT JOIN collection_tracks ct ON tracks.id = ct.tracks_id
WHERE ct.collection_id IS NULL;

--4. Названия альбомов, содержащих наименьшее количество треков.
SELECT performers."name" FROM performers
JOIN performers_albums pa ON performers.id = pa.performers_id 
JOIN tracks t  ON t.fk_albums = pa.albums_id
WHERE t.duration = (SELECT MIN(duration) FROM tracks);

SELECT name FROM albums
WHERE id IN (SELECT fk_albums FROM tracks
GROUP BY fk_albums 
HAVING COUNT(*) = (SELECT MIN(fk_albums) FROM tracks));