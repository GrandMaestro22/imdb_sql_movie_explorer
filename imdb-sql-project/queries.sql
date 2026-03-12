/*TOP TEN HIGHEST RATED MOVIES*/
SELECT b.primaryTitle, b.startYear, r.averageRating, r.numVotes
FROM title_basics b
         JOIN title_ratings r
              ON b.tconst = r.tconst
WHERE b.titleType = 'movie'
ORDER BY r.averageRating DESC, r.numVotes DESC
LIMIT 10;

/*ACTION MOVIES ORDERED BY MOST RECENT*/
SELECT primaryTitle, startYear, genres
FROM title_basics
WHERE titleType = 'movie'
AND genres LIKE '%action%'
ORDER BY startYear DESC;

/*DRAMA MOVIES RELEASED ON AND AFTER 2005*/
SELECT primaryTitle, startYear, genres
FROM title_basics
WHERE startYear >= 2005
AND genres LIKE '%Drama%'
ORDER BY startYear DESC;

/*MOVIES RELEASED AFTER 2020*/
SELECT title_basics.primaryTitle, title_basics.startYear, title_basics.genres
FROM title_basics
WHERE titleType = 'movie'
AND startYear >= 2020
ORDER BY startYear DESC;

/*MOST POPULAR MOVIES RELEASED BETWEEN 2010 AND 2020 BASED ON NUMBER OF VOTES AND AVERAGE RATING*/
SELECT b.primaryTitle, b.startYear, r.numVotes, r.averageRating
FROM title_basics b
JOIN title_ratings r ON b.tconst = r.tconst
WHERE titleType = 'movie'
AND 2010 <= startYear <= 2020
order by numVotes, averageRating desc;

/*ALL MOVIES BY TOM HANKS*/
SELECT n.primaryName,
       b.primaryTitle,
       b.startYear,
       p.category
FROM name_basics n
         JOIN title_principals p ON n.nconst = p.nconst
         JOIN title_basics b ON p.tconst = b.tconst
WHERE n.primaryName = 'Tom Hanks'
  AND b.titleType = 'movie'
ORDER BY b.startYear;

/*FIND DIRECTORS OF A MOVIE*/
SELECT b.primaryTitle,
       n.primaryName AS director
FROM title_basics b
         JOIN title_crew c ON b.tconst = c.tconst
         JOIN name_basics n ON c.directors = n.nconst
WHERE b.primaryTitle = 'Inception';
