# frozen_string_literal: true

require 'pg'
require 'bcrypt'

class User

  attr_reader :signup, :add_home
  


  def self.signup(user_name, password, db="mcairbnb")
  #  encrypted_password = BCrypt::Password.create(password)
    encrypted_password = password
    @user_name = user_name
    connection = PG.connect(dbname: db)
    connection.exec("INSERT INTO users (name, password) VALUES ('#{@user_name}', '#{encrypted_password}');")
    return connection
  end


  def self.add_home(name, description, price)
    connection = PG.connect(dbname: 'mcairbnb')
    connection.exec("INSERT INTO homes (name, description, price) VALUES ('#{name}','#{description}','#{price}');")
  end

  def self.login(user_name, password, db="mcairbnb")
    connection = PG.connect(dbname: db)
    result = connection.exec("SELECT * FROM users WHERE name = $1",
        [user_name]
    )
    if result.num_tuples.zero? 
      false
    else
      if result.values[0][2] == password
        true
      else
        false
      end
    end
  end
end
