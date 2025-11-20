CREATE TABLE "movies" (
  "id" serial PRIMARY KEY,
  "title" varchar NOT NULL,
  "synopsis" varchar,
  "length" integer,
  "release_date" date,
  "genre_id" integer,
  "poster_url" varchar,
  "rating" float,
  "created_at" timestamp,
  "updated_at" timestamp,
  "is_published" boolean,
  "file_key" varchar
);

CREATE TABLE "shows" (
  "id" serial PRIMARY KEY,
  "title" varchar NOT NULL,
  "synopsis" varchar,
  "seasons_num" integer,
  "release_date" date,
  "genre_id" integer,
  "poster_url" varchar,
  "rating" float,
  "created_at" timestamp,
  "updated_at" timestamp,
  "is_published" boolean
);

CREATE TABLE "episodes" (
  "id" serial PRIMARY KEY,
  "title" varchar NOT NULL,
  "synopsis" varchar,
  "season_num" integer,
  "episode_num" integer,
  "length" integer,
  "release_date" date,
  "show_id" integer,
  "file_key" varchar
);

CREATE TABLE "directors" (
  "id" serial PRIMARY KEY,
  "name" varchar NOT NULL,
  "birth" date
);

CREATE TABLE "genres" (
  "id" serial PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "actors" (
  "id" serial PRIMARY KEY,
  "name" varchar NOT NULL,
  "birth" date
);

CREATE TABLE "users" (
  "id" serial PRIMARY KEY,
  "username" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "password_hash" varchar NOT NULL,
  "signup_date" date,
  "updated_at" date,
  "role" varchar NOT NULL
);

CREATE TABLE "favourites" (
  "id" serial PRIMARY KEY,
  "user_id" integer NOT NULL,
  "movie_id" integer,
  "show_id" integer
);

CREATE TABLE "watch_history" (
  "id" serial PRIMARY KEY,
  "user_id" integer NOT NULL,
  "movie_id" integer,
  "episode_id" integer,
  "watch_date" timestamp,
  "progress" integer
);

ALTER TABLE "movies" ADD FOREIGN KEY ("genre_id") REFERENCES "genres" ("id");

ALTER TABLE "shows" ADD FOREIGN KEY ("genre_id") REFERENCES "genres" ("id");

ALTER TABLE "episodes" ADD FOREIGN KEY ("show_id") REFERENCES "shows" ("id");

ALTER TABLE "favourites" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "favourites" ADD FOREIGN KEY ("movie_id") REFERENCES "movies" ("id");

ALTER TABLE "favourites" ADD FOREIGN KEY ("show_id") REFERENCES "shows" ("id");

ALTER TABLE "watch_history" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "watch_history" ADD FOREIGN KEY ("movie_id") REFERENCES "movies" ("id");

ALTER TABLE "watch_history" ADD FOREIGN KEY ("episode_id") REFERENCES "episodes" ("id");

CREATE TABLE "movies_directors" (
  "movies_id" serial,
  "directors_id" serial,
  PRIMARY KEY ("movies_id", "directors_id")
);

ALTER TABLE "movies_directors" ADD FOREIGN KEY ("movies_id") REFERENCES "movies" ("id");

ALTER TABLE "movies_directors" ADD FOREIGN KEY ("directors_id") REFERENCES "directors" ("id");


CREATE TABLE "shows_directors" (
  "shows_id" serial,
  "directors_id" serial,
  PRIMARY KEY ("shows_id", "directors_id")
);

ALTER TABLE "shows_directors" ADD FOREIGN KEY ("shows_id") REFERENCES "shows" ("id");

ALTER TABLE "shows_directors" ADD FOREIGN KEY ("directors_id") REFERENCES "directors" ("id");


CREATE TABLE "movies_actors" (
  "movies_id" serial,
  "actors_id" serial,
  PRIMARY KEY ("movies_id", "actors_id")
);

ALTER TABLE "movies_actors" ADD FOREIGN KEY ("movies_id") REFERENCES "movies" ("id");

ALTER TABLE "movies_actors" ADD FOREIGN KEY ("actors_id") REFERENCES "actors" ("id");


CREATE TABLE "shows_actors" (
  "shows_id" serial,
  "actors_id" serial,
  PRIMARY KEY ("shows_id", "actors_id")
);

ALTER TABLE "shows_actors" ADD FOREIGN KEY ("shows_id") REFERENCES "shows" ("id");

ALTER TABLE "shows_actors" ADD FOREIGN KEY ("actors_id") REFERENCES "actors" ("id");

INSERT INTO "users" (
  "username", 
  "email", 
  "password_hash", 
  "signup_date", 
  "updated_at", 
  "role"
) 
VALUES (
  'administrador', 
  'admin@example.com', 
  '$pbkdf2-sha512$160000$33Ae5GEg5gO7hDMlRyCDUw$0ZNZTjZp2FnSvxq130kanKvD1PVP3KoDLcjyPWyUjcDblck6vCjFNOWjNJ98bYo4FVD8KOtLM/VIvC8KbDp8HQ', /*12345*/
  CURRENT_DATE, 
  CURRENT_DATE, 
  'admin'
);