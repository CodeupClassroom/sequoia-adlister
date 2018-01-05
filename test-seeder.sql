USE adlister_db;

# THIS SEEDER PUTS IN NON-HASHED PASSWORDS !!!

TRUNCATE ads_categories;
TRUNCATE category_list;
TRUNCATE ads;
TRUNCATE users;

INSERT INTO users (username, email, password, register_date, location, phone, bio)
VALUES (
  'pizzaDude',
  'steve@email.com',
  'password',
  CURDATE(),
  'San Antonio, TX',
  '210-555-5550',
  NULL
), (
  'podaho',
  'po@email.com',
  'password2',
  CURDATE(),
  'San Antonio, TX',
  '210-555-5551',
  'Loves Breakfast'
), (
  'Luke',
  'luke@email.com',
  'password3',
  curdate(),
  'San Antonio, TX',
  '210-555-5552',
  'Sell All The Things'
);

SELECT *
FROM users;


INSERT INTO category_list (category) VALUES
  ('Community'),
  ('For Sale'),
  ('Personals'),
  ('Discussion Forum'),
  ('Housing'),
  ('Jobs'),
  ('Gigs'),
  ('Services');


INSERT INTO ads (user_id, title, description, date_created, date_updated, ad_location, active) VALUES
  (1, 'Yellow Labrador For Sale!',
   'This furry boy is a loyal companion who just needs to go to a bigger home. Has all his shots and is house trained! Asking for $1500 because he is such a great dog',
   NOW(), NULL, 'San Antonio, TX', TRUE),
  (2, 'Landscape Dude here to service your lawn!',
   'Need your lawn mowed? Bush trimmed? I\'m your man! Call me now for a free no-hassle quote!', NOW(), NULL,
   'San Antonio and surrounding areas', TRUE),
  (3, 'Free Hugs',
   'Need a hug? Downright sick and tired of not being embraced for a moment? Don\'t wait another second, call me right now and I will be there faster than you can say "Snuggle time!"',
   NOW(), NULL, 'Broadway St, San Antonio', FALSE);

SELECT *
FROM ads;


INSERT INTO ads_categories (ads_id, ads_category_id) VALUES
  (1, 2), (2, 8), (3, 3);


