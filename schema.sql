-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it

-- This is the schema that simulates my own perspective on how spotify data can be stored in a SQL database

-- Database Tables

CREATE TABLE "artists" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "email" TEXT NOT NULL UNIQUE,
    "password" TEXT NOT NULL,
    "verified" INTEGER NOT NULL DEFAULT 0 CHECK("verified" IN (0, 1)), -- Can be either 0 for not verified and 1 if verified
    "num_listeners" INTEGER NOT NULL DEFAULT 0 CHECK("num_listeners" >= 0),
    "image_url" TEXT NOT NULL DEFAULT 'https://placehold.co/600x400/png',
    "about" TEXT,
    "start_year" INTEGER CHECK("start_year" >= 1500),
    PRIMARY KEY("id")
);

-- Create a row for unknown artists to assign to a track if the artist is deleted or if it isn't know who is the creator of a track

INSERT INTO "artists" ("name", "email", "password")
VALUES ("unknown", "unknown", "unknown");

CREATE TABLE "albums" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "tracks" (
    "id" INTEGER,
    "title" TEXT NOT NULL,
    "album_id" INTEGER DEFAULT NULL,
    "listens_count" INTEGER NOT NULL DEFAULT 0 CHECK("listens_count" >= 0),
    "duration_in_mins" INTEGER NOT NULL CHECK("duration_in_mins" >= 1),
    "release_year" INTEGER NOT NULL CHECK("release_year" > 1500),
    PRIMARY KEY("id"),
    FOREIGN KEY("album_id") REFERENCES "albums"("id") ON DELETE SET DEFAULT -- the track will become a single
);

CREATE TABLE "tracks_by_artists" (
    "artist_id" INTEGER DEFAULT 1,
    "track_id" INTEGER,
    "type" TEXT NOT NULL DEFAULT 'primary' CHECK("type" IN ('primary', 'featured')),
    PRIMARY KEY("artist_id", "track_id"),
    FOREIGN KEY("artist_id") REFERENCES "artists"("id") ON DELETE SET DEFAULT, -- Set to unknown artist
    FOREIGN KEY("track_id") REFERENCES "tracks"("id") ON DELETE CASCADE
);

CREATE TABLE "users" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "username" TEXT NOT NULL UNIQUE,
    "email" TEXT NOT NULL UNIQUE,
    "password" TEXT NOT NULL,
    "image_url" TEXT NOT NULL DEFAULT 'https://placehold.co/600x400/png',
    "premium" INTEGER NOT NULL DEFAULT 0 CHECK("premium" IN (0, 1)), -- Acts as a boolean: 0 for non-premium and 1 for premium
    PRIMARY KEY("id")
);

CREATE TABLE "users_follows_artists" (
    "user_id" INTEGER,
    "artist_id" INTEGER,
    PRIMARY KEY("user_id", "artist_id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id") ON DELETE CASCADE,
    FOREIGN KEY("artist_id") REFERENCES "artists"("id") ON DELETE CASCADE
);

CREATE TABLE "users_follows_users" (
    "follower_id" INTEGER,
    "following_id" INTEGER,
    PRIMARY KEY("follower_id", "following_id"),
    FOREIGN KEY("follower_id") REFERENCES "users"("id") ON DELETE CASCADE,
    FOREIGN KEY("following_id") REFERENCES "users"("id") ON DELETE CASCADE
);

CREATE TABLE "playlists" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "creator_id" INTEGER,
    "description" TEXT,
    "image_url" TEXT NOT NULL DEFAULT 'https://placehold.co/600x400/png',
    PRIMARY KEY("id"),
    FOREIGN KEY("creator_id") REFERENCES "users"("id") ON DELETE CASCADE
);

CREATE TABLE "users_save_playlists" (
    "user_id" INTEGER,
    "playlist_id" INTEGER,
    PRIMARY KEY("user_id", "playlist_id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id") ON DELETE CASCADE,
    FOREIGN KEY("playlist_id") REFERENCES "playlists" ON DELETE CASCADE
);

