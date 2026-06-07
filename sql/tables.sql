CREATE TABLE Users (
    userID INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(100)
);
    
CREATE TABLE Anime (
    animeID INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    studio VARCHAR(100),
    episodes INT,
    season ENUM("Fall", "Winter", "Spring", "Summer"),
    releaseYear Year
);

CREATE TABLE Manga (
    mangaID INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(100),
    volumes INT,
    isbn VARCHAR(20)
);

CREATE TABLE WatchHistory (
    watchID INT AUTO_INCREMENT PRIMARY KEY,
    userID INT NOT NULL,
    animeID INT NOT NULL,
    episodesWatched INT,
    rating DECIMAL(3,1) CHECK (rating between 0 AND 10),
    FOREIGN KEY (userID) REFERENCES Users(userID),
    FOREIGN KEY (animeID) REFERENCES Anime(animeID)
);

CREATE TABLE ReadHistory (
    readID INT AUTO_INCREMENT PRIMARY KEY,
    userID INT NOT NULL,
    mangaID INT NOT NULL,
    lastChapter INT,
    completionStatus ENUM("Reading", "Completed", "On Hold", "Dropped"),
    dateRead DATE,
    FOREIGN KEY (userID) REFERENCES Users(userID),
    FOREIGN KEY (mangaID) REFERENCES Manga(mangaID)
);
CREATE INDEX idx_watch_user ON WatchHistory(userID);
CREATE INDEX idx_watch_user ON ReadHistory(userID);
