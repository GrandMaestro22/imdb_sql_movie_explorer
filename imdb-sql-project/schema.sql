-- ============================================================
--  IMDb Movie Database Explorer — Schema Definition
--  This schema matches the IMDb CSV files imported into SQLite
-- ============================================================

---------------------------------------------------------------
-- Table: title_basics
-- Contains core information about movies, shows, and titles
---------------------------------------------------------------
CREATE TABLE IF NOT EXISTS title_basics (
    tconst TEXT PRIMARY KEY,
    titleType TEXT,
    primaryTitle TEXT,
    originalTitle TEXT,
    isAdult INTEGER,
    startYear INTEGER,
    endYear INTEGER,
    runtimeMinutes INTEGER,
    genres TEXT
);

---------------------------------------------------------------
-- Table: title_ratings
-- Contains IMDb ratings and vote counts
---------------------------------------------------------------
CREATE TABLE IF NOT EXISTS title_ratings (
    tconst TEXT PRIMARY KEY,
    averageRating REAL,
    numVotes INTEGER,
    FOREIGN KEY (tconst) REFERENCES title_basics(tconst)
);

---------------------------------------------------------------
-- Table: name_basics
-- Contains information about actors, directors, writers, etc.
---------------------------------------------------------------
CREATE TABLE IF NOT EXISTS name_basics (
    nconst TEXT PRIMARY KEY,
    primaryName TEXT,
    birthYear INTEGER,
    deathYear INTEGER,
    primaryProfession TEXT,
    knownForTitles TEXT
);

---------------------------------------------------------------
-- Table: title_principals
-- Links people (actors, directors, etc.) to titles
---------------------------------------------------------------
CREATE TABLE IF NOT EXISTS title_principals (
    tconst TEXT,
    ordering INTEGER,
    nconst TEXT,
    category TEXT,
    job TEXT,
    characters TEXT,
    FOREIGN KEY (tconst) REFERENCES title_basics(tconst),
    FOREIGN KEY (nconst) REFERENCES name_basics(nconst)
);

---------------------------------------------------------------
-- Table: title_crew
-- Contains director and writer IDs for each title
---------------------------------------------------------------
CREATE TABLE IF NOT EXISTS title_crew (
    tconst TEXT PRIMARY KEY,
    directors TEXT,
    writers TEXT,
    FOREIGN KEY (tconst) REFERENCES title_basics(tconst)
);

---------------------------------------------------------------
-- Table: title_akas (optional)
-- Contains alternate titles for movies/shows
---------------------------------------------------------------
CREATE TABLE IF NOT EXISTS title_akas (
    titleId TEXT,
    ordering INTEGER,
    title TEXT,
    region TEXT,
    language TEXT,
    types TEXT,
    attributes TEXT,
    isOriginalTitle INTEGER,
    FOREIGN KEY (titleId) REFERENCES title_basics(tconst)
);

---------------------------------------------------------------
-- Table: title_episode (optional)
-- Contains episode-level information for TV series
---------------------------------------------------------------
CREATE TABLE IF NOT EXISTS title_episode (
    tconst TEXT PRIMARY KEY,
    parentTconst TEXT,
    seasonNumber INTEGER,
    episodeNumber INTEGER,
    FOREIGN KEY (tconst) REFERENCES title_basics(tconst),
    FOREIGN KEY (parentTconst) REFERENCES title_basics(tconst)
);
