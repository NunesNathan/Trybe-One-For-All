SELECT Users.username AS 'usuario',
 IF(MAX(History.play_date) LIKE '2021%', 'Usuário ativo', 'Usuário inativo') AS 'condicao_usuario'
 FROM SpotifyClone.users AS Users
 INNER JOIN SpotifyClone.play_history AS History ON Users.user_id = History.user_id
 GROUP BY Users.username;
