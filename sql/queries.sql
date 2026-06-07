-- What anime has each user watched and how did they rate it
SELECT username, title, episodesWatched, rating
FROM WatchHistory
JOIN Users on WatchHistory.userID = Users.userID
JOIN Anime on WatchHistory.animeID = Anime.animeID;

-- Which users have completed the book and which book did they complete
SELECT username, title, completionStatus
FROM ReadHistory
JOIN Users on ReadHistory.userID = Users.userID
JOIN Manga on ReadHistory.mangaID = Manga.mangaID
WHERE completionStatus = "Completed";

-- Which anime are rated highest overall
SELECT title, AVG(rating) AS avgRating
FROM WatchHistory
JOIN Anime ON WatchHistory.animeID = Anime.animeID
GROUP BY title
ORDER BY avgRating DESC;

-- Which users are the most active across both reading manga and watching anime?
SELECT username, 
	COUNT(DISTINCT WatchHistory.watchID) AS totalWatched, 
	COUNT(DISTINCT ReadHistory.readID) AS totalRead
FROM Users
LEFT JOIN WatchHistory ON Users.userID = WatchHistory.userID
LEFT JOIN ReadHistory ON Users.userID = ReadHistory.userID
GROUP BY username
ORDER BY COUNT(DISTINCT WatchHistory.watchID) + COUNT(DISTINCT ReadHistory.readID) DESC;
