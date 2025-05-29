-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database
-- Insert data into the database
INSERT INTO "artists" ("name", "email", "password", "verified", "num_listeners") VALUES
("Bee Gees", "bee@gmail.com", "123456", 1, 25664175),
("Peter Gabriel", "peter@gmail.com", "123456", 1, 4898584),
("Carly Simon", "carly@gmail.com", "123456", 1, 6273013),
("Dolly Parton", "dolly@gmail.com", "123456", 1, 16618011),
("Billy Joel", "billy@gmail.com", "123456", 1, 31997297),
("Elton John", "elton@gmail.com", "123456", 1, 48279659),
("Natalie Cole", "natalie@gmail.com", "123456", 1, 5425458),
("ABBA", "abba@gmail.com", "123456", 1, 33894249),
("Carpenters", "carpenters@gmail.com", "123456", 1, 6085029),
("John Lennon", "john@gmail.com", "123456", 1, 10926019),
("Brandi Carlile", "brandi@gmail.com", "123456", 1, 4241577);

INSERT INTO "albums" ("name") VALUES
("Vaults"),
("Growing Up Live"),
("These Are The Good Old Days"),
("Smoky Mountain DNA: Family, Faith and Fables"),
("The Bridge"),
("Who Believes In Angles"),
("Unforgettable With Love"),
("Voyage"),
("Christmas Once More"),
("Mind Games");

INSERT INTO "tracks" ("title", "album_id", "listens_count", "duration_in_mins", "release_year") VALUES
("Three kisses of love", 1, 276996, 2, 2022),
("Here comes the flood", 2, 600255, 5, 2019),
("Anticipation", 3, 9364277, 4, 2023),
("Introduction-Tennessee mountain home", 4, 83499, 4, 2024),
("Running on ice", 5, 1944506, 4, 1986),
("The rose of laura nyro", 6, 879746, 7, 2025),
("The very thought of you", 7, 20881034, 5, 1991),
("I still have faith in you", 8, 56728447, 6, 2021),
("It came upon a midnight clear", 9, 103505, 1, 2024),
("Mind games", 10, 45563361, 5, 1973);

INSERT INTO "tracks_by_artists" ("artist_id", "track_id", "type") VALUES
(1, 1, "primary"),
(2, 2, "primary"),
(3, 3, "primary"),
(4, 4, "primary"),
(5, 5, "primary"),
(6, 6, "primary"),
(11, 6, "primary"),
(7, 7, "primary"),
(8, 8, "primary"),
(9, 9, "primary"),
(10, 10, "primary");

INSERT INTO "users" ("first_name", "last_name", "username", "email", "password") VALUES
("Esraa", "Abduallah", "esraa.abduallah", "esraa@gmail.com", "123456"),
("Rachel", "Green", "rachel.green", "rachel@gmail.com", "123456"),
("Monica", "Geller", "monica.geller", "monica@gmail.com", "123456"),
("Pheobe", "Buffay", "pheobe.buffay", "pheobe@gmail.com", "123456"),
("Joey", "Tribbiani", "joey.tribbiani", "joey@gmail.com", "123456"),
("Chandler", "Bing", "chandler.bing", "chandler@gmail.com", "123456"),
("Ross", "Geller", "ross.geller", "ross@gmail.com", "123456"),
("Jerry", "Seinfeld", "jerry.seinfeld", "jerry@gmail.com", "123456"),
("Elaine", "Benes", "elaine.benes", "elaine@gmail.com", "123456"),
("Cosmo", "Kramer", "cosmo.kramer", "cosmo@gmail.com", "123456");

INSERT INTO "users_follows_artists" ("user_id", "artist_id") VALUES
(1, 2),
(2, 2),
(3, 3),
(4, 5),
(6, 4),
(5, 6),
(7, 7),
(8, 8),
(9, 10);

INSERT INTO "users_follows_users" ("follower_id", "following_id") VALUES
(1, 2),
(1, 3),
(2, 4),
(3, 1),
(4, 5),
(5, 7),
(6, 5),
(7, 6),
(3, 2),
(2, 3);

