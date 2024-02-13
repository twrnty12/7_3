create table if not exists genres 
(id SERIAL primary KEY,
name VARCHAR(60) UNIQUE NOT NULL
);

create table if not exists performers 
(id SERIAL primary key,
name VARCHAR(60) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS genres_performers( 
genres_id INT REFERENCES genres(id),
performers_id INT REFERENCES performers(id),
CONSTRAINT genres_performers_pk PRIMARY KEY (genres_id, performers_id)
);

create table if not exists albums 
(id SERIAL primary KEY,
name VARCHAR(60) UNIQUE NOT NULL,
date DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS performers_albums(
performers_id INT REFERENCES performers(id),
albums_id INT REFERENCES albums(id),
CONSTRAINT performers_albums_pk PRIMARY KEY (performers_id, albums_id)
);

CREATE TABLE IF NOT EXISTS collection(
id SERIAL PRIMARY KEY,
name varchar(50) UNIQUE NOT NULL, 
date DATE NOT NULL
);

create table if not exists tracks 
(id SERIAL primary KEY,
name VARCHAR(60) UNIQUE NOT NULL,
duration TIME(0) NOT NULL,
fk_albums INT REFERENCES albums(id)
);

CREATE TABLE IF NOT EXISTS collection_tracks(
collection_id INT REFERENCES collection(id),
tracks_id INT REFERENCES tracks(id),
CONSTRAINT collection_tracks_pk PRIMARY KEY (collection_id, tracks_id)
);

INSERT INTO performers (name) VALUES ('Freddie Mercury');
INSERT INTO performers (name) VALUES ('Tupac Shakur');
INSERT INTO performers (name) VALUES ('Mikhail Gorshenev');
INSERT INTO performers (name) VALUES ('Eminem');
SELECT * FROM performers;

INSERT INTO genres (name) VALUES ('Pop Rock');
INSERT INTO genres (name) VALUES ('Hip hop');
INSERT INTO genres (name) VALUES ('Punk Rock');
SELECT * FROM genres;

INSERT INTO albums (name, date) VALUES ('Mr. Bad Guy', '2019-04-29');
INSERT INTO albums (name, date) VALUES ('A stone on the head', '2019-10-03');
INSERT INTO albums (name, date) VALUES ('2Pacalypse Now', '2019-11-12');
INSERT INTO albums (name, date) VALUES ('Infinite', '2020-11-12');
SELECT * FROM albums;

INSERT INTO tracks (name, duration, fk_albums) VALUES ('Made in Heaven', '00:04:06', 1);
INSERT INTO tracks (name, duration, fk_albums) VALUES ('I Was Born to Love You', '00:03:39', 1);
INSERT INTO tracks (name, duration, fk_albums) VALUES ('A Brave One and the Wind', '00:03:03', 2);
INSERT INTO tracks (name, duration, fk_albums) VALUES ('A stone on my head', '00:02:37', 2);
INSERT INTO tracks (name, duration, fk_albums) VALUES ('Young Black Male', '00:02:35', 3);
INSERT INTO tracks (name, duration, fk_albums) VALUES ('Infinite', '00:04:01', 4);
SELECT * FROM tracks;

INSERT INTO collection (name, date) VALUES ('TOP-100 Winter', '2018-02-28');
INSERT INTO collection (name, date) VALUES ('TOP-100 Spring', '2019-05-30');
INSERT INTO collection (name, date) VALUES ('TOP-100 Summer', '2020-08-30');
INSERT INTO collection (name, date) VALUES ('TOP-100 Autumn', '2022-11-30');
SELECT * FROM collection;

INSERT INTO genres_performers (genres_id, performers_id) VALUES (1, 1);
INSERT INTO genres_performers (genres_id, performers_id) VALUES (1, 3);
INSERT INTO genres_performers (genres_id, performers_id) VALUES (2, 2);
INSERT INTO genres_performers (genres_id, performers_id) VALUES (2, 4);
INSERT INTO genres_performers (genres_id, performers_id) VALUES (3, 3);
SELECT * FROM genres_performers;

INSERT INTO performers_albums (performers_id, albums_id) VALUES (1, 1);
INSERT INTO performers_albums (performers_id, albums_id) VALUES (2, 3);
INSERT INTO performers_albums (performers_id, albums_id) VALUES (3, 2);
INSERT INTO performers_albums (performers_id, albums_id) VALUES (4, 4);
SELECT * FROM performers_albums;

INSERT INTO collection_tracks (collection_id, tracks_id) VALUES (1, 1);
INSERT INTO collection_tracks (collection_id, tracks_id) VALUES (1, 2);
INSERT INTO collection_tracks (collection_id, tracks_id) VALUES (1, 3);
INSERT INTO collection_tracks (collection_id, tracks_id) VALUES (1, 4);
INSERT INTO collection_tracks (collection_id, tracks_id) VALUES (2, 1);
INSERT INTO collection_tracks (collection_id, tracks_id) VALUES (2, 2);
INSERT INTO collection_tracks (collection_id, tracks_id) VALUES (2, 3);
INSERT INTO collection_tracks (collection_id, tracks_id) VALUES (2, 4);
INSERT INTO collection_tracks (collection_id, tracks_id) VALUES (3, 1);
INSERT INTO collection_tracks (collection_id, tracks_id) VALUES (3, 2);
INSERT INTO collection_tracks (collection_id, tracks_id) VALUES (3, 3);
INSERT INTO collection_tracks (collection_id, tracks_id) VALUES (3, 4);
INSERT INTO collection_tracks (collection_id, tracks_id) VALUES (4, 1);
INSERT INTO collection_tracks (collection_id, tracks_id) VALUES (4, 2);
INSERT INTO collection_tracks (collection_id, tracks_id) VALUES (4, 3);
INSERT INTO collection_tracks (collection_id, tracks_id) VALUES (4, 4);
SELECT * FROM collection_tracks;
