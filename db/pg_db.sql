# https://dbdiagram.io/d/68f9cd92357668b732387a54

CREATE TABLE "posts" (
  "post_id" uuid PRIMARY KEY,
  "author_id" uuid NOT NULL,
  "title" text NOT NULL,
  "content" text NOT NULL,
  "image_urls" text[],
  "location_id" bigint,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp NOT NULL,
);

CREATE TABLE "comments" (
  "comment_id" uuid PRIMARY KEY,
  "post_id" uuid NOT NULL,
  "author_id" uuid NOT NULL,
  "content" text NOT NULL,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp NOT NULL,
);

CREATE TABLE "locations" (
  "location_id" bigserial PRIMARY KEY,
  "tag" text NOT NULL,
  "location_lat" numeric(12,9) NOT NULL,
  "location_lon" numeric(12,9) NOT NULL
);

CREATE TABLE "ratings" (
  "rating_id" uuid PRIMARY KEY,
  "post_id" uuid NOT NULL,
  "user_id" uuid NOT NULL,
  "rating" int2 NOT NULL,
  "created_at" timestamp NOT NULL
);

CREATE TABLE "rating_agg" (
  "post_id" uuid PRIMARY KEY,
  "sum_rating" int NOT NULL,
  "count_rating" int NOT NULL
);

CREATE TABLE "users" (
  "user_id" uuid PRIMARY KEY,
  "username" string NOT NULL
);

CREATE TABLE "subscriptions" (
  "subscriber_id" uuid,
  "user_id" uuid,
  PRIMARY KEY ("subscriber_id", "user_id")
);

COMMENT ON COLUMN "posts"."content" IS 'Content of the post 2000 chars';

COMMENT ON COLUMN "comments"."content" IS 'Content of the comments 500 chars';

ALTER TABLE "comments" ADD CONSTRAINT "posts_coments" FOREIGN KEY ("post_id") REFERENCES "posts" ("post_id");

ALTER TABLE "locations" ADD FOREIGN KEY ("location_id") REFERENCES "posts" ("location_id");

ALTER TABLE "ratings" ADD FOREIGN KEY ("post_id") REFERENCES "posts" ("post_id");

ALTER TABLE "rating_agg" ADD FOREIGN KEY ("post_id") REFERENCES "posts" ("post_id");

ALTER TABLE "posts" ADD FOREIGN KEY ("author_id") REFERENCES "users" ("user_id");

ALTER TABLE "comments" ADD FOREIGN KEY ("author_id") REFERENCES "users" ("user_id");

ALTER TABLE "subscriptions" ADD FOREIGN KEY ("subscriber_id") REFERENCES "users" ("user_id");

ALTER TABLE "subscriptions" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("user_id");

ALTER TABLE "ratings" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("user_id");