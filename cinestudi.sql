CREATE DATABASE IF NOT EXISTS cinestudi CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE cinestudi;

CREATE TABLE users (
  user_id INT AUTO_INCREMENT NOT NULL,
  firstname VARCHAR(50) NOT NULL,
  lastname VARCHAR(50) NOT NULL,
  date_of_birth DATE NOT NULL,
  email VARCHAR(255) NOT NULL,
  phone INT(10) NOT NULL,
  PRIMARY KEY (user_id)
) ENGINE=InnoDB;

CREATE TABLE administrators (
  admin_id INT AUTO_INCREMENT NOT NULL,
  user_id INT,
  PRIMARY KEY (admin_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
) ENGINE=InnoDB;

CREATE TABLE customers (
  customer_id INT AUTO_INCREMENT NOT NULL,
  user_id INT,
  customer_type VARCHAR(50) NOT NULL,
  PRIMARY KEY (customer_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
) ENGINE=InnoDB;

CREATE TABLE cinemas (
  cinema_id INT AUTO_INCREMENT NOT NULL,
  name VARCHAR(100) NOT NULL,
  address VARCHAR(255) NOT NULL,
  postcode INT(5) NOT NULL,
  city VARCHAR(100) NOT NULL,
  phone INT(10) NOT NULL,
  PRIMARY KEY (cinema_id)
) ENGINE=InnoDB;

CREATE TABLE cinema_administrators (
  id INT AUTO_INCREMENT NOT NULL,
  admin_id INT,
  cinema_id INT,
  PRIMARY KEY (id),
  FOREIGN KEY (admin_id) REFERENCES administrators(admin_id),
  FOREIGN KEY (cinema_id) REFERENCES cinemas(cinema_id)
) ENGINE=InnoDB;

CREATE TABLE film_categories (
  film_category_id INT AUTO_INCREMENT NOT NULL,
  name VARCHAR(50) NOT NULL,
  PRIMARY KEY (film_category_id)
) ENGINE=InnoDB;

CREATE TABLE movies (
  movie_id INT AUTO_INCREMENT NOT NULL,
  name VARCHAR(100) NOT NULL,
  author VARCHAR (50) NOT NULL,
  duration datetime NOT NULL,
  film_category_id INT,
  PRIMARY KEY (movie_id),
  FOREIGN KEY (film_category_id) REFERENCES film_categories(film_category_id)
) ENGINE=InnoDB;

CREATE TABLE film_shows (
  film_show_id INT AUTO_INCREMENT NOT NULL,
  date_film_show datetime NOT NULL,
  movie_id INT,
  PRIMARY KEY (film_show_id),
  FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
) ENGINE=InnoDB;

CREATE TABLE prices (
  price_id INT AUTO_INCREMENT NOT NULL,
  ticket_price FLOAT(4,2) NOT NULL,
  customer_type VARCHAR(50),
  PRIMARY KEY (price_id)
) ENGINE=InnoDB;

CREATE TABLE movie_rooms (
  movie_room_id INT AUTO_INCREMENT NOT NULL,
  cinema_id INT,
  number_room INT NOT NULL,
  number_of_seats INT NOT NULL,
  film_show_id INT,
  PRIMARY KEY (movie_room_id),
  FOREIGN KEY (cinema_id) REFERENCES cinemas(cinema_id),
  FOREIGN KEY (film_show_id) REFERENCES film_shows(film_show_id)
) ENGINE=InnoDB;

CREATE TABLE booking (
  booking_id INT AUTO_INCREMENT NOT NULL,
  booking_date datetime NOT NULL,
  payment_type VARCHAR(100),
  customer_id INT,
  price_id INT,
  film_show_id INT,
  PRIMARY KEY (booking_id),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  FOREIGN KEY (price_id) REFERENCES prices(price_id),
  FOREIGN KEY (film_show_id)REFERENCES film_shows(film_show_id)
) ENGINE=InnoDB;

INSERT INTO users (user_id, firstname, lastname, date_of_birth, email, phone) values (1, 'Lebbie', 'Le Clercq', '1979/06/24', 'lleclercq0@feedburner.com', '6198044017');
INSERT INTO users (user_id, firstname, lastname, date_of_birth, email, phone) values (2, 'Carena', 'Acors', '1991/01/07', 'cacors1@nhs.uk', '4141493008');
INSERT INTO users (user_id, firstname, lastname, date_of_birth, email, phone) values (3, 'Olly', 'Marco', '1977/03/31', 'omarco2@dion.ne.jp', '8537101431');
INSERT INTO users (user_id, firstname, lastname, date_of_birth, email, phone) values (4, 'Diarmid', 'Katt', '1993/05/26', 'dkatt3@fda.gov', '3593768707');
INSERT INTO users (user_id, firstname, lastname, date_of_birth, email, phone) values (5, 'Therese', 'Candie', '1971/07/25', 'tcandie4@creativecommons.org', '2892691437');
INSERT INTO users (user_id, firstname, lastname, date_of_birth, email, phone) values (6, 'Marc', 'Rikel', '1985/08/08', 'mrikel5@dot.gov', '1011454134');
INSERT INTO users (user_id, firstname, lastname, date_of_birth, email, phone) values (7, 'Claudelle', 'Spiring', '1985/01/05', 'cspiring6@exblog.jp', '3036003403');
INSERT INTO users (user_id, firstname, lastname, date_of_birth, email, phone) values (8, 'Artur', 'Cota', '1990/01/28', 'acota7@g.co', '5669552528');
INSERT INTO users (user_id, firstname, lastname, date_of_birth, email, phone) values (9, 'Allard', 'Denisyuk', '1984/08/20', 'adenisyuk8@hud.gov', '1196014358');
INSERT INTO users (user_id, firstname, lastname, date_of_birth, email, phone) values (10, 'Helli', 'MacCourt', '1985/07/05', 'hmaccourt9@npr.org', '8316740695');
INSERT INTO users (user_id, firstname, lastname, date_of_birth, email, phone) values (11, 'Donnie', 'Bazoge', '1990/11/29', 'dbazogea@barnesandnoble.com', '8625023564');
INSERT INTO users (user_id, firstname, lastname, date_of_birth, email, phone) values (12, 'Philippine', 'Gornal', '1973/11/30', 'pgornalb@eepurl.com', '7296942346');
INSERT INTO users (user_id, firstname, lastname, date_of_birth, email, phone) values (13, 'Belita', 'Eede', '1994/12/10', 'beedec@tuttocitta.it', '3939626487');
INSERT INTO users (user_id, firstname, lastname, date_of_birth, email, phone) values (14, 'Patience', 'Sweeten', '1995/06/30', 'psweetend@domainmarket.com', '5526959358');
INSERT INTO users (user_id, firstname, lastname, date_of_birth, email, phone) values (15, 'Ky', 'Blaschke', '1993/12/10', 'kblaschkee@timesonline.co.uk', '8113322945');
INSERT INTO users (user_id, firstname, lastname, date_of_birth, email, phone) values (16, 'Britta', 'Blackham', '1984/12/10', 'bblackhamf@ezinearticles.com', '2028853081');
INSERT INTO users (user_id, firstname, lastname, date_of_birth, email, phone) values (17, 'Jacquenetta', 'Lawrance', '1983/05/27', 'jlawranceg@patch.com', '8953358138');
INSERT INTO users (user_id, firstname, lastname, date_of_birth, email, phone) values (18, 'Emery', 'Labadini', '1979/11/27', 'elabadinih@epa.gov', '9086365598');
INSERT INTO users (user_id, firstname, lastname, date_of_birth, email, phone) values (19, 'Saidee', 'Helks', '1988/03/05', 'shelksi@fema.gov', '1309416716');
INSERT INTO users (user_id, firstname, lastname, date_of_birth, email, phone) values (20, 'Carmella', 'Scrowston', '1984/08/28', 'cscrowstonj@github.io', '8752320760');
INSERT INTO users (user_id, firstname, lastname, date_of_birth, email, phone) values (21, 'Constance', 'Assandri', '1990/09/28', 'cassandri0@cyberchimps.com', '3388400571');
INSERT INTO users (user_id, firstname, lastname, date_of_birth, email, phone) values (22, 'Grissel', 'Bax', '1982/02/28', 'gbax1@columbia.edu', '3788790544');
INSERT INTO users (user_id, firstname, lastname, date_of_birth, email, phone) values (23, 'My', 'Yakovl', '1989/04/28', 'myakovl2@ucsd.edu', '7449834798');

INSERT INTO administrators (admin_id, user_id) values (1, 20);
INSERT INTO administrators (admin_id, user_id) values (2, 2);
INSERT INTO administrators (admin_id, user_id) values (3, 21);
INSERT INTO administrators (admin_id, user_id) values (4, 22);
INSERT INTO administrators (admin_id, user_id) values (5, 23);

INSERT INTO customers (customer_id, user_id, customer_type) values (1, 1, 'Plein tarif');
INSERT INTO customers (customer_id, user_id, customer_type) values (2, 3, 'Plein tarif');
INSERT INTO customers (customer_id, user_id, customer_type) values (3, 4, 'Plein tarif');
INSERT INTO customers (customer_id, user_id, customer_type) values (4, 5, 'Étudiant');
INSERT INTO customers (customer_id, user_id, customer_type) values (5, 6, 'Moins de 14 ans');
INSERT INTO customers (customer_id, user_id, customer_type) values (6, 7, 'Plein tarif');
INSERT INTO customers (customer_id, user_id, customer_type) values (7, 8, 'Plein tarif');
INSERT INTO customers (customer_id, user_id, customer_type) values (8, 9, 'Plein tarif');
INSERT INTO customers (customer_id, user_id, customer_type) values (9, 1, 'Étudiant');
INSERT INTO customers (customer_id, user_id, customer_type) values (10, 11, 'Plein tarif');
INSERT INTO customers (customer_id, user_id, customer_type) values (11, 12, 'Plein tarif');
INSERT INTO customers (customer_id, user_id, customer_type) values (12, 13, 'Plein tarif');
INSERT INTO customers (customer_id, user_id, customer_type) values (13, 14, 'Plein tarif');
INSERT INTO customers (customer_id, user_id, customer_type) values (14, 15, 'Plein tarif');
INSERT INTO customers (customer_id, user_id, customer_type) values (15, 16, 'Étudiant');
INSERT INTO customers (customer_id, user_id, customer_type) values (16, 17, 'Plein tarif');
INSERT INTO customers (customer_id, user_id, customer_type) values (17, 18, 'Plein tarif');
INSERT INTO customers (customer_id, user_id, customer_type) values (18, 19, 'Étudiant');

insert into cinemas (cinema_id, name, address, postcode, city, phone) values (1, 'Welch, Dach and King', '12 Roxbury Lane', 24657, 'Ziketan', '2339190277');
insert into cinemas (cinema_id, name, address, postcode, city, phone) values (2, 'Schulist-Conn', '7 Fair Oaks Alley', 64195, 'San Vicente', '3519147494');
insert into cinemas (cinema_id, name, address, postcode, city, phone) values (3, 'Medhurst Inc', '94 Glendale Place', 56987, 'Blangpulo', '9624438445');
insert into cinemas (cinema_id, name, address, postcode, city, phone) values (4, 'Buckridge, Rohan and McDermott', '7301 Ruskin Trail', 39280, 'Buritizeiro', '6578768530');
insert into cinemas (cinema_id, name, address, postcode, city, phone) values (5, 'Kovacek, Cummings and Hermann', '5 Meadow Ridge Point', 46789, 'Yuli', '7751455733');

INSERT INTO cinema_administrators (id, admin_id, cinema_id) values (1, 1, 1);
INSERT INTO cinema_administrators (id, admin_id, cinema_id) values (2, 2, 5);
INSERT INTO cinema_administrators (id, admin_id, cinema_id) values (3, 5, 3);
INSERT INTO cinema_administrators (id, admin_id, cinema_id) values (4, 4, 2);
INSERT INTO cinema_administrators (id, admin_id, cinema_id) values (5, 3, 4);

INSERT INTO film_categories (film_category_id, name) values (1, 'humour');
INSERT INTO film_categories (film_category_id, name) values (2, 'action');
INSERT INTO film_categories (film_category_id, name) values (3, 'horreur');
INSERT INTO film_categories (film_category_id, name) values (4, 'fantastique');

insert into movies (movie_id, name, author, duration, film_category_id) values (1, 'The Outsider', 'Palmer McCamish', 130, 2);
insert into movies (movie_id, name, author, duration, film_category_id) values (2, 'Balzac and the Little Chinese Seamstress (Xiao cai feng)', 'Mack Dellenbrook', 120, 1);
insert into movies (movie_id, name, author, duration, film_category_id) values (3, 'Who Killed Bambi? (Qui a tué Bambi?)', 'Aurora Josefson', 110, 3);
insert into movies (movie_id, name, author, duration, film_category_id) values (4, 'Nine Dead', 'Georgetta Vise', 123, 3);
insert into movies (movie_id, name, author, duration, film_category_id) values (5, 'Ill Gotten Gains', 'Annaliese Huller', 134, 1);
insert into movies (movie_id, name, author, duration, film_category_id) values (6, 'Living with the Fosters', 'Rica Wendover', 102, 4);
insert into movies (movie_id, name, author, duration, film_category_id) values (7, 'Dressed to Kill', 'Damon Eouzan', 98, 2);
insert into movies (movie_id, name, author, duration, film_category_id) values (8, 'Howard the Duck', 'Stephana Spratley', 111, 4);
insert into movies (movie_id, name, author, duration, film_category_id) values (9, 'Undercover Blues', 'Bertrando Eagling', 115, 1);
insert into movies (movie_id, name, author, duration, film_category_id) values (10, 'Riders of the Purple Sage', 'Shirleen Hurch', 132, 2);

INSERT INTO film_shows (film_show_id, date_film_show, movie_id) values (1, '2022-10-14 08:47:53', 1);
INSERT INTO film_shows (film_show_id, date_film_show, movie_id) values (2, '2022-10-21 00:58:05', 2);
INSERT INTO film_shows (film_show_id, date_film_show, movie_id) values (3, '2022-10-02 23:22:19', 3);
INSERT INTO film_shows (film_show_id, date_film_show, movie_id) values (4, '2022-10-24 03:26:14', 4);
INSERT INTO film_shows (film_show_id, date_film_show, movie_id) values (5, '2022-10-05 06:31:10', 5);
INSERT INTO film_shows (film_show_id, date_film_show, movie_id) values (6, '2022-10-18 18:25:55', 6);
INSERT INTO film_shows (film_show_id, date_film_show, movie_id) values (7, '2022-10-01 17:00:28', 7);
INSERT INTO film_shows (film_show_id, date_film_show, movie_id) values (8, '2022-10-22 13:32:34', 8);
INSERT INTO film_shows (film_show_id, date_film_show, movie_id) values (9, '2022-10-15 08:35:17', 9);
INSERT INTO film_shows (film_show_id, date_film_show, movie_id) values (10, '2022-10-12 12:35:17', 10);

insert into prices (price_id, ticket_price, customer_type) values (1, '9,30', 'Plein tarif');
insert into prices (price_id, ticket_price, customer_type) values (2, '7,60', 'Étudiant');
insert into prices (price_id, ticket_price, customer_type) values (3, '5,90', 'Moins de 14 ans');

insert into movie_rooms (movie_room_id, cinema_id, number_room, number_of_seats, film_show_id) values (1, 1, 1, 120, 1);
insert into movie_rooms (movie_room_id, cinema_id, number_room, number_of_seats, film_show_id) values (2, 1, 2, 120, 2);
insert into movie_rooms (movie_room_id, cinema_id, number_room, number_of_seats, film_show_id) values (3, 1, 3, 120, 3);
insert into movie_rooms (movie_room_id, cinema_id, number_room, number_of_seats, film_show_id) values (4, 1, 4, 120, 4);
insert into movie_rooms (movie_room_id, cinema_id, number_room, number_of_seats, film_show_id) values (5, 1, 5, 120, 9);
insert into movie_rooms (movie_room_id, cinema_id, number_room, number_of_seats, film_show_id) values (6, 1, 6, 120, 6);
insert into movie_rooms (movie_room_id, cinema_id, number_room, number_of_seats, film_show_id) values (7, 2, 1, 120, 2);
insert into movie_rooms (movie_room_id, cinema_id, number_room, number_of_seats, film_show_id) values (8, 2, 2, 120, 3);
insert into movie_rooms (movie_room_id, cinema_id, number_room, number_of_seats, film_show_id) values (9, 2, 3, 120, 4);
insert into movie_rooms (movie_room_id, cinema_id, number_room, number_of_seats, film_show_id) values (10, 2, 4, 120, 5);
insert into movie_rooms (movie_room_id, cinema_id, number_room, number_of_seats, film_show_id) values (11, 2, 5, 120, 7);
insert into movie_rooms (movie_room_id, cinema_id, number_room, number_of_seats, film_show_id) values (12, 3, 1, 120, 8);
insert into movie_rooms (movie_room_id, cinema_id, number_room, number_of_seats, film_show_id) values (13, 3, 2, 120, 5);
insert into movie_rooms (movie_room_id, cinema_id, number_room, number_of_seats, film_show_id) values (14, 3, 3, 120, 3);
insert into movie_rooms (movie_room_id, cinema_id, number_room, number_of_seats, film_show_id) values (15, 3, 4, 120, 10);
insert into movie_rooms (movie_room_id, cinema_id, number_room, number_of_seats, film_show_id) values (16, 4, 4, 120, 1);
insert into movie_rooms (movie_room_id, cinema_id, number_room, number_of_seats, film_show_id) values (17, 4, 4, 120, 2);
insert into movie_rooms (movie_room_id, cinema_id, number_room, number_of_seats, film_show_id) values (18, 4, 4, 120, 9);
insert into movie_rooms (movie_room_id, cinema_id, number_room, number_of_seats, film_show_id) values (19, 4, 4, 120, 4);
insert into movie_rooms (movie_room_id, cinema_id, number_room, number_of_seats, film_show_id) values (20, 4, 4, 120, 7);
insert into movie_rooms (movie_room_id, cinema_id, number_room, number_of_seats, film_show_id) values (21, 5, 4, 120, 6);
insert into movie_rooms (movie_room_id, cinema_id, number_room, number_of_seats, film_show_id) values (22, 5, 4, 120, 3);
insert into movie_rooms (movie_room_id, cinema_id, number_room, number_of_seats, film_show_id) values (23, 5, 4, 120, 9);
insert into movie_rooms (movie_room_id, cinema_id, number_room, number_of_seats, film_show_id) values (24, 5, 4, 120, 10);
insert into movie_rooms (movie_room_id, cinema_id, number_room, number_of_seats, film_show_id) values (25, 5, 4, 120, 2);
insert into movie_rooms (movie_room_id, cinema_id, number_room, number_of_seats, film_show_id) values (26, 5, 4, 120, 8);

INSERT INTO booking (booking_id, booking_date, payment_type, customer_id, price_id, film_show_id) values (1, '2022-09-5 12:35:17', 'CB', 1, 1, 10);
INSERT INTO booking (booking_id, booking_date, payment_type, customer_id, price_id, film_show_id) values (2, '2022-09-4 14:12:17', 'CB', 3, 1, 2);
INSERT INTO booking (booking_id, booking_date, payment_type, customer_id, price_id, film_show_id) values (3, '2022-09-3 09:02:17', 'CB', 4, 2, 3);
INSERT INTO booking (booking_id, booking_date, payment_type, customer_id, price_id, film_show_id) values (4, '2022-09-3 15:30:17', 'CB', 5, 3, 8);
INSERT INTO booking (booking_id, booking_date, payment_type, customer_id, price_id, film_show_id) values (5, '2022-09-1 11:35:17', 'CB', 6, 1, 1);
INSERT INTO booking (booking_id, booking_date, payment_type, customer_id, price_id, film_show_id) values (6, '2022-09-2 10:03:17', 'CB', 8, 1, 2);
INSERT INTO booking (booking_id, booking_date, payment_type, customer_id, price_id, film_show_id) values (7, '2022-09-5 09:35:17', 'CB', 12, 1, 2);
INSERT INTO booking (booking_id, booking_date, payment_type, customer_id, price_id, film_show_id) values (8, '2022-09-6 10:45:20', 'CB', 18, 2, 6);
INSERT INTO booking (booking_id, booking_date, payment_type, customer_id, price_id, film_show_id) values (9, '2022-09-8 17:45:02', 'CB', 14, 1, 5);
INSERT INTO booking (booking_id, booking_date, payment_type, customer_id, price_id, film_show_id) values (10, '2022-09-7 19:26:34', 'CB', 11, 1, 6);
INSERT INTO booking (booking_id, booking_date, payment_type, customer_id, price_id, film_show_id) values (11, '2022-09-2 20:13:19', 'CB', 7, 1, 4);
INSERT INTO booking (booking_id, booking_date, payment_type, customer_id, price_id, film_show_id) values (12, '2022-09-3 18:04:55', 'CB', 17, 1, 7);
INSERT INTO booking (booking_id, booking_date, payment_type, customer_id, price_id, film_show_id) values (13, '2022-09-8 16:39:10', 'CB', 9, 2, 7);
INSERT INTO booking (booking_id, booking_date, payment_type, customer_id, price_id, film_show_id) values (14, '2022-09-1 21:30:39', 'CB', 15, 2, 8);
INSERT INTO booking (booking_id, booking_date, payment_type, customer_id, price_id, film_show_id) values (15, '2022-09-2 15:54:39', 'CB', 16, 1, 9);
INSERT INTO booking (booking_id, booking_date, payment_type, customer_id, price_id, film_show_id) values (16, '2022-09-6 17:35:41', 'CB', 2, 1, 9);
INSERT INTO booking (booking_id, booking_date, payment_type, customer_id, price_id, film_show_id) values (17, '2022-09-7 09:28:27', 'CB', 13, 1, 9);
INSERT INTO booking (booking_id, booking_date, payment_type, customer_id, price_id, film_show_id) values (18, '2022-09-3 18:14:17', 'CB', 10, 1, 10);