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