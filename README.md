# animanga-tracking-database

## Overview

The Anime & Manga Tracking Database is a relational database system created to model how popular platforms such as Crunchyroll, Netflix, Viz, and MyAnimeList organize and track user activity.

The database allows users to track anime viewing history, manga reading progress, ratings, completion status, and media information all while keeping efficient data organization through normalization and relational design.

This database was developed as a final database systems project and demonstrates practical SQL database design, entity relationships, indexing, constraints, and query development.

---

## Main Features

- Track anime watch history
- Track manga reading progress
- Store & manage anime and manga metadata
- Generate reports using SQL queries
- Model real-world media tracking systems

---

## Database Design

Primary tables:

### Users
Stores account information for each user.

Fields include:
- User ID
- Username
- Email Address

### Anime
Stores information about anime titles.

Fields include:
- Anime ID
- Title
- Studio
- Episodes
- Season
- Release Year

### Manga
Stores information about manga titles.

Fields include:
- Manga ID
- Title
- Author
- Volumes
- ISBN

### WatchHistory
Stores user interactions with anime.

Fields include:
- Watch ID
- User ID
- Anime ID
- Episodes Watched
- Rating

### ReadHistory
Stores user interactions with manga.

Fields include:
- Read ID
- User ID
- Manga ID
- Last Chapter Read
- Completion Status
- Date Read

---

## Entity Relationships

The database uses one-to-many relationships and foreign keys to connect users with their activity.

Relationships:

Users (1) ---- (Many) WatchHistory

Users (1) ---- (Many) ReadHistory

Anime (1) ---- (Many) WatchHistory

Manga (1) ---- (Many) ReadHistory

History tables act as an association tables between users and media content.

---

## SQL Concepts Demonstrated

### Normalization

The database was normalized to reduce redundant data and improve maintainability.

### Foreign Keys

Foreign key constraints enforce relationships between tables and maintain referential integrity.

### ENUM Constraints

ENUM values restrict specific fields to valid options.

Examples:

- Seasons:
  - Winter
  - Spring
  - Summer
  - Fall

- Completion Status:
  - Reading
  - Completed
  - On Hold
  - Dropped

### CHECK Constraints

Ratings are restricted to valid values between 0 and 10.

### Indexing

Indexes were added to improve query performance and retrieval speed.

---

## Example Queries

### Top Rated Anime

Find the highest-rated anime based on user ratings.

```sql
SELECT title, AVG(rating) AS avgRating
FROM WatchHistory
JOIN Anime ON WatchHistory.animeID = Anime.animeID
GROUP BY title
ORDER BY avgRating DESC;
```

### Completed Manga

Identify users who completed a manga series.

```sql
SELECT username, title, completionStatus
FROM ReadHistory
JOIN Users ON ReadHistory.userID = Users.userID
JOIN Manga ON ReadHistory.mangaID = Manga.mangaID
WHERE completionStatus = 'Completed';
```

### Most Active Users

Determine which users have the highest overall activity.

```sql
SELECT username,
COUNT(DISTINCT WatchHistory.watchID) AS totalWatched,
COUNT(DISTINCT ReadHistory.readID) AS totalRead
FROM Users
LEFT JOIN WatchHistory
ON Users.userID = WatchHistory.userID
LEFT JOIN ReadHistory
ON Users.userID = ReadHistory.userID
GROUP BY username
ORDER BY
COUNT(DISTINCT WatchHistory.watchID) +
COUNT(DISTINCT ReadHistory.readID) DESC;
```

---

## Lessons Learned

Important database concepts that were applied:

- Choosing appropriate JOIN operations
- Designing relational schemas
- Implementing normalization
- Using aggregate functions and GROUP BY
- Improving performance through indexing
- Maintaining data integrity with constraints

One challenge involved ordering grouped aggregate results in the Most Active Users query while working with values and aliases.

---

## Future Improvements

Potential future enhancements include:

- User reviews and comments
- Genre categorization
- Recommendation systems
- Advanced analytics dashboards
- User profile customization

---

## Technologies Used

- SQL
- Relational Database Design
- ER Modeling
- Normalization
- Indexing
- Foreign Key Constraints

---

## Repository Structure

```
anime-manga-tracking-database/
│
├── README.md
├── LICENSE
│
├── sql/
│   ├── tables.sql
│   ├── sample_data.sql
│   └── example_queries.sql
│
└── docs/
    └── ER_Diagram.png
```

---

## Author

Noel Amankrah-Bonsu

Database Systems Final Project
Skyline College
