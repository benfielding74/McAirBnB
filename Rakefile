require 'pg'


namespace :init do
  task all: [:create_db, :create_db_test]
  
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
  task all: [:setup_users, :seed_users, :setup_users_test, :seed_users_test]

  task :setup_users do
    connection = PG.connect :dbname => 'mcairbnb';
    connection.exec('CREATE TABLE users(id SERIAL PRIMARY KEY, name VARCHAR(60), password VARCHAR(60));')
  end

  task :seed_users do
    connection = PG.connect :dbname => 'mcairbnb';
    connection.exec ("INSERT INTO users (name, password) VALUES ('example_user', 'example_password');")
  end



  task :setup_users_test do
    connection = PG.connect :dbname => 'mcairbnb_test';
    connection.exec('CREATE TABLE users(id SERIAL PRIMARY KEY, name VARCHAR(60), password VARCHAR(60));')
  end

  task :seed_users_test do
    connection = PG.connect :dbname => 'mcairbnb_test';
    connection.exec ("INSERT INTO users (name, password) VALUES ('example_user', 'example_password');")
  end
end




namespace :homes do
  task all: [:setup_homes, :seed_homes, :setup_homes_test, :seed_homes_test]

  task :setup_homes do
    connection = PG.connect :dbname => 'mcairbnb';
    connection.exec('CREATE TABLE homes(id SERIAL PRIMARY KEY, name VARCHAR(60), description VARCHAR(255), price VARCHAR(8));')
  end

  task :seed_homes do
    connection = PG.connect :dbname => 'mcairbnb';
    connection.exec ("INSERT INTO homes(name, description, price) VALUES ('example_name', 'example_description', '9.99');")
  end



  task :setup_homes_test do
    connection = PG.connect :dbname => 'mcairbnb_test';
    connection.exec('CREATE TABLE homes(id SERIAL PRIMARY KEY, name VARCHAR(60), description VARCHAR(255), price VARCHAR(8));')
  end

  task :seed_homes_test do
    connection = PG.connect :dbname => 'mcairbnb_test';
    connection.exec ("INSERT INTO homes(name, description, price) VALUES ('example_name', 'example_description', 'example_price');")

  end
end
