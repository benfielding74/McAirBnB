# frozen_string_literal: true

require 'user'

describe User do
  describe '.signup' do
    it 'creates a new user' do
      User.connect('mcairbnb_test')
      connection = User.signup('John', 'Seekrit')
      result = connection.exec('SELECT name FROM users')
      result = result.map { |user| user['name'] }
      expect(result).to include('John')
    end
  end

  describe '.login' do
    it 'checks password is correct' do
      result = User.login('Ben', 'Password')
      expect(result).to eq false
    end

    it 'prompts to re-enter if name or password is incorrect' do
      connection = User.signup('Benf', 'Seekrit', db='mcairbnb_test')
      result = User.login('Steve', 'Seekrit', db='mcairbnb_test')
      expect(result).to eq false
    end

    it 'allows a user to log in with correct credentials' do
      connection = User.signup('Barrington', 'SuperUser', db='mcairbnb_test')
      result = User.login('Barrington', 'SuperUser', db='mcairbnb_test')
      expect(result).to eq true
    end
    
  end
end
