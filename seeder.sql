USE treasure_db;

# setting categories
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE categories;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO categories (classification)

    VALUES
      ('antiques'),
      ('appliances'),
      ('books'),
      ('movies'),
      ('clothes'),
      ('music'),
      ('electronics'),
      ('household'),
      ('furniture'),
      ('outdoor'),
      ('garden'),
      ('pets'),
      ('toys'),
      ('children'),
      ('sports'),
      ('instruments'),
      ('automobiles')

