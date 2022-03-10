SELECT (SELECT COUNT(music_id) FROM SpotifyClone.musics) AS 'cancoes',
 (SELECT COUNT(album_id) FROM SpotifyClone.albums) AS 'albuns',
 (SELECT COUNT(singer_id) FROM SpotifyClone.singers) AS 'artistas';
-- resposta baseada em https://stackoverflow.com/questions/43300665/sql-how-to-combine-count-results-from-multiple-tables-into-multiple-columns