INSERT INTO "playlists" ("name", "creator_id", "description") VALUES
("Betoven", 1, "Lorem ipsum dolor sit amet consectetur adipiscing elit. Dolor sit amet consectetur adipiscing elit quisque faucibus."),
("Relaxing Music", 2, "Lorem ipsum dolor sit amet consectetur adipiscing elit. Dolor sit amet consectetur adipiscing elit quisque faucibus."),
("Musicals mix", 3, "Lorem ipsum dolor sit amet consectetur adipiscing elit. Dolor sit amet consectetur adipiscing elit quisque faucibus."),
("Music for studying / reading", 4, "Lorem ipsum dolor sit amet consectetur adipiscing elit. Dolor sit amet consectetur adipiscing elit quisque faucibus."),
("No lyrics just feelings", 5, "Lorem ipsum dolor sit amet consectetur adipiscing elit. Dolor sit amet consectetur adipiscing elit quisque faucibus."),
("Arabic classics", 6, "Lorem ipsum dolor sit amet consectetur adipiscing elit. Dolor sit amet consectetur adipiscing elit quisque faucibus."),
("No lyrics chill songs", 7, "Lorem ipsum dolor sit amet consectetur adipiscing elit. Dolor sit amet consectetur adipiscing elit quisque faucibus."),
("Tiktok hits", 8, "Lorem ipsum dolor sit amet consectetur adipiscing elit. Dolor sit amet consectetur adipiscing elit quisque faucibus."),
("Music to study", 9, "Lorem ipsum dolor sit amet consectetur adipiscing elit. Dolor sit amet consectetur adipiscing elit quisque faucibus."),
("Calm songs", 10, "Lorem ipsum dolor sit amet consectetur adipiscing elit. Dolor sit amet consectetur adipiscing elit quisque faucibus.");

INSERT INTO "users_save_playlists" ("user_id", "playlist_id") VALUES
(1, 2),
(1, 3),
(2, 1),
(3, 4),
(5, 2),
(6, 5),
(7, 4),
(8, 10),
(9, 8),
(10, 6);

INSERT INTO "playlists_tracks" ("track_id", "playlist_id", "date_added") VALUES
(1, 1, "2025-03-02"),
(2, 2, "2024-05-20"),
(3, 3, "2020-10-02"),
(4, 4, "2021-12-31"),
(5, 5, "2025-03-05"),
(6, 6, "2019-06-18"),
(7, 7, "2020-10-30"),
(8, 8, "2020-07-15"),
(9, 9, "2022-02-22"),
(10, 10, "2025-05-05");

INSERT INTO "categories" ("name") VALUES
("Educational"),
("Technology"),
("Design"),
("Culture"),
("History"),
("Health"),
("Society"),
("Language"),
("Careers"),
("How-to");

INSERT INTO "podcasts" ("name", "about", "rating", "owner_id") VALUES
("TED Talks daily", "Lorem ipsum dolor sit amet consectetur adipiscing elit. Dolor sit amet consectetur adipiscing elit quisque faucibus.", 4.6, 1),
("The Mel Robbins Podcast", "Lorem ipsum dolor sit amet consectetur adipiscing elit. Dolor sit amet consectetur adipiscing elit quisque faucibus.", 4.8, 2),
("6 minute English", "Lorem ipsum dolor sit amet consectetur adipiscing elit. Dolor sit amet consectetur adipiscing elit quisque faucibus.", 4.9, 3),
("Speak better English with Harry", "Lorem ipsum dolor sit amet consectetur adipiscing elit. Dolor sit amet consectetur adipiscing elit quisque faucibus.", 4.8, 4),
("Think fast talk smart: communication techniques", "Lorem ipsum dolor sit amet consectetur adipiscing elit. Dolor sit amet consectetur adipiscing elit quisque faucibus.", 4.7, 5),
("ABtalks", "Lorem ipsum dolor sit amet consectetur adipiscing elit. Dolor sit amet consectetur adipiscing elit quisque faucibus.", 4.9, 6),
("The Joe Rogan experience", "Lorem ipsum dolor sit amet consectetur adipiscing elit. Dolor sit amet consectetur adipiscing elit quisque faucibus.", 4.7, 7),
("Global news podcast", "Lorem ipsum dolor sit amet consectetur adipiscing elit. Dolor sit amet consectetur adipiscing elit quisque faucibus.", 4.7, 8),
("The psychology of your 20s", "Lorem ipsum dolor sit amet consectetur adipiscing elit. Dolor sit amet consectetur adipiscing elit quisque faucibus.", 4.8, 9),
("Slow German podcast for beginners (A1-B1)", "Lorem ipsum dolor sit amet consectetur adipiscing elit. Dolor sit amet consectetur adipiscing elit quisque faucibus.", 5, 10);

