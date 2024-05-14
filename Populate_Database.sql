CREATE SCHEMA IF NOT EXISTS cinema_test;

USE cinema_test;

INSERT INTO movie (id, title, rating, release_date) VALUES 
(1, 'The Shawshank Redemption', 9.3, '1994-10-14'),
(2, 'The Godfather', 9.2, '1972-03-24'),
(3, 'The Dark Knight', 9.0, '2008-07-18'),
(4, 'Schindler\'s List', 8.9, '1994-12-15'),
(5, 'Forrest Gump', 8.8, '1994-07-06'),
(6, 'Inception', 8.8, '2010-07-16'),
(7, 'The Matrix', 8.7, '1999-03-31'),
(8, 'Pulp Fiction', 8.9, '1994-10-14'),
(9, 'Fight Club', 8.8, '1999-10-15'),
(10, 'The Lord of the Rings: The Return of the King', 8.9, '2003-12-17');

INSERT INTO movie (id, title, rating, release_date) VALUES 
(11, 'Parasite', 8.6, '2019-05-21'),
(12, 'Joker', 8.5, '2019-10-04'),
(13, '1917', 8.3, '2019-12-25'),
(14, 'Avengers: Endgame', 8.4, '2019-04-26'),
(15, 'The Irishman', 7.9, '2019-11-27'),
(16, 'Once Upon a Time in Hollywood', 7.6, '2019-07-26'),
(17, 'The Shape of Water', 7.3, '2017-12-01'),
(18, 'La La Land', 8.0, '2016-12-09'),
(19, 'Moonlight', 7.4, '2016-10-21'),
(20, 'Interstellar', 8.6, '2014-11-07');

-- insert movies genres
INSERT INTO genre (id, name) VALUES (1, 'Action');
INSERT INTO genre (id, name) VALUES (2, 'Comedy');
INSERT INTO genre (id, name) VALUES (3, 'Drama');
INSERT INTO genre (id, name) VALUES (4, 'Adventure');
INSERT INTO genre (id, name) VALUES (5, 'Horror');
INSERT INTO genre (id, name) VALUES (6, 'Science Fiction');
INSERT INTO genre (id, name) VALUES (7, 'Thriller');
INSERT INTO genre (id, name) VALUES (8, 'Romance');
INSERT INTO genre (id, name) VALUES (9, 'Fantasy');
INSERT INTO genre (id, name) VALUES (10, 'Mystery');
INSERT INTO genre (id, name) VALUES (11, 'Crime');
INSERT INTO genre (id, name) VALUES (12, 'Animation');
INSERT INTO genre (id, name) VALUES (13, 'Family');
INSERT INTO genre (id, name) VALUES (14, 'Documentary');
INSERT INTO genre (id, name) VALUES (15, 'Musical');
INSERT INTO genre (id, name) VALUES (16, 'Western');
INSERT INTO genre (id, name) VALUES (17, 'Historical');

-- Inserting actors into the "actor" table
INSERT INTO actor (id, name, birthday) VALUES 
(1, 'Tim Robbins', '1958-10-16'),
(2, 'Morgan Freeman', '1937-06-01'),
(3, 'Marlon Brando', '1924-04-03'),
(4, 'Al Pacino', '1940-04-25'),
(5, 'Christian Bale', '1974-01-30'),
(6, 'Heath Ledger', '1979-04-04'),
(7, 'Liam Neeson', '1952-06-07'),
(8, 'Ben Kingsley', '1943-12-31'),
(9, 'Tom Hanks', '1956-07-09'),
(10, 'Robin Wright', '1966-04-08'),
(11, 'Leonardo DiCaprio', '1974-11-11'),
(12, 'Joseph Gordon-Levitt', '1981-02-17'),
(13, 'Keanu Reeves', '1964-09-02'),
(14, 'Laurence Fishburne', '1961-07-30'),
(15, 'John Travolta', '1954-02-18'),
(16, 'Uma Thurman', '1970-04-29'),
(17, 'Brad Pitt', '1963-12-18'),
(18, 'Edward Norton', '1969-08-18'),
(19, 'Elijah Wood', '1981-01-28'),
(20, 'Ian McKellen', '1939-05-25');

