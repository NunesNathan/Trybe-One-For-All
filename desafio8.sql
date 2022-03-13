SELECT Singers.singer_name AS 'artista',
Albums.album_name AS 'album'
FROM SpotifyClone.singers AS Singers
 INNER JOIN SpotifyClone.albums AS Albums ON Albums.singer_id = Singers.singer_id
 WHERE singer_name = "Walter Phoenix"
 ORDER BY Albums.album_name;
