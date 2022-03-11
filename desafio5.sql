SELECT Musics.music_name AS 'cancao',
 COUNT(History.play_date) AS 'reproducoes'
 FROM SpotifyClone.musics AS Musics
 INNER JOIN SpotifyClone.play_history AS History ON Musics.music_id = History.music_id
 GROUP BY Musics.music_name
 ORDER BY reproducoes DESC, Musics.music_name
 LIMIT 2;
