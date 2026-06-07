-- USERS
INSERT INTO Users (username, email) VALUES
('Noel', 'noel@email.com'),
('John', 'john@email.com'),
('Kai', 'kai@email.com'),
('Allison', 'allison@email.com'),
('Kani', 'kani@email.com');

-- ANIME
INSERT INTO Anime (title, studio, episodes, season, releaseYear) VALUES
('Jujutsu Kaisen', 'MAPPA', 24, 'Fall', 2020),
('Frieren', 'Madhouse', 28, 'Fall', 2023),
('One Piece', 'Toei Animation', 1100, 'Summer', 1999),
('Attack on Titan', 'WIT Studio', 25, 'Spring', 2013),
('Blue Lock', '8bit', 24, 'Fall', 2022);

-- MANGA
INSERT INTO Manga (title, author, volumes, isbn) VALUES
('One Piece', 'Eiichiro Oda', 108, '978-1421536255'),
('Chainsaw Man', 'Tatsuki Fujimoto', 17, '978-1974709939'),
('Blue Lock', 'Muneyuki Kaneshiro', 28, '978-1646516544'),
('Sakamoto Days', 'Yuto Suzuki', 16, '978-1974736584'),
('Frieren', 'Kanehito Yamada', 13, '978-1974725762');

-- WATCH HISTORY
INSERT INTO WatchHistory (userID, animeID, episodesWatched, rating) VALUES
(1, 1, 24, 9.5),
(1, 2, 28, 9.8),
(2, 3, 300, 9.0),
(3, 4, 25, 9.7),
(4, 5, 18, 8.9),
(5, 1, 12, 8.7);

-- READ HISTORY
INSERT INTO ReadHistory (userID, mangaID, lastChapter, completionStatus, dateRead) VALUES
(1, 1, 1115, 'Reading', '2026-05-10'),
(2, 2, 190, 'Completed', '2026-05-08'),
(3, 3, 210, 'Reading', '2026-05-06'),
(4, 4, 145, 'On Hold', '2026-05-03'),
(5, 5, 120, 'Completed', '2026-05-09');
