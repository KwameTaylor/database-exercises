use albums_db;

DESCRIBE albums;

SELECT name
FROM albums
WHERE artist = 'Pink Floyd';

SELECT release_date
FROM albums
WHERE name = "Sgt. Pepper's Lonely Hearts Club Band";

SELECT genre
FROM albums
WHERE name = 'Nevermind';

SELECT name
FROM albums
WHERE release_date BETWEEN 1990 AND 1999;

SELECT name
FROM albums
WHERE sales < 20;

SELECT name
FROM albums
WHERE genre = "Rock";
# These query results don't include albums with genres like "Hard rock" or "Progressive rock" because it is only looking for albums with the genre Rock. We are not using a wildcard.