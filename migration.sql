USE adlister_db;

DROP TABLE IF EXISTS ads;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS catagories;

CREATE TABLE users (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(240) NOT NULL UNIQUE,
    email VARCHAR(240) NOT NULL,
    password VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE ads (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    title VARCHAR(240) NOT NULL,
    description TEXT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE CASCADE
);

CREATE TABLE categories (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    title VARCHAR(255),
    PRIMARY KEY (id)
);

CREATE TABLE categories_ads(
    categories_id INTEGER UNSIGNED NOT NULL,
    ads_id INTEGER UNSIGNED NOT NULL,
    FOREIGN KEY (categories_id) REFERENCES categories(id),
    FOREIGN KEY (ads_id) REFERENCES ads(id)
);

INSERT INTO categories(title) VALUE
    ('For Sale'),
    ('Free Stuff'),
    ('Services'),
    ('Jobs'),
    ('Personals'),
    ('Gigs'),
    ('Housing'),
    ('Electronics');