INSERT INTO actor (id, name, birthday) VALUES 
(21, 'Kang-ho Song', '1967-04-17'), -- Parasite
    (22,'Sun-kyun Lee', '1975-03-02'), -- Parasite
    (23, 'Joaquin Phoenix', '1974-10-28'), -- Joker
    (24, 'Robert De Niro', '1943-08-17'), -- Joker, The Irishman
    (25, 'George MacKay', '1992-03-13'), -- 1917
    (26, 'Dean-Charles Chapman', '1997-09-07'), -- 1917
    (27, 'Robert Downey Jr.', '1965-04-04'), -- Avengers: Endgame
    (28, 'Chris Evans', '1981-06-13'), -- Avengers: Endgame
    (29, 'Sally Hawkins', '1976-04-27'), -- The Shape of Water
    (30, 'Richard Jenkins', '1947-05-04'), -- The Shape of Water
    (31, 'Ryan Gosling', '1980-11-12'), -- La La Land
    (32, 'Emma Stone', '1988-11-06'), -- La La Land
    (33, 'Mahershala Ali', '1974-02-16'), -- Moonlight
    (34, 'Trevante Rhodes', '1990-02-10'), -- Moonlight
    (35, 'Matthew McConaughey', '1969-11-04'), -- Interstellar
    (36, 'Anne Hathaway', '1982-11-12');

-- Set movies descriptions and image path
UPDATE movie SET description = 'A tale of hope and friendship in the darkest of places, following banker Andy Dufresne\'s life in Shawshank prison.' WHERE id = 1;
UPDATE movie SET description = 'The epic story of the Corleone mafia family, exploring themes of power, loyalty, and the American dream.' WHERE id = 2;
UPDATE movie SET description = 'Batman faces the Joker in a battle for Gotham\'s soul in this thrilling sequel that explores chaos and morality.' WHERE id = 3;
UPDATE movie SET description = 'Oskar Schindler saves over a thousand Jews during the Holocaust in this powerful testament to hope and humanity.' WHERE id = 4;
UPDATE movie SET description = 'The extraordinary life of Forrest Gump, a simple man who unwittingly becomes a part of pivotal moments in American history.' WHERE id = 5;
UPDATE movie SET description = 'A thief who enters the dreams of others must plant an idea into a target\'s subconscious in this mind-bending sci-fi thriller.' WHERE id = 6;
UPDATE movie SET description = 'A computer hacker learns about the true nature of reality and his role in the war against its controllers in this cyberpunk classic.' WHERE id = 7;
UPDATE movie SET description = 'Quentin Tarantino\'s masterpiece intertwines the lives of two mob hitmen, a boxer, and other eccentric characters in Los Angeles.' WHERE id = 8;
UPDATE movie SET description = 'An insomniac office worker and a devil-may-care soapmaker form an underground fight club that evolves into something much more.' WHERE id = 9;
UPDATE movie SET description = 'The final chapter of the epic journey of Frodo to destroy the One Ring, facing the dark power of Sauron in Middle-earth.' WHERE id = 10;

UPDATE movie SET description = 'A gripping tale of class struggle and deception unfolds when a poor family scams their way into a wealthy household.' WHERE id = 11;
UPDATE movie SET description = 'Joaquin Phoenix delivers a chilling performance as Arthur Fleck, a man disregarded by society, in this origin story of the infamous Joker.' WHERE id = 12;
UPDATE movie SET description = 'Two young British soldiers are given a seemingly impossible mission during World War I in this visually stunning and emotionally powerful film.' WHERE id = 13;
UPDATE movie SET description = 'The Avengers assemble once more in this epic conclusion to the Infinity Saga, facing off against Thanos in a battle to save the universe.' WHERE id = 14;
UPDATE movie SET description = 'Martin Scorsese reunites with Robert De Niro and Joe Pesci in this epic saga of organized crime in post-war America.' WHERE id = 15;
UPDATE movie SET description = 'Quentin Tarantino\'s love letter to Hollywood in the late 1960s, following the lives of a fading TV star and his stunt double.' WHERE id = 16;
UPDATE movie SET description = 'A mute janitor forms a unique bond with an amphibious creature being held captive in a government laboratory during the Cold War era.' WHERE id = 17;
UPDATE movie SET description = 'A jazz pianist falls for an aspiring actress in Los Angeles, but their love is tested as they pursue their dreams in this modern musical.' WHERE id = 18;
UPDATE movie SET description = 'A young African-American man grapples with his identity and sexuality while growing up in a rough neighborhood in Miami.' WHERE id = 19;
UPDATE movie SET description = 'In a future where Earth is dying, a team of astronauts embarks on a dangerous mission through a wormhole in search of a new home for humanity.' WHERE id = 20;

