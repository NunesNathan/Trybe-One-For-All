DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;


CREATE TABLE SpotifyClone.services (
  service_id INT NOT NULL AUTO_INCREMENT,
  service_name VARCHAR(25) NOT NULL,
  service_price DECIMAL(4,2) NOT NULL,
  PRIMARY KEY (service_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.singers (
  singer_id INT NOT NULL AUTO_INCREMENT,
  singer_name VARCHAR(100) NULL,
  PRIMARY KEY (singer_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.albums (
  album_id INT NOT NULL,
  singer_id INT NOT NULL,
  album_name VARCHAR(100) NULL,
  release_year INT NOT NULL,
  PRIMARY KEY (album_id),
  FOREIGN KEY (singer_id)
  REFERENCES SpotifyClone.singers (singer_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.musics (
  music_id INT NOT NULL,
  music_name VARCHAR(45) NOT NULL,
  duration_seconds INT NOT NULL,
  album_id INT NOT NULL,
  PRIMARY KEY (music_id),
  FOREIGN KEY (album_id)
  REFERENCES SpotifyClone.albums (album_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.users (
  user_id INT NOT NULL AUTO_INCREMENT,
  username VARCHAR(32) NOT NULL,
  user_age INT NOT NULL,
  service_id INT NOT NULL,
  subscription_date DATE NOT NULL,
  PRIMARY KEY (user_id),
  FOREIGN KEY (service_id)
  REFERENCES SpotifyClone.services (service_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.follows_history (
  user_id INT NOT NULL,
  singer_id INT NOT NULL,
  PRIMARY KEY (user_id, singer_id),
  FOREIGN KEY (user_id)
  REFERENCES SpotifyClone.users (user_id),
  FOREIGN KEY (singer_id)
  REFERENCES SpotifyClone.singers (singer_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.play_history (
  music_id INT NOT NULL,
  user_id INT NOT NULL,
  play_date DATETIME NULL,
  PRIMARY KEY (music_id, user_id),
  FOREIGN KEY (user_id)
  REFERENCES SpotifyClone.users (user_id),
  FOREIGN KEY (music_id)
  REFERENCES SpotifyClone.musics (music_id)
) engine = InnoDB;


INSERT INTO SpotifyClone.services (service_id, service_name, service_price) VALUES (1, 'gratuito', 0.00);
INSERT INTO SpotifyClone.services (service_id, service_name, service_price) VALUES (2, 'familiar', 7.99);
INSERT INTO SpotifyClone.services (service_id, service_name, service_price) VALUES (3, 'universitario', 5.99);
INSERT INTO SpotifyClone.services (service_id, service_name, service_price) VALUES (4, 'pessoal', 6.99);

INSERT INTO SpotifyClone.singers (singer_id, singer_name) VALUES (1, 'Walter Phoenix');
INSERT INTO SpotifyClone.singers (singer_id, singer_name) VALUES (2, 'Freedie Shannon');
INSERT INTO SpotifyClone.singers (singer_id, singer_name) VALUES (3, 'Lance Day');
INSERT INTO SpotifyClone.singers (singer_id, singer_name) VALUES (4, 'Peter Strong');
INSERT INTO SpotifyClone.singers (singer_id, singer_name) VALUES (5, 'Fog');
INSERT INTO SpotifyClone.singers (singer_id, singer_name) VALUES (6, 'Tyler Isle');

INSERT INTO SpotifyClone.albums (album_id, singer_id, album_name, release_year) VALUES (1, 1, 'Envious', 1990);
INSERT INTO SpotifyClone.albums (album_id, singer_id, album_name, release_year) VALUES (2, 1, 'Exuberant', 1993);
INSERT INTO SpotifyClone.albums (album_id, singer_id, album_name, release_year) VALUES (3, 4, 'Hallowed Steam', 1995);
INSERT INTO SpotifyClone.albums (album_id, singer_id, album_name, release_year) VALUES (4, 3, 'Incandescent', 1998);
INSERT INTO SpotifyClone.albums (album_id, singer_id, album_name, release_year) VALUES (5, 2, 'Temporary Culture', 2001);
INSERT INTO SpotifyClone.albums (album_id, singer_id, album_name, release_year) VALUES (6, 2, 'Library of liberty', 2003);
INSERT INTO SpotifyClone.albums (album_id, singer_id, album_name, release_year) VALUES (7, 6, 'Chained Down', 2007);
INSERT INTO SpotifyClone.albums (album_id, singer_id, album_name, release_year) VALUES (8, 6, 'Cabinet of fools', 2012);
INSERT INTO SpotifyClone.albums (album_id, singer_id, album_name, release_year) VALUES (9, 6, 'No guarantees', 2015);
INSERT INTO SpotifyClone.albums (album_id, singer_id, album_name, release_year) VALUES (10, 5, 'Apparatus', 2015);

INSERT INTO SpotifyClone.musics (music_id, music_name, duration_seconds, album_id) VALUES (1, 'Soul For Us', 200, 1);
INSERT INTO SpotifyClone.musics (music_id, music_name, duration_seconds, album_id) VALUES (2, 'Reflections Of Magic', 163, 1);
INSERT INTO SpotifyClone.musics (music_id, music_name, duration_seconds, album_id) VALUES (3, 'Dance With Her Own', 116, 1);
INSERT INTO SpotifyClone.musics (music_id, music_name, duration_seconds, album_id) VALUES (4, 'Troubles Of My Inner Fire', 203, 2);
INSERT INTO SpotifyClone.musics (music_id, music_name, duration_seconds, album_id) VALUES (5, 'Time Fireworks', 152, 2);
INSERT INTO SpotifyClone.musics (music_id, music_name, duration_seconds, album_id) VALUES (6, 'Magic Circus', 105, 3);
INSERT INTO SpotifyClone.musics (music_id, music_name, duration_seconds, album_id) VALUES (7, 'Honey, So Do I', 207, 3);
INSERT INTO SpotifyClone.musics (music_id, music_name, duration_seconds, album_id) VALUES (8, 'Sweetie, Let\'s Go Wild', 139, 3);
INSERT INTO SpotifyClone.musics (music_id, music_name, duration_seconds, album_id) VALUES (9, 'She Knows', 244, 3);
INSERT INTO SpotifyClone.musics (music_id, music_name, duration_seconds, album_id) VALUES (10, 'Fantasy For Me', 100, 4);
INSERT INTO SpotifyClone.musics (music_id, music_name, duration_seconds, album_id) VALUES (11, 'Celebration Of More', 146, 4);
INSERT INTO SpotifyClone.musics (music_id, music_name, duration_seconds, album_id) VALUES (12, 'Rock His Everything', 223, 4);
INSERT INTO SpotifyClone.musics (music_id, music_name, duration_seconds, album_id) VALUES (13, 'Home Forever', 231, 4);
INSERT INTO SpotifyClone.musics (music_id, music_name, duration_seconds, album_id) VALUES (14, 'Diamond Power', 241, 4);
INSERT INTO SpotifyClone.musics (music_id, music_name, duration_seconds, album_id) VALUES (15, 'Let\'s Be Silly', 132, 4);
INSERT INTO SpotifyClone.musics (music_id, music_name, duration_seconds, album_id) VALUES (16, 'Thang Of Thunder', 240, 5);
INSERT INTO SpotifyClone.musics (music_id, music_name, duration_seconds, album_id) VALUES (17, 'Words Of Her Life', 185, 5);
INSERT INTO SpotifyClone.musics (music_id, music_name, duration_seconds, album_id) VALUES (18, 'Without My Streets', 176, 5);
INSERT INTO SpotifyClone.musics (music_id, music_name, duration_seconds, album_id) VALUES (19, 'Need Of The Evening', 190, 6);
INSERT INTO SpotifyClone.musics (music_id, music_name, duration_seconds, album_id) VALUES (20, 'History Of My Roses', 222, 6);
INSERT INTO SpotifyClone.musics (music_id, music_name, duration_seconds, album_id) VALUES (21, 'Without My Love', 111, 6);
INSERT INTO SpotifyClone.musics (music_id, music_name, duration_seconds, album_id) VALUES (22, 'Walking And Game', 123, 6);
INSERT INTO SpotifyClone.musics (music_id, music_name, duration_seconds, album_id) VALUES (23, 'Young And Father', 197, 6);
INSERT INTO SpotifyClone.musics (music_id, music_name, duration_seconds, album_id) VALUES (24, 'Finding My Traditions', 179, 7);
INSERT INTO SpotifyClone.musics (music_id, music_name, duration_seconds, album_id) VALUES (25, 'Walking And Man', 229, 7);
INSERT INTO SpotifyClone.musics (music_id, music_name, duration_seconds, album_id) VALUES (26, 'Hard And Time', 135, 7);
INSERT INTO SpotifyClone.musics (music_id, music_name, duration_seconds, album_id) VALUES (27, 'Honey, I\'m A Lone Wolf', 150, 7);
INSERT INTO SpotifyClone.musics (music_id, music_name, duration_seconds, album_id) VALUES (28, 'She Thinks I Won\'t Stay Tonight', 166, 8);
INSERT INTO SpotifyClone.musics (music_id, music_name, duration_seconds, album_id) VALUES (29, 'He Heard You\'re Bad For Me', 154, 8);
INSERT INTO SpotifyClone.musics (music_id, music_name, duration_seconds, album_id) VALUES (30, 'He Hopes We Can\'t Stay', 210, 8);
INSERT INTO SpotifyClone.musics (music_id, music_name, duration_seconds, album_id) VALUES (31, 'I Know I Know', 117, 8);
INSERT INTO SpotifyClone.musics (music_id, music_name, duration_seconds, album_id) VALUES (32, 'He\'s Walking Away', 159, 9);
INSERT INTO SpotifyClone.musics (music_id, music_name, duration_seconds, album_id) VALUES (33, 'He\'s Trouble', 138, 9);
INSERT INTO SpotifyClone.musics (music_id, music_name, duration_seconds, album_id) VALUES (34, 'I Heard I Want To Bo Alone', 120, 9);
INSERT INTO SpotifyClone.musics (music_id, music_name, duration_seconds, album_id) VALUES (35, 'I Ride Alone', 151, 9);
INSERT INTO SpotifyClone.musics (music_id, music_name, duration_seconds, album_id) VALUES (36, 'Honey', 79, 10);
INSERT INTO SpotifyClone.musics (music_id, music_name, duration_seconds, album_id) VALUES (37, 'You Cheated On Me', 95, 10);
INSERT INTO SpotifyClone.musics (music_id, music_name, duration_seconds, album_id) VALUES (38, 'Wouldn\'t It Be Nice', 213, 10);
INSERT INTO SpotifyClone.musics (music_id, music_name, duration_seconds, album_id) VALUES (39, 'Baby', 136, 10);
INSERT INTO SpotifyClone.musics (music_id, music_name, duration_seconds, album_id) VALUES (40, 'You Make Me Feel So..', 83, 10);

INSERT INTO SpotifyClone.users (user_id, username, user_age, service_id, subscription_date) VALUES (1, 'Thati', 23, 1, '2019-10-20');
INSERT INTO SpotifyClone.users (user_id, username, user_age, service_id, subscription_date) VALUES (2, 'Cintia', 35, 2, '2017-12-30');
INSERT INTO SpotifyClone.users (user_id, username, user_age, service_id, subscription_date) VALUES (3, 'Bill', 20, 3, '2019-06-05');
INSERT INTO SpotifyClone.users (user_id, username, user_age, service_id, subscription_date) VALUES (4, 'Roger', 45, 4, '2020-05-13');
INSERT INTO SpotifyClone.users (user_id, username, user_age, service_id, subscription_date) VALUES (5, 'Norman', 58, 4, '2017-02-17');
INSERT INTO SpotifyClone.users (user_id, username, user_age, service_id, subscription_date) VALUES (6, 'Patrick', 33, 2, '2017-01-06');
INSERT INTO SpotifyClone.users (user_id, username, user_age, service_id, subscription_date) VALUES (7, 'Vivian', 26, 3, '2018-01-05');
INSERT INTO SpotifyClone.users (user_id, username, user_age, service_id, subscription_date) VALUES (8, 'Carol', 19, 3, '2018-02-14');
INSERT INTO SpotifyClone.users (user_id, username, user_age, service_id, subscription_date) VALUES (9, 'Angelina', 42, 2, '2018-04-29');
INSERT INTO SpotifyClone.users (user_id, username, user_age, service_id, subscription_date) VALUES (10, 'Paul', 46, 2, '2017-01-17');

INSERT INTO SpotifyClone.follows_history (user_id, singer_id) VALUES (1, 1);
INSERT INTO SpotifyClone.follows_history (user_id, singer_id) VALUES (1, 2);
INSERT INTO SpotifyClone.follows_history (user_id, singer_id) VALUES (1, 3);
INSERT INTO SpotifyClone.follows_history (user_id, singer_id) VALUES (2, 1);
INSERT INTO SpotifyClone.follows_history (user_id, singer_id) VALUES (2, 3);
INSERT INTO SpotifyClone.follows_history (user_id, singer_id) VALUES (3, 4);
INSERT INTO SpotifyClone.follows_history (user_id, singer_id) VALUES (3, 1);
INSERT INTO SpotifyClone.follows_history (user_id, singer_id) VALUES (4, 2);
INSERT INTO SpotifyClone.follows_history (user_id, singer_id) VALUES (5, 6);
INSERT INTO SpotifyClone.follows_history (user_id, singer_id) VALUES (5, 5);
INSERT INTO SpotifyClone.follows_history (user_id, singer_id) VALUES (6, 5);
INSERT INTO SpotifyClone.follows_history (user_id, singer_id) VALUES (6, 3);
INSERT INTO SpotifyClone.follows_history (user_id, singer_id) VALUES (6, 1);
INSERT INTO SpotifyClone.follows_history (user_id, singer_id) VALUES (7, 4);
INSERT INTO SpotifyClone.follows_history (user_id, singer_id) VALUES (7, 6);
INSERT INTO SpotifyClone.follows_history (user_id, singer_id) VALUES (8, 1);
INSERT INTO SpotifyClone.follows_history (user_id, singer_id) VALUES (8, 6);
INSERT INTO SpotifyClone.follows_history (user_id, singer_id) VALUES (9, 5);
INSERT INTO SpotifyClone.follows_history (user_id, singer_id) VALUES (9, 2);
INSERT INTO SpotifyClone.follows_history (user_id, singer_id) VALUES (9, 3);
INSERT INTO SpotifyClone.follows_history (user_id, singer_id) VALUES (10, 4);
INSERT INTO SpotifyClone.follows_history (user_id, singer_id) VALUES (10, 5);

INSERT INTO SpotifyClone.play_history (music_id, user_id, play_date) VALUES (36, 1, "2020-02-28 10:45:55");
INSERT INTO SpotifyClone.play_history (music_id, user_id, play_date) VALUES (25, 1, '2020-05-02 05:30:35');
INSERT INTO SpotifyClone.play_history (music_id, user_id, play_date) VALUES (23, 1, '2020-03-06 11:22:33');
INSERT INTO SpotifyClone.play_history (music_id, user_id, play_date) VALUES (14, 1, '2020-08-05 08:05:17');
INSERT INTO SpotifyClone.play_history (music_id, user_id, play_date) VALUES (15, 1, '2020-09-14 16:32:22');
INSERT INTO SpotifyClone.play_history (music_id, user_id, play_date) VALUES (34, 2, '2020-01-02 07:40:33');
INSERT INTO SpotifyClone.play_history (music_id, user_id, play_date) VALUES (24, 2, '2020-05-16 06:16:22');
INSERT INTO SpotifyClone.play_history (music_id, user_id, play_date) VALUES (21, 2, '2020-10-09 12:27:48');
INSERT INTO SpotifyClone.play_history (music_id, user_id, play_date) VALUES (39, 2, '2020-09-21 13:14:46');
INSERT INTO SpotifyClone.play_history (music_id, user_id, play_date) VALUES (6, 3, '2020-11-13 16:55:13');
INSERT INTO SpotifyClone.play_history (music_id, user_id, play_date) VALUES (3, 3, '2020-12-05 18:38:30');
INSERT INTO SpotifyClone.play_history (music_id, user_id, play_date) VALUES (26, 3, '2020-07-30 10:00:00');
INSERT INTO SpotifyClone.play_history (music_id, user_id, play_date) VALUES (2, 4, '2021-08-15 17:10:10');
INSERT INTO SpotifyClone.play_history (music_id, user_id, play_date) VALUES (35, 4, '2021-07-10 15:20:30');
INSERT INTO SpotifyClone.play_history (music_id, user_id, play_date) VALUES (27, 4, '2021-01-09 01:44:33');
INSERT INTO SpotifyClone.play_history (music_id, user_id, play_date) VALUES (7, 5, '2020-07-03 19:33:28');
INSERT INTO SpotifyClone.play_history (music_id, user_id, play_date) VALUES (12, 5, '2017-02-24 21:14:22');
INSERT INTO SpotifyClone.play_history (music_id, user_id, play_date) VALUES (14, 5, '2020-08-06 15:23:43');
INSERT INTO SpotifyClone.play_history (music_id, user_id, play_date) VALUES (1, 5, '2020-11-10 13:52:27');
INSERT INTO SpotifyClone.play_history (music_id, user_id, play_date) VALUES (38, 6, '2019-02-07 20:33:48');
INSERT INTO SpotifyClone.play_history (music_id, user_id, play_date) VALUES (29, 6, '2017-01-24 00:31:17');
INSERT INTO SpotifyClone.play_history (music_id, user_id, play_date) VALUES (30, 6, '2017-10-12 12:35:20');
INSERT INTO SpotifyClone.play_history (music_id, user_id, play_date) VALUES (22, 6, '2018-05-29 14:56:41');
INSERT INTO SpotifyClone.play_history (music_id, user_id, play_date) VALUES (5, 7, '2018-05-09 22:30:49');
INSERT INTO SpotifyClone.play_history (music_id, user_id, play_date) VALUES (4, 7, '2020-07-27 12:52:58');
INSERT INTO SpotifyClone.play_history (music_id, user_id, play_date) VALUES (11, 7, '2018-01-16 18:40:43');
INSERT INTO SpotifyClone.play_history (music_id, user_id, play_date) VALUES (39, 8, '2018-03-21 16:56:40');
INSERT INTO SpotifyClone.play_history (music_id, user_id, play_date) VALUES (40, 8, '2020-10-18 13:38:05');
INSERT INTO SpotifyClone.play_history (music_id, user_id, play_date) VALUES (32, 8, '2019-05-25 08:14:03');
INSERT INTO SpotifyClone.play_history (music_id, user_id, play_date) VALUES (33, 8, '2021-08-15 21:37:09');
INSERT INTO SpotifyClone.play_history (music_id, user_id, play_date) VALUES (16, 9, '2021-05-24 17:23:45');
INSERT INTO SpotifyClone.play_history (music_id, user_id, play_date) VALUES (17, 9, '2018-12-07 22:48:52');
INSERT INTO SpotifyClone.play_history (music_id, user_id, play_date) VALUES (8, 9, '2021-03-14 06:14:26');
INSERT INTO SpotifyClone.play_history (music_id, user_id, play_date) VALUES (9, 9, '2020-04-01 03:36:00');
INSERT INTO SpotifyClone.play_history (music_id, user_id, play_date) VALUES (20, 10, '2017-02-06 08:21:34');
INSERT INTO SpotifyClone.play_history (music_id, user_id, play_date) VALUES (21, 10, '2017-12-04 05:33:43');
INSERT INTO SpotifyClone.play_history (music_id, user_id, play_date) VALUES (12, 10, '2017-07-27 05:24:49');
INSERT INTO SpotifyClone.play_history (music_id, user_id, play_date) VALUES (13, 10, '2017-12-25 01:03:57');
