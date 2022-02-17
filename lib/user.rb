# frozen_string_literal: true

require 'pg'
require 'bcrypt'

class User
  attr_reader :signup

  def self.signup(user_name, password, db="mcairbnb")
    encrypted_password = BCrypt::Password.create(password)
    #encrypted_password = password
    @user_name = user_name
    connection = PG.connect(dbname: db)
    result = connection.exec("INSERT INTO users (name, password) VALUES ('#{@user_name}', '#{encrypted_password}');")
    return connection
  end

  def self.login(user_name, password, db="mcairbnb")
    connection = PG.connect(dbname: db)
    result = connection.exec("SELECT * FROM users WHERE name = $1",
        [user_name]
    )

    result.num_tuples.zero? ? false : User.authenticate(result.values[0][2], password)
  end

  private

  def self.authenticate(stored_password, password)
    BCrypt::Password.new(stored_password) == password
  end
end