UPDATE movie SET image_url = '/assets/images/The_Shawshank_Redemption.jpg' WHERE id = 1;
UPDATE movie SET image_url = '/assets/images/The_Godfather.jpg' WHERE id = 2;
UPDATE movie SET image_url = '/assets/images/The_Dark_Knight.jpg' WHERE id = 3;
UPDATE movie SET image_url = '/assets/images/Schindler\'s_List.jpg' WHERE id = 4;
UPDATE movie SET image_url = '/assets/images/Forrest_Gump.jpg' WHERE id = 5;
UPDATE movie SET image_url = '/assets/images/Inception.jpg' WHERE id = 6;
UPDATE movie SET image_url = '/assets/images/The_Matrix.jpg' WHERE id = 7;
UPDATE movie SET image_url = '/assets/images/Pulp_Fiction.jpg' WHERE id = 8;
UPDATE movie SET image_url = '/assets/images/Fight_Club.jpg' WHERE id = 9;
UPDATE movie SET image_url = '/assets/images/The_Lord_of_the_Rings_The_Return_of_the_King.jpg' WHERE id = 10;
UPDATE movie SET image_url = '/assets/images/Parasite.jpg' WHERE id = 11;
UPDATE movie SET image_url = '/assets/images/Joker.jpg' WHERE id = 12;
UPDATE movie SET image_url = '/assets/images/1917.jpg' WHERE id = 13;
UPDATE movie SET image_url = '/assets/images/Avengers_Endgame.jpg' WHERE id = 14;
UPDATE movie SET image_url = '/assets/images/The_Irishman.jpg' WHERE id = 15;
UPDATE movie SET image_url = '/assets/images/Once_Upon_a_Time_in_Hollywood.jpg' WHERE id = 16;
UPDATE movie SET image_url = '/assets/images/The_Shape_of_Water.jpg' WHERE id = 17;
UPDATE movie SET image_url = '/assets/images/La_La_Land.jpg' WHERE id = 18;
UPDATE movie SET image_url = '/assets/images/Moonlight.jpg' WHERE id = 19;
UPDATE movie SET image_url = '/assets/images/Interstellar.jpg' WHERE id = 20;

