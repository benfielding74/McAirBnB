# frozen_string_literal: true

require 'pg'
require 'bcrypt'

class User
  attr_reader :signup, :add_home

  @@connection = nil

  def self.connect(dbname)
    @@connection = PG.connect(dbname: dbname)
  end

  def self.signup(user_name, password)
    encrypted_password = BCrypt::Password.create(password)
    @@connection.exec("INSERT INTO users (name, password) VALUES ('#{user_name}', '#{encrypted_password}');")
    @@connection
  end

  def self.add_home(name, description, price)
    @@connection.exec("INSERT INTO homes (name, description, price) VALUES ('#{name}','#{description}','#{price}');")
    @@connection
  end

  def self.login(user_name, password)
    result = @@connection.exec('SELECT * FROM users WHERE name = $1', [user_name])
    result.num_tuples.zero? ? false : User.authenticate(result.values[0][2], password)
  end

  def self.authenticate(stored_password, password)
    BCrypt::Password.new(stored_password) == password
  end
end
