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
   NOW(), 'Broadway St, San Antonio'),
  (2, 'Need Help Moving Out',
   'I\'m moving across town and need some movers. Call me for the address and details. One day, $100 for the afternoon',
   NOW(), 'Austin, TX'),
  (2, 'Need To Learn to Dance? I\'m the best around!',
   'Will be doing private lessons at my studio on weekends. If you are interested in styles and session info, call me anytime.',
   NOW(), 'Austin, TX'),
  (1, 'Cheap Used Computers',
   'I have a stock of old school computers I need to get rid of. Compete tower/monitor setups for $100 flat. You must pick up. Various specs, so email if you need something specific',
   NOW(), 'San Antonio, TX'),
  (3, 'Coffee Maker For Sale',
   'Barely used coffee machine, I bought a new one last week I like better. $75 or best offer',
   NOW(), 'San Antonio, TX'),
  (1, 'Looking for blank canvases',
   'looking for blank canvases for painting. can have a little damage or paint on them. size doesn\'t matter',
   NOW(), 'San Antonio, TX');

SELECT *
FROM ads;


INSERT INTO ads_categories (ads_id, ads_category_id) VALUES
  (1, 2), (2, 8), (3, 3), (4, 5), (4, 7), (5, 1), (5, 3), (6, 6), (7, 8), (7, 3), (8, 1), (8, 3);

# SELECT to check if ads are being linked to ad_category ids correctly
SELECT
  ads.title,
  categories.category
FROM ads
  JOIN ads_categories ON ads.id = ads_categories.ads_id
  JOIN categories ON ads_categories.ads_category_id = categories.id
ORDER BY ads.title;
