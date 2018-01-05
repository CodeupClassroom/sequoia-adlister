USE adlister_db;

DROP TABLE IF EXISTS ads_categories;
DROP TABLE IF EXISTS category_list;
DROP TABLE IF EXISTS ads;
DROP TABLE IF EXISTS users;

CREATE TABLE IF NOT EXISTS users (
  id            INT UNSIGNED NOT NULL AUTO_INCREMENT,
  username      VARCHAR(240) NOT NULL,
  email         VARCHAR(240) NOT NULL,
  password      VARCHAR(255) NOT NULL,
  register_date DATE         NOT NULL,
  location      VARCHAR(255) NOT NULL,
  phone         VARCHAR(20),
  bio           TEXT,
  PRIMARY KEY (id)
);

# could take some of user info to a new table for better performance, eg stuff only needed on profile page but not ad page

CREATE TABLE IF NOT EXISTS ads (
  id           INT UNSIGNED NOT NULL AUTO_INCREMENT,
  user_id      INT UNSIGNED NOT NULL,
  title        VARCHAR(240) NOT NULL,
  description  TEXT         NOT NULL,
  date_created DATETIME     NOT NULL,
  date_updated DATETIME,
  ad_location  VARCHAR(255),
  active       BOOLEAN,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users (id)
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS category_list (
  id       INT UNSIGNED NOT NULL AUTO_INCREMENT,
  category VARCHAR(250) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS ads_categories (
  id              INT UNSIGNED NOT NULL AUTO_INCREMENT,
  ads_id          INT UNSIGNED NOT NULL,
  ads_category_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (ads_id) REFERENCES ads (id),
  FOREIGN KEY (ads_category_id) REFERENCES category_list (id)
);

SHOW DATABASES;