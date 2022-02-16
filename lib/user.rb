# frozen_string_literal: true

require 'pg'
require 'bcrypt'

class User
  attr_reader :signup


  def self.signup(user_name, password)
    encrypted_password = BCrypt::Password.create(password)
    @user_name = user_name
    connection = PG.connect(dbname: 'mcairbnb')
    connection.exec("INSERT INTO users (name, password) VALUES ('#{@user_name}', '#{encrypted_password}');")
  end

  def self.login(user_name, password)
    connection = PG.connect(dbname: 'mcairbnb')
    result = connection.exec("SELECT * FROM users WHERE name = $1",
        [user_name]
    )
    return unless result.any?
  end
end
