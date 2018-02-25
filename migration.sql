USE treasure_db;

DROP TABLE IF EXISTS ads_categories;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS ads;
DROP TABLE IF EXISTS users;

CREATE TABLE IF NOT EXISTS users (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(240) UNIQUE NOT NULL,
    email VARCHAR(240) NOT NULL,
    password VARCHAR(255) NOT NULL,
    bio VARCHAR(255) NULL,
    location VARCHAR(255) NULL,
#     register_date DATE NULL,
  # we need to write java code that will automatically
  # time stamp the date the user's profile is created
    PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS ads (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    img_name VARCHAR(225),
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    price INT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS categories (
   id INT UNSIGNED NOT NULL AUTO_INCREMENT,
   category VARCHAR(255) NOT NULL,
   UNIQUE (category),
   PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS ads_categories (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  ads_id INT UNSIGNED NOT NULL,
  ads_category_id INT UNSIGNED NOT NULL,
  UNIQUE (ads_id, ads_category_id),
  PRIMARY KEY (id),
  FOREIGN KEY (ads_id) REFERENCES ads (id),
  FOREIGN KEY (ads_category_id) REFERENCES categories (id)
);
