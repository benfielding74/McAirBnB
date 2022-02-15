require 'pg'


namespace :users do
  task all: [:setup_users, :seed_users, :setup_users_test, :seed_users_test]

  task :setup_users do
    connection = PG.connect
    connection.exec('CREATE DATABASE mcairbnb;')

    connection = PG.connect :dbname => 'mcairbnb';
    connection.exec('CREATE TABLE users(id SERIAL PRIMARY KEY, name VARCHAR(60), password VARCHAR(60));')
  end

  task :seed_users do
    connection = PG.connect :dbname => 'mcairbnb';
    connection.exec ("INSERT INTO users (name, password) VALUES ('example_user', 'example_password');")
  end



  task :setup_users_test do
    connection = PG.connect
    connection.exec('CREATE DATABASE mcairbnb_test;')

    connection = PG.connect :dbname => 'mcairbnb_test';
    connection.exec('CREATE TABLE users(id SERIAL PRIMARY KEY, name VARCHAR(60), password VARCHAR(60));')
  end

  task :seed_users_test do
    connection = PG.connect :dbname => 'mcairbnb_test';
    connection.exec ("INSERT INTO users (name, password) VALUES ('example_user', 'example_password');")
  end




  namespace :spaces do
  task all: [:setup_spaces, :seed_spaces, :setup_spaces_test, :seed_spaces_test]

  task :setup_spaces do
    connection = PG.connect
    connection.exec('CREATE DATABASE mcairbnb;')

    connection = PG.connect :dbname => 'mcairbnb';
    connection.exec('CREATE TABLE spaces(id SERIAL PRIMARY KEY, name VARCHAR(60), description VARCHAR(255), price VARCHAR(8));')
  end

  task :seed_spaces do
    connection = PG.connect :dbname => 'mcairbnb';
    connection.exec ("INSERT INTO spaces (name, description, price) VALUES ('example_name', 'example_description', 'example_price');")
  end



  task :setup_spaces_test do
    connection = PG.connect
    connection.exec('CREATE DATABASE mcairbnb_test;')

    connection = PG.connect :dbname => 'mcairbnb_test';
    connection.exec('CREATE TABLE spaces(id SERIAL PRIMARY KEY, name VARCHAR(60), description VARCHAR(255), price VARCHAR(8));')
  end

  task :seed_spaces_test do
    connection = PG.connect :dbname => 'mcairbnb_test';
    connection.exec ("INSERT INTO spaces (name, description, price) VALUES ('example_name', 'example_description', 'example_price');")

  end
end