-- Set movies trailer url
UPDATE movie SET trailer_url = 'https://www.youtube.com/embed/PLl99DlL6b4?si=DiELuE93hspLOX1E' WHERE id = 1;
UPDATE movie SET trailer_url = 'https://www.youtube.com/embed/sY1S34973zA?si=1jmrlxUdrjee21hD' WHERE id = 2;
UPDATE movie SET trailer_url = 'https://www.youtube.com/embed/EXeTwQWrcwY?si=Uk4ZMaph6kaz85d8' WHERE id = 3;
UPDATE movie SET trailer_url = 'https://www.youtube.com/embed/gG22XNhtnoY?si=jsV9LA7J2ai3wmAN' WHERE id = 4;
UPDATE movie SET trailer_url = 'https://www.youtube.com/embed/Mj9IA9tTfio?si=Y5QcCTOUfxqVDKCF' WHERE id = 5;
UPDATE movie SET trailer_url = 'https://www.youtube.com/embed/Qwe6qXFTdgc?si=n9IfAMq6IIkCFsOE' WHERE id = 6;
UPDATE movie SET trailer_url = 'https://www.youtube.com/embed/9ix7TUGVYIo?si=xF7aolbjJGHtip3r' WHERE id = 7;
UPDATE movie SET trailer_url = 'https://www.youtube.com/embed/5ZAhzsi1ybM?si=RfBiZjRW5yZHm12L' WHERE id = 8;
UPDATE movie SET trailer_url = 'https://www.youtube.com/embed/qtRKdVHc-cE?si=MMWMAszMfJbp97cj' WHERE id = 9;
UPDATE movie SET trailer_url = 'https://www.youtube.com/embed/r5X-hFf6Bwo?si=JJA8ZmUihZvSa01m' WHERE id = 10;
UPDATE movie SET trailer_url = 'https://www.youtube.com/embed/5xH0HfJHsaY?si=-Kn_mVVsoZ_ZcGiT' WHERE id = 11;
UPDATE movie SET trailer_url = 'https://www.youtube.com/embed/zAGVQLHvwOY?si=LQhdm-0d6-VxeCqN' WHERE id = 12;
UPDATE movie SET trailer_url = 'https://www.youtube.com/embed/YqNYrYUiMfg?si=MPpvCaDKU1gDsEnj' WHERE id = 13;
UPDATE movie SET trailer_url = 'https://www.youtube.com/embed/TcMBFSGVi1c?si=KFpJuig73i2RduhG' WHERE id = 14;
UPDATE movie SET trailer_url = 'https://www.youtube.com/embed/WHXxVmeGQUc?si=PCwdWxDD34080a9N' WHERE id = 15;
UPDATE movie SET trailer_url = 'https://www.youtube.com/embed/ELeMaP8EPAA?si=UCLzTnzqQVR-0B8O' WHERE id = 16;
UPDATE movie SET trailer_url = 'https://www.youtube.com/embed/XFYWazblaUA?si=WjazmJUaA23C6PwE' WHERE id = 17;
UPDATE movie SET trailer_url = 'https://www.youtube.com/embed/0pdqf4P9MB8?si=foRv0K1xG2m-0zFo' WHERE id = 18;
UPDATE movie SET trailer_url = 'https://www.youtube.com/embed/9NJj12tJzqc?si=mv7NsMnvfPvZgEIj' WHERE id = 19;
UPDATE movie SET trailer_url = 'https://www.youtube.com/embed/zSWdZVtXT7E?si=22oDQu3l-MvYUf8A' WHERE id = 20;

-- Inserting records into the "movie_genre" table for the specified movies
INSERT INTO movie_genre (movie_id, genre_id) VALUES
-- The Shawshank Redemption: Drama
(1, 3),
-- The Godfather: Crime, Drama
(2, 11),
(2, 3),
-- The Dark Knight: Action, Crime, Drama
(3, 1),
(3, 11),
(3, 3),
-- Schindler's List: Biography, Drama, History
(4, 3),
(4, 17),
-- Forrest Gump: Drama, Romance
(5, 3),
(5, 8),
-- Inception: Action, Adventure, Sci-Fi
(6, 1),
(6, 4),
(6, 6),
-- The Matrix: Action, Sci-Fi
(7, 1),
(7, 6),
-- Pulp Fiction: Crime, Drama
(8, 11),
(8, 3),
-- Fight Club: Drama
(9, 3),
-- The Lord of the Rings: The Return of the King: Adventure, Drama, Fantasy
(10, 4),
(10, 3),
(10, 9);

-- Inserting records into the "movie_genre" table for the specified movies
INSERT INTO movie_genre (movie_id, genre_id) VALUES
-- Parasite: Comedy, Drama, Thriller
(11, 2),
(11, 3),
(11, 7),
-- Joker: Crime, Drama, Thriller
(12, 11),
(12, 3),
(12, 7),
-- 1917: Drama, War
(13, 3),
(13, 17),
-- Avengers: Endgame: Action, Adventure, Drama
(14, 1),
(14, 4),
(14, 3),
-- The Irishman: Biography, Crime, Drama
(15, 11),
(15, 3),
(15, 17),
-- Once Upon a Time in Hollywood: Comedy, Drama
(16, 2),
(16, 3),
-- The Shape of Water: Adventure, Drama, Fantasy
(17, 4),
(17, 3),
(17, 9),
-- La La Land: Comedy, Drama, Musical
(18, 2),
(18, 3),
(18, 15),
-- Moonlight: Drama
(19, 3),
-- Interstellar: Adventure, Drama, Sci-Fi
(20, 4),
(20, 3),
(20, 6);


