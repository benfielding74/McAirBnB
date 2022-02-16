DROP TABLE IF EXISTS homes;
      DROP TABLE IF EXISTS bookings;

      CREATE TABLE homes(
        home_id INT GENERATED ALWAYS AS IDENTITY,
        name VARCHAR(60),
        description VARCHAR(255),
        price VARCHAR(8),
        PRIMARY KEY(home_id)
        );

        CREATE TABLE bookings(
          booking_id INT GENERATED ALWAYS AS IDENTITY,
          home_id INT,
          start_date DATE, 
          end_date DATE,
          PRIMARY KEY(booking_id),
          CONSTRAINT fk_home
              FOREIGN KEY(home_id) 
            REFERENCES homes(home_id)
        );

        INSERT INTO homes (name, description, price) VALUES('example_name', 'example_description', '9.99');
        INSERT INTO bookings (start_date, end_date) VALUES('2022-04-03', '2022-04-07');