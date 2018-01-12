DROP DATABASE IF EXISTS adlister_db;
CREATE DATABASE IF NOT EXISTS adlister_db;
USE adlister_db;

DROP TABLE IF EXISTS ad_category;
DROP TABLE IF EXISTS ads;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS users;

CREATE TABLE IF NOT EXISTS categories (
  id       INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  category VARCHAR(255),
  PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS users (
  id       INT UNSIGNED NOT NULL AUTO_INCREMENT,
  username VARCHAR(240) NOT NULL,
  email    VARCHAR(240) NOT NULL,
  password VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS ads (
  id          INT UNSIGNED NOT NULL AUTO_INCREMENT,
  user_id     INT UNSIGNED NOT NULL,
  title       VARCHAR(240) NOT NULL,
  description TEXT         NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users (id)
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS ad_category (
  ads_id INTEGER UNSIGNED NOT NULL,
  cat_id INTEGER UNSIGNED NOT NULL,
  FOREIGN KEY (ads_id) REFERENCES ads (id),
  FOREIGN KEY (cat_id) REFERENCES categories (id)
);

INSERT INTO categories (category)
VALUES ('Electronics'),
  ('Clothing'),
  ('Furniture'),
  ('Service'),
  ('Babies & Toys'),
  ('Appliances'),
  ('Garden & Patio'),
  ('Automotive'),
  ('Farm Animals'),
  ('Home'),
  ('Other');
