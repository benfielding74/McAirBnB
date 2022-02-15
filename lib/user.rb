require 'pg'

class User

  attr_reader :signup :add_home

  def self.signup(user_name, password)
    @user_name = user_name
    @password = password
    connection = PG.connect(dbname: 'mcairbnb')
    connection.exec("INSERT INTO users (name, password) VALUES ('#{@user_name}', '#{@password}');")
  end

  def self.add_home(home_name, description, price)
    @home_name = home_name
    @description = description
    @price = price
    connection = PG.connect(dbname: 'mcairbnb')
    connection.exec("INSERT INTO homes (name, description, price) VALUES ('#{@home_name}', '#{@description}, '#{@price}');")
  end

end