INSERT INTO actor_movie (actor_id, movie_id) VALUES
-- The Shawshank Redemption
(1, 1),  -- Tim Robbins
(2, 1),  -- Morgan Freeman
-- The Godfather
(3, 2),  -- Marlon Brando
(4, 2),  -- Al Pacino
-- The Dark Knight
(5, 3),  -- Christian Bale
(6, 3),  -- Heath Ledger
-- Schindler's List
(7, 4),  -- Liam Neeson
(8, 4),  -- Ben Kingsley
-- Forrest Gump
(9, 5),  -- Tom Hanks
(10, 5), -- Robin Wright
-- Inception
(11, 6), -- Leonardo DiCaprio
(12, 6), -- Joseph Gordon-Levitt
-- The Matrix
(13, 7), -- Keanu Reeves
(14, 7), -- Laurence Fishburne
-- Pulp Fiction
(15, 8), -- John Travolta
(16, 8), -- Uma Thurman
-- Fight Club
(17, 9), -- Brad Pitt
(18, 9), -- Edward Norton
-- The Lord of the Rings: The Return of the King
(19, 10),-- Elijah Wood
(20, 10);-- Ian McKellen


INSERT INTO actor_movie (actor_id, movie_id) VALUES
-- The Shawshank Redemption
(1, 1),  -- Tim Robbins
(2, 1),  -- Morgan Freeman
-- The Godfather
(3, 2),  -- Marlon Brando
(4, 2),  -- Al Pacino
-- The Dark Knight
(5, 3),  -- Christian Bale
(6, 3),  -- Heath Ledger
-- Schindler's List
(7, 4),  -- Liam Neeson
(8, 4),  -- Ben Kingsley
-- Forrest Gump
(9, 5),  -- Tom Hanks
(10, 5), -- Robin Wright
-- Inception
(11, 6), -- Leonardo DiCaprio
(12, 6), -- Joseph Gordon-Levitt
-- The Matrix
(13, 7), -- Keanu Reeves
(14, 7), -- Laurence Fishburne
-- Pulp Fiction
(15, 8), -- John Travolta
(16, 8), -- Uma Thurman
-- Fight Club
(17, 9), -- Brad Pitt
(18, 9), -- Edward Norton
-- The Lord of the Rings: The Return of the King
(19, 10),-- Elijah Wood
(20, 10),-- Ian McKellen
-- Parasite
(21, 11),  -- Kang-ho Song
(22, 11),  -- Sun-kyun Lee
-- Joker
(23, 12),  -- Joaquin Phoenix
(24, 12),  -- Robert De Niro
-- 1917
(25, 13),  -- George MacKay
(26, 13),  -- Dean-Charles Chapman
-- Avengers: Endgame
(27, 14),  -- Robert Downey Jr.
(28, 14),  -- Chris Evans

-- The Irishman (ID: 15)
(24, 15), -- Robert De Niro
(25, 15), -- George MacKay

-- Once Upon a Time in Hollywood (ID: 16)
(11, 16), -- Leonardo DiCaprio
(16, 16), -- Uma Thurman

-- The Shape of Water (ID: 17)
(29, 17), -- Sally Hawkins
(30, 17), -- Richard Jenkins

-- La La Land (ID: 18)
(31, 18), -- Ryan Gosling
(32, 18), -- Emma Stone

-- Moonlight (ID: 19)
(33, 19), -- Mahershala Ali
(34, 19), -- Trevante Rhodes

-- Interstellar (ID: 20)
(35, 20), -- Matthew McConaughey
(36, 20); -- Anne Hathaway