INSERT INTO "podcasts_categories" ("podcast_id", "category_id") VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 6),
(2, 7),
(3, 1),
(4, 1),
(4, 8),
(5, 9),
(5, 10),
(6, 4),
(6, 7),
(7, 4),
(7, 7),
(10, 8);

INSERT INTO "episodes" ("podcast_id", "title", "description", "date_streamed", "duration_in_mins") VALUES
(1, "The future isn't just coded--It's built|Lauren Dunford", "Lorem ipsum dolor sit amet consectetur adipiscing elit. Dolor sit amet consectetur adipiscing elit quisque faucibus.", "2025-05-28", 17),
(2, "The to stopping anxiety&fear(That actually works)", "Lorem ipsum dolor sit amet consectetur adipiscing elit. Dolor sit amet consectetur adipiscing elit quisque faucibus.", "2025-05-26", 70),
(3, "Foods that go crunch", "Lorem ipsum dolor sit amet consectetur adipiscing elit. Dolor sit amet consectetur adipiscing elit quisque faucibus.", "2025-05-22", 7),
(4, "Speak better English with Harry|Episode 537", "Lorem ipsum dolor sit amet consectetur adipiscing elit. Dolor sit amet consectetur adipiscing elit quisque faucibus.", "2025-05-28", 14),
(5, "205.Say what sucks:Catalyzing organizational change with AI", "Lorem ipsum dolor sit amet consectetur adipiscing elit. Dolor sit amet consectetur adipiscing elit quisque faucibus.", "2025-05-27", 42),
(6, "#ABTalks untold stories with Alicia Nicholas|Story 17", "Lorem ipsum dolor sit amet consectetur adipiscing elit. Dolor sit amet consectetur adipiscing elit quisque faucibus.", "2025-05-20", 95),
(7, "#2327-AJGentile", "Lorem ipsum dolor sit amet consectetur adipiscing elit. Dolor sit amet consectetur adipiscing elit quisque faucibus.", "2025-05-27", 173),
(8, "Germany promises Ukraine long-range missiles to fight Russia", "Lorem ipsum dolor sit amet consectetur adipiscing elit. Dolor sit amet consectetur adipiscing elit quisque faucibus.", "2025-05-28", 36),
(9, "299.The psychology of emotionally immature parents", "Lorem ipsum dolor sit amet consectetur adipiscing elit. Dolor sit amet consectetur adipiscing elit quisque faucibus.", "2025-05-27", 73),
(10, "Episode 1 sich vorstellen", "Lorem ipsum dolor sit amet consectetur adipiscing elit. Dolor sit amet consectetur adipiscing elit quisque faucibus.", "2023-01-6", 5);

INSERT INTO "users_follows_podcasts" ("user_id", "podcast_id") VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 3),
(5, 4),
(6, 5),
(7, 8),
(8, 9),
(9, 10);

INSERT INTO "users_likes_tracks" ("user_id", "track_id") VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 3),
(5, 4),
(6, 5),
(7, 8),
(8, 9),
(9, 10);

INSERT INTO "users_episodes" ("user_id", "episode_id") VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 3),
(5, 4),
(6, 5),
(7, 8),
(8, 9),
(9, 10);

INSERT INTO "tours" ("concert_time", "location") VALUES
("2025-08-22 20:00", "Agua Caliente Resort Casino Spa Rancho Mirage"),
("2025-06-10 20:00", "PARIS 08 | PLEYEL ROOM");

INSERT INTO "genres" ("name") VALUES
("new age"),
("soundtrack"),
("arena rock");

INSERT INTO "tours_genres" ("tour_id", "genre_id") VALUES
(1, 1),
(1, 2),
(2, 3);

INSERT INTO "artists_tours" ("artist_id", "tour_id") VALUES
(3, 1),
(6, 2);

INSERT INTO "tickets_links" ("link", "tour_id") VALUES
("https://www.bandsintown.com/e/1035391751?app_id=spt_feed&came_from=281&utm_medium=web&utm_source=spt_feed&utm_campaign=event", 1),
("https://www.fnacspectacles.com/event/the-billy-joel-songbook-hommage-salle-pleyel-paris-08-19783129/?affiliate=QLC&utm_source=QLC&utm_medium=dp&utm_campaign=spotify&clickref=1011lBjnVTgF", 2);

