require 'user'

describe User do
  describe '.signup' do
    it 'creates a new user' do
      connection = PG.connect(dbname: 'mcairbnb')
      User.signup('John', 'Seekrit')
      result = connection.exec("SELECT * FROM users")
      expect(result).to include ('John')
    end
  end
end
