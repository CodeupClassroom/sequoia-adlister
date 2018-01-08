USE adlister_db;

# THIS SEEDER PUTS IN NON-HASHED PASSWORDS !!!

TRUNCATE ads_categories;
TRUNCATE categories;
TRUNCATE ads;
TRUNCATE user_info;
TRUNCATE users;

INSERT INTO users (username, email, password)
VALUES (
  'pizzaDude',
  'steve@email.com',
  'password'
), (
  'podaho',
  'po@email.com',
  'password2'
), (
  'Luke',
  'luke@email.com',
  'password3'
);

INSERT INTO user_info (user_id, bio, location, register_date, phone_number) VALUES (
  1,
  'i am steve',
  'San Antonio, TX',
  CURDATE(),
  '210-555-5550'
), (
  2,
  'i am po',
  'San Antonio, TX',
  CURDATE(),
  '210-555-5551'
), (
  3,
  'i am luke',
  'San Antonio, TX',
  CURDATE(),
  '210-555-5552'
);

SELECT *
FROM users;


INSERT INTO categories (category) VALUES
  ('Community'),
  ('For Sale'),
  ('Personals'),
  ('Discussion Forum'),
  ('Housing'),
  ('Jobs'),
  ('Gigs'),
  ('Services');


INSERT INTO ads (user_id, title, description, date_created, ad_location) VALUES
  (1, 'Yellow Labrador For Sale!',
   'This furry boy is a loyal companion who just needs to go to a bigger home. Has all his shots and is house trained! Asking for $1500 because he is such a great dog',
   NOW(), 'San Antonio, TX'),
  (2, 'Landscape Dude here to service your lawn!',
   'Need your lawn mowed? Bush trimmed? I\'m your man! Call me now for a free no-hassle quote!', NOW(),
   'San Antonio and surrounding areas'),
  (3, 'Free Hugs',
   'Need a hug? Downright sick and tired of not being embraced for a moment? Don\'t wait another second, call me right now and I will be there faster than you can say "Snuggle time!"',
   NOW(), 'Broadway St, San Antonio');

SELECT *
FROM ads;


INSERT INTO ads_categories (ads_id, ads_category_id) VALUES
  (1, 2), (2, 8), (3, 3);