INSERT INTO "users_tours" ("user_id", "tour_id") VALUES
(1, 1),
(2, 2),
(3, 1),
(4, 2),
(5, 1),
(6, 2);

---------------------------------------------------------------------------------------------------------------------
-- Most used SELECT queries for spotify
-- Selecting all playlists from the view
SELECT * FROM "homepage_playlists";

-- Loading latest podcast episodes
SELECT * FROM "latest_podcasts_episodes";

-- Loading new songs release
SELECT * FROM "new_releases";

-- Get an artist's most popular tracks
SELECT "tracks"."title", "tracks"."listens_count", "tracks"."duration_in_mins" FROM "artists"
JOIN "tracks_by_artists" ON "artists"."id" = "tracks_by_artists"."artist_id"
JOIN "tracks" ON "tracks_by_artists"."track_id" = "tracks"."id"
WHERE "artists"."id" = 9
ORDER BY "tracks"."listens_count" DESC
LIMIT 5;

-- Get an artist's latest albums
SELECT "albums"."name", MIN("tracks"."release_year") AS "album_release_year" FROM "albums"
JOIN "tracks" ON "albums"."id" = "tracks"."album_id"
JOIN "tracks_by_artists" ON "tracks"."id" = "tracks_by_artists"."track_id"
JOIN "artists" ON "tracks_by_artists"."artist_id" = "artists"."id"
WHERE "artists"."id" = 2
GROUP BY "albums"."id"
ORDER BY "album_release_year" DESC;

-- Get user saved playlists
SELECT "creators"."username" AS "creator", "playlists"."name" FROM "users" AS "creators"
JOIN "playlists" ON "creators"."id" = "playlists"."creator_id"
JOIN "users_save_playlists" ON "playlists"."id" = "users_save_playlists"."playlist_id"
JOIN "users" AS "savers" ON "users_save_playlists"."user_id" = "savers"."id";

-- Get artists followed by a specific user
SELECT "name","image_url" FROM "artists"
WHERE "id" IN (
    SELECT "artist_id" FROM "users_follows_artists"
    WHERE "user_id" = 1
);

-- Get playlists songs
SELECT "tracks"."title", "artists"."name" AS "artist", "albums"."name" AS "album", "playlists_tracks"."date_added", "tracks"."duration_in_mins" FROM "tracks"
JOIN "tracks_by_artists" ON "tracks"."id" = "tracks_by_artists"."track_id"
JOIN "artists" ON "tracks_by_artists"."artist_id" = "artists"."id"
JOIN "albums" ON "tracks"."album_id" = "albums"."id"
JOIN "playlists_tracks" ON "tracks"."id" = "playlists_tracks"."track_id"
WHERE "playlists_tracks"."playlist_id" = 1;

-- Get album songs
SELECT "title", "duration_in_mins", "artists"."name" AS "artist" FROM "tracks"
JOIN "tracks_by_artists" ON "tracks"."id" = "tracks_by_artists"."track_id"
JOIN "artists" ON "tracks_by_artists"."artist_id" = "artists"."id"
WHERE "album_id" = 1;

-- Get album statitics
SELECT MIN("release_year") AS "release_year", COUNT("tracks"."id") AS "num_songs", SUM("duration_in_mins") AS "duration" FROM "tracks"
GROUP BY "album_id"
HAVING "album_id" = 1;

-- GET podcast episodes
SELECT "title", "description", "date_streamed", "duration_in_mins" FROM "episodes"
WHERE "podcast_id" = 1;

-- GET podcast info
SELECT "podcasts"."name" AS "podcast name", "users"."username" AS "owner", "about", "rating", "categories"."name" AS "category" FROM "podcasts"
JOIN "users" ON "podcasts"."owner_id" = "users"."id"
JOIN "podcasts_categories" ON "podcasts"."id" = "podcasts_categories"."podcast_id"
JOIN "categories" ON "podcasts_categories"."category_id" = "categories"."id"
WHERE "podcasts"."id" = 1;

-- GET User saved episodes
SELECT "episodes"."title", "podcasts"."name", "episodes"."description", "episodes"."date_streamed", "episodes"."duration_in_mins" FROM "episodes"
JOIN "podcasts" ON "episodes"."podcast_id" = "podcasts"."id"
WHERE "episodes"."id" IN (
    SELECT "episode_id" FROM "users_episodes"
    WHERE "user_id" = 1
);


