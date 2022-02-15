require 'pg'

class User

  attr_reader :signup

  def self.signup(user_name, password)
    @user_name = user_name
    @password = password
    connection = PG.connect(dbname: 'mcairbnb')
    connection.exec("INSERT INTO users (name, password) VALUES ('#{@user_name}', '#{@password}');")
  end

end