CREATE TABLE "playlists_tracks" (
    "track_id" INTEGER,
    "playlist_id" INTEGER,
    "date_added" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY("track_id", "playlist_id"),
    FOREIGN KEY("track_id") REFERENCES "tracks"("id") ON DELETE CASCADE,
    FOREIGN KEY("playlist_id") REFERENCES "playlists"("id") ON DELETE CASCADE
);

CREATE TABLE "categories" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    PRIMARY KEY("id")
);

CREATE TABLE "podcasts" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "about" TEXT,
    "rating" REAL CHECK("rating" >= 0 AND "rating" <= 5),
    "owner_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("owner_id") REFERENCES "users"("id") ON DELETE CASCADE
);

CREATE TABLE "podcasts_categories" (
    "podcast_id" INTEGER,
    "category_id" INTEGER,
    PRIMARY KEY("podcast_id", "category_id"),
    FOREIGN KEY("podcast_id") REFERENCES "podcasts"("id") ON DELETE CASCADE,
    FOREIGN KEY("category_id") REFERENCES "categories"("id") ON DELETE CASCADE
);

CREATE TABLE "episodes" (
    "id" INTEGER,
    "podcast_id" INTEGER,
    "title" TEXT NOT NULL,
    "description" TEXT,
    "date_streamed" NUMERIC NOT NULL,
    "duration_in_mins" INTEGER NOT NULL CHECK("duration_in_mins" > 0),
    PRIMARY KEY("id"),
    FOREIGN KEY("podcast_id") REFERENCES "podcasts"("id") ON DELETE CASCADE
);

CREATE TABLE "users_follows_podcasts" (
    "user_id" INTEGER,
    "podcast_id" INTEGER,
    PRIMARY KEY("user_id", "podcast_id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id") ON DELETE CASCADE,
    FOREIGN KEY("podcast_id") REFERENCES "podcasts"("id") ON DELETE CASCADE
);

CREATE TABLE "users_likes_tracks" (
    "user_id" INTEGER,
    "track_id" INTEGER,
    PRIMARY KEY("user_id", "track_id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id") ON DELETE CASCADE,
    FOREIGN KEY("track_id") REFERENCES "tracks"("id") ON DELETE CASCADE
);

CREATE TABLE "users_episodes" (
    "user_id" INTEGER,
    "episode_id" INTEGER,
    PRIMARY KEY("user_id", "episode_id")
    FOREIGN KEY("user_id") REFERENCES "users"("id") ON DELETE CASCADE,
    FOREIGN KEY("episode_id") REFERENCES "episodes"("id") ON DELETE CASCADE
);

CREATE TABLE "tours" (
    "id" INTEGER,
    "concert_time" NUMERIC NOT NULL,
    "location" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "tickets_links" (
    "id" INTEGER,
    "link" TEXT NOT NULL UNIQUE,
    "tour_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("tour_id") REFERENCES "tours"("id") ON DELETE CASCADE
);

CREATE TABLE "artists_tours" (
    "artist_id" INTEGER,
    "tour_id" INTEGER,
    PRIMARY KEY("artist_id", "tour_id"),
    FOREIGN KEY("artist_id") REFERENCES "artists"("id") ON DELETE CASCADE,
    FOREIGN KEY("tour_id") REFERENCES "tours"("id") ON DELETE CASCADE
);

CREATE TABLE "genres" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    PRIMARY KEY("id")
);

CREATE TABLE "tours_genres" (
    "tour_id" INTEGER,
    "genre_id" INTEGER,
    PRIMARY KEY("tour_id", "genre_id"),
    FOREIGN KEY("tour_id") REFERENCES "tours"("id") ON DELETE CASCADE,
    FOREIGN KEY("genre_id") REFERENCES "genres"("id") ON DELETE CASCADE
);

