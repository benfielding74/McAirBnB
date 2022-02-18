# frozen_string_literal: true

require 'pg'

namespace :init do
  task all: %i[create_db create_db_test]

  task :create_db do
    connection = PG.connect
    connection.exec('CREATE DATABASE mcairbnb;')
  end

  task :create_db_test do
    connection = PG.connect
    connection.exec('CREATE DATABASE mcairbnb_test;')
  end
end

namespace :users do
  task all: %i[setup_users seed_users setup_users_test seed_users_test]

  task :setup_users do
    connection = PG.connect dbname: 'mcairbnb'
    connection.exec('CREATE TABLE users(id SERIAL PRIMARY KEY, name VARCHAR(60), password VARCHAR(60));')
  end

  task :seed_users do
    connection = PG.connect dbname: 'mcairbnb'
    connection.exec("INSERT INTO users (name, password) VALUES ('example_user', 'example_password');")
  end

  task :setup_users_test do
    connection = PG.connect dbname: 'mcairbnb_test'
    connection.exec('CREATE TABLE users(id SERIAL PRIMARY KEY, name VARCHAR(60), password VARCHAR(60));')
  end

  task :seed_users_test do
    connection = PG.connect dbname: 'mcairbnb_test'
    connection.exec("INSERT INTO users (name, password) VALUES ('example_user', 'example_password');")
  end
end

namespace :homes do
  task all: %i[setup_homes seed_homes setup_homes_test seed_homes_test]

  task :setup_homes do
    connection = PG.connect dbname: 'mcairbnb'
    connection.exec('CREATE TABLE homes(home_id INT GENERATED ALWAYS AS IDENTITY, name VARCHAR(60), description VARCHAR(255), price VARCHAR(8), PRIMARY KEY(home_id));')
  end

  task :seed_homes do
    connection = PG.connect dbname: 'mcairbnb'
    connection.exec("INSERT INTO homes(name, description, price) VALUES ('example_name', 'example_description', '9.99');")
  end

  task :setup_homes_test do
    connection = PG.connect dbname: 'mcairbnb_test'
    connection.exec('CREATE TABLE homes(home_id SERIAL PRIMARY KEY, name VARCHAR(60), description VARCHAR(255), price VARCHAR(8));')
  end

  task :seed_homes_test do
    connection = PG.connect dbname: 'mcairbnb_test'
    connection.exec("INSERT INTO homes(name, description, price) VALUES ('example_name', 'example_description', '9.99');")
  end
end

namespace :bookings do
  task all: %i[setup_bookings seed_bookings setup_bookings_test seed_bookings_test]

  task :setup_bookings do
    connection = PG.connect dbname: 'mcairbnb'
    connection.exec('CREATE TABLE bookings(booking_id INT GENERATED ALWAYS AS IDENTITY, home_id INT, start_date DATE, end_date DATE, PRIMARY KEY(booking_id), CONSTRAINT fk_home FOREIGN KEY(home_id) REFERENCES homes(home_id));')
  end

  task :seed_bookings do
    connection = PG.connect dbname: 'mcairbnb'
    connection.exec('TRUNCATE TABLE bookings')
    connection.exec("INSERT INTO bookings (start_date, end_date) VALUES ('2022-04-03', '2022-04-07');")
  end

  task :setup_bookings_test do
    connection = PG.connect dbname: 'mcairbnb_test'
    connection.exec('CREATE TABLE bookings(booking_id INT GENERATED ALWAYS AS IDENTITY, home_id INT, start_date DATE, end_date DATE, PRIMARY KEY(booking_id), CONSTRAINT fk_home FOREIGN KEY(home_id) REFERENCES homes(home_id));')
  end

  task :seed_bookings_test do
    connection = PG.connect dbname: 'mcairbnb_test'
    connection.exec('TRUNCATE TABLE bookings')
    connection.exec("INSERT INTO bookings (start_date, end_date) VALUES ('2022-04-03', '2022-04-07');")
  end
end

namespace :remove do
  task all: %i[delete_db delete_db_test]

  task :delete_db do
    connection = PG.connect
    connection.exec('DROP DATABASE mcairbnb;')
  end

  task :delete_db_test do
    connection = PG.connect
    connection.exec('DROP DATABASE mcairbnb_test;')
  end
end
