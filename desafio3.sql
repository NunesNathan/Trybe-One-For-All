SELECT Users.username AS 'usuario',
 COUNT(*) AS 'qtde_musicas_ouvidas',
 ROUND(SUM(Musics.duration_seconds / 60), 2) AS 'total_minutos'
 FROM SpotifyClone.users AS Users
 INNER JOIN SpotifyClone.play_history AS History ON Users.user_id = History.user_id
 INNER JOIN SpotifyClone.musics AS Musics ON Musics.music_id = History.music_id
 GROUP BY Users.username;