CREATE TABLE "users_tours" (
    "user_id" INTEGER,
    "tour_id" INTEGER,
    PRIMARY KEY("user_id", "tour_id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id") ON DELETE CASCADE,
    FOREIGN KEY("tour_id") REFERENCES "tours"("id") ON DELETE CASCADE
);

-- Optimize database queries using indexes
CREATE INDEX "artist_name" ON "artists"("name");
CREATE INDEX "artist_login" ON "artists"("email", "password");
CREATE INDEX "album_name" ON "albums"("name");
CREATE INDEX "track_title" ON "tracks"("title");
CREATE INDEX "track_album" ON "tracks"("album_id");
CREATE INDEX "track_release_year" ON "tracks"("release_year");
CREATE INDEX "track_artist" ON "tracks_by_artists"("artist_id");
CREATE INDEX "user_login" ON "users"("email", "password");
CREATE INDEX "user_following_artists" ON "users_follows_artists"("user_id");
CREATE INDEX "artist_followers" ON "users_follows_artists"("artist_id");
CREATE INDEX "user_following_users" ON "users_follows_users"("follower_id");
CREATE INDEX "user_followers" ON "users_follows_users"("following_id");
CREATE INDEX "playlist_name" ON "playlists"("name");
CREATE INDEX "owner_playlists" ON "playlists"("creator_id");
CREATE INDEX "user_saved_playlists" ON "users_save_playlists"("user_id");
CREATE INDEX "playlist_saves" ON "users_save_playlists"("playlist_id");
CREATE INDEX "playlist_tracks" ON "playlists_tracks"("playlist_id");
CREATE INDEX "podcast_name" ON "podcasts"("name");
CREATE INDEX "owner_podcasts" ON "podcasts"("owner_id");
CREATE INDEX "category_podcasts" ON "podcasts_categories"("category_id");
CREATE INDEX "podcast_categories" ON "podcasts_categories"("podcast_id");
CREATE INDEX "podcast_episodes" ON "episodes"("podcast_id");
CREATE INDEX "episode_title" ON "episodes"("title");
CREATE INDEX "user_following_podcasts" ON "users_follows_podcasts"("user_id");
CREATE INDEX "podcast_followers" ON "users_follows_podcasts"("podcast_id");
CREATE INDEX "user_liked_tracks" ON "users_likes_tracks"("user_id");
CREATE INDEX "user_saved_episodes" ON "users_episodes"("user_id");
CREATE INDEX "tour_tickets" ON "tickets_links"("tour_id");
CREATE INDEX "artist_tours" ON "artists_tours"("artists_id");
CREATE INDEX "tour_artists" ON "artists_tours"("tours_id");
CREATE INDEX "tour_date" ON "tours"("concert_time");
CREATE INDEX "location_tours" ON "tours"("location");
CREATE INDEX "tour_genres" ON "tours_genres"("tour_id");
CREATE INDEX "genre_tours" ON "tours_genres"("genre_id");
CREATE INDEX "user_events" ON "users_tours"("user_id");

-- create views for optimiztion and security
CREATE VIEW "homepage_playlists" AS
SELECT "playlists"."name", "playlists"."description", "playlists"."image_url", "users"."username" FROM "playlists"
JOIN "users" ON "playlists"."creator_id" = "users"."id";

CREATE VIEW "latest_podcasts_episodes" AS
SELECT "episodes"."title", "podcasts"."name", "episodes"."description", "episodes"."date_streamed", "episodes"."duration_in_mins" FROM "episodes"
JOIN "podcasts" ON "episodes"."podcast_id" = "podcasts"."id"
ORDER BY "episodes"."date_streamed" DESC
LIMIT 20;

CREATE VIEW "new_releases" AS
SELECT "tracks"."title", "artists"."name" FROM "tracks"
JOIN "tracks_by_artists" ON "tracks"."id" = "tracks_by_artists"."track_id"
JOIN "artists" ON "tracks_by_artists"."artist_id" = "artists"."id"
ORDER BY "tracks"."release_year" DESC
LIMIT 20;


