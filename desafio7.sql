SELECT Singers.singer_name AS 'artista',
 Albums.album_name AS 'album',
 COUNT(*) AS 'seguidores'
 FROM SpotifyClone.singers AS Singers
 INNER JOIN SpotifyClone.albums AS Albums ON Albums.singer_id = Singers.singer_id
 INNER JOIN SpotifyClone.follows_history AS Follows ON Follows.singer_id = Albums.singer_id
 GROUP BY Singers.singer_name, Albums.album_name
 ORDER BY seguidores DESC, artista, album;