-- GET artist tours
SELECT "concert_time", "location", "artists"."name" AS "tour artist" FROM "tours"
JOIN "artists_tours" ON "tours"."id" = "artists_tours"."tour_id"
JOIN "artists" ON "artists_tours"."artist_id" = "artists"."id"
WHERE "artist_id" = 3;

-- GET tour details
SELECT "concert_time", "artists"."name" AS "tour artist", "genres"."name" AS "genre", "location", "link"
FROM "tours"
JOIN "artists_tours" ON "tours"."id" = "artists_tours"."tour_id"
JOIN "artists" ON "artists_tours"."artist_id" = "artists"."id"
JOIN "tours_genres" ON "tours"."id" = "tours_genres"."tour_id"
JOIN "genres" ON "tours_genres"."genre_id" = "genres"."id"
JOIN "tickets_links" ON "tours"."id" = "tickets_links"."tour_id"
WHERE "tours"."id" = 1;

-- GET user liked songs
SELECT "tracks"."title", "artists"."name" AS "artist", "albums"."name" AS "album", "tracks"."duration_in_mins" FROM "tracks"
JOIN "tracks_by_artists" ON "tracks"."id" = "tracks_by_artists"."track_id"
JOIN "artists" ON "tracks_by_artists"."artist_id" = "artists"."id"
JOIN "albums" ON "tracks"."album_id" = "albums"."id"
WHERE "tracks"."id" IN (
    SELECT "track_id" FROM "users_likes_tracks"
    WHERE "user_id" = 1
);

-- GET tours that the user is interested in
SELECT "concert_time", "location", "artists"."name" AS "tour artist" FROM "tours"
JOIN "artists_tours" ON "tours"."id" = "artists_tours"."tour_id"
JOIN "artists" ON "artists_tours"."artist_id" = "artists"."id"
WHERE "tours"."id" IN (
    SELECT "tour_id" FROM "users_tours"
    WHERE "user_id" = 1
);
-------------------------------------------------------------------------------------------------------------------
-- Common update queries for the database

-- Update user profile picture
UPDATE "users" SET "image_url" = 'https://th.bing.com/th/id/R.6d49b3938942786c9bb0c3aa4aa2ff3d?rik=PpqmwEX%2fcgzdUw&riu=http%3a%2f%2fgetwallpapers.com%2fwallpaper%2ffull%2f5%2ff%2f0%2f11925.jpg&ehk=3RE%2bFW7y7e%2ffzvMEwqHpE73Y%2bf1cng5rBf3gG9pBGq8%3d&risl=&pid=ImgRaw&r=0'
WHERE "id" = 1;

-- Update user email
UPDATE "users" SET "email" = 'esraa123@gmail.com'
WHERE "id" = 1;

-- update playlist details
UPDATE "playlists" SET "name" = 'Beethoven', "description" = 'Classical music', "image_url" = 'https://th.bing.com/th/id/R.e47fe9f4be92dbe7842caba408ffdd0c?rik=2pGtpw4Nymz5Bg&pid=ImgRaw&r=0'
WHERE "id" = 1;

-- user subscribed to premium account
UPDATE "users" SET "premium" = 1
WHERE "id" = 1;

-- Remove track from an album
UPDATE "tracks" SET "album_id" = NULL
WHERE "id" = 1;
--------------------------------------------------------------------------------------------------------------------
-- Common Delete queries for the database

-- DELETE a playlist
DELETE FROM "playlists" WHERE "id" = 10;

-- DELETE a playlist from saved playlists
DELETE FROM "users_save_playlists" WHERE "user_id" = 1 AND "playlist_id" = 3;

-- Unfollow artist
DELETE FROM "users_follows_artists" WHERE "user_id" = 1 AND "artist_id" = 2;

-- Unfollow user
DELETE FROM "users_follows_users" WHERE "follower_id" = 1 AND "following_id" = 3;

-- Remove episode from user episodes
DELETE FROM "users_episodes" WHERE "user_id" = 1 AND "episode_id" = 1;

-- Unlike song
DELETE FROM "users_likes_tracks" WHERE "user_id" = 1 AND "track-id" = 1;

-- Remove a tour from user events
DELETE FROM "users_tours" WHERE "user_id" = 1 AND "tour_id" = 1;